package com.qt.webframe.system.interceptor;

import com.qt.webframe.system.annotation.Authentication;
import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.service.SysService;
import com.qt.webframe.system.session.UserSession;
import com.qt.webframe.system.web.PageController;
import org.springframework.util.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 全局基础拦截器，用户权限验证
 * Created by Slash on 2017/1/13.
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

    private static final String RET_CODE_402 = "402";//TOKEN过期
    private static final String RET_CODE_403 = "403";//权限禁止
    private static final String RET_MSG_EXPIRY = "登录超时，请重新登录。";
    private static final String RET_MSG_FORBIDDEN = "权限禁止，用户没有该操作权限。";

    @Resource
    private SysService sysService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
            //页面请求拦截
            HandlerMethod method = (HandlerMethod) handler;
            if (method.getBeanType() == PageController.class) {
                return true;
            }

            //没有声明需要权限,或者声明不验证权限
            Authentication authentication = ((HandlerMethod) handler).getMethodAnnotation(Authentication.class);
            if (authentication == null || authentication.validate() == false) {
                return true;
            }
            if (request.getSession().getAttribute(SysParams.CURRENT_USER) == null) {
                response.setHeader("errCode",RET_CODE_402);
                response.setHeader("errMsg",RET_MSG_EXPIRY);
                return false;
            }
            String token = ((UserSession) request.getSession().getAttribute(SysParams.CURRENT_USER)).getToken();
            if (!StringUtils.isEmpty(token)) {
                String userId = sysService.getUseridByToken(token);
                if (!StringUtils.isEmpty(userId)) {
                    Boolean hasAuth = sysService.checkUserAuth(userId, authentication.authName());
                    if (hasAuth) {
                        request.setAttribute(SysParams.ACTION_USERID, userId);
                        return true;
                    }
                }
            }
            response.setHeader("errCode",RET_CODE_403);
            response.setHeader("errMsg",RET_MSG_FORBIDDEN);
            return false;
        }
        return false;
    }
}
