package com.qt.webframe.system.web;

import com.alibaba.fastjson.JSON;
import com.qt.webframe.system.annotation.Authentication;
import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.controller.BaseController;
import com.qt.webframe.system.pojo.User;
import com.qt.webframe.system.pojoweb.OrgAndManager;
import com.qt.webframe.system.pojoweb.WebMenu;
import com.qt.webframe.system.response.JumpResponse;
import com.qt.webframe.system.service.SysService;
import com.qt.webframe.system.session.UserSession;
import com.qt.webframe.system.utils.IdGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Desc
 * Created by Slash on 2017/5/18.
 */
@Controller
@RequestMapping(value = "/sys")
public class SysController extends BaseController {

    private static final String RET_MSG_LOGIN_500 = "登录失败，服务器发生错误。";
    private static final String RET_MSG_LOGIN_400 = "登录失败，用户名或者密码错误。";
    private static final String RET_MSG_LOGIN_200 = "登录成功，请稍后。。。";

    private static final String RET_MSG_INITORG_500 = "组织创建失败，服务器发生错误。";
    private static final String RET_MSG_INITORG_400 = "组织创建失败，字段校验出错。";
    private static final String RET_MSG_INITORG_200 = "组织创建成功，请稍候……";

    private static final String RET_MSG_LOGOUT_200 = "用户已注销";

    @Resource
    private SysService sysService;

    /**
     * 登录
     *
     * @param session
     * @param username
     * @param password
     * @return
     */
    @RequestMapping(value = "/login", method = {RequestMethod.POST}, produces = "application/json")
    @ResponseBody
    public JumpResponse login(HttpSession session, @RequestParam String username, @RequestParam String password) {
        JumpResponse response = new JumpResponse();
        User user = sysService.getUserByUsernamePassword(username, password);
        if (user == null) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_LOGIN_400);
            return response;
        }
        UserSession userSession = new UserSession();
        String token = IdGenerator.getUUID();
        String userid = user.getUserid();
        String nickname = user.getNickname();
        try {
            sysService.addUserToken(userid, token);
        } catch (Exception e) {
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_LOGIN_500 + ":" + e.getMessage());
            return response;
        }
        userSession.setToken(token);
        userSession.setUserNickName(nickname);
        List<WebMenu> menus = sysService.getUserMenusByUserId(userid);
        userSession.setMenus(menus);
        userSession.setOrgName(sysService.getOrgName());
        session.setAttribute(SysParams.CURRENT_USER, userSession);
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_LOGIN_200);
        response.setJumpUrl("/main.html");
        return response;
    }

    /**
     * 注销
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout", method = {RequestMethod.POST}, produces = "application/json")
    @ResponseBody
    public JumpResponse logout(HttpSession session) {
        JumpResponse response = new JumpResponse();
        session.removeAttribute(SysParams.CURRENT_USER);
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_LOGOUT_200);
        response.setJumpUrl("/login.html");
        return response;
    }

    /**
     * 组织初始化
     *
     * @param request
     * @param data
     * @return
     */
    @RequestMapping(value = "/org/addorgandmanager", method = {RequestMethod.POST}, produces = "application/json")
    @Authentication(value = "SYS_ORG_ADDORGANDMANAGER")
    @ResponseBody
    public JumpResponse addorgandmanager(HttpServletRequest request, @RequestParam String data) {
        String actionUserid = request.getAttribute(SysParams.ACTION_USERID).toString();
        OrgAndManager orgAndManager = JSON.parseObject(data, OrgAndManager.class);
        String msg = validate(orgAndManager);
        JumpResponse response = new JumpResponse();
        if (!StringUtils.isEmpty(msg)) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_INITORG_400 + ":" + msg);
            return response;
        }
        try {
            sysService.addorgandmanager(orgAndManager, actionUserid);
        } catch (Exception e) {
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_INITORG_500+":"+e.getMessage());
            return response;
        }
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_INITORG_200);
        response.setJumpUrl("/status_success.html");
        return response;
    }
}
