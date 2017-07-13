package com.qt.webframe.system.web;

import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Slash on 2017/5/24.
 */
@Controller
public class PageController extends BaseController {

    @RequestMapping(value = "{pageName}.html")
    public String getPages(HttpSession session,@PathVariable String pageName) {
        if (session.getAttribute(SysParams.CURRENT_USER) != null){
            return pageName.replace('_', '/');
        }
        return "status/expiry";
    }

    @RequestMapping(value = "login.html")
    public String getLoginPage(HttpSession session) {
        if (session.getAttribute(SysParams.CURRENT_USER) != null) {
            return "main";
        }
        return "login";
    }

    @RequestMapping(value = "main.html")
    public String getMainPage(HttpSession session) {
        if (session.getAttribute(SysParams.CURRENT_USER) != null) {
            return "main";
        }
        return "login";
    }
}
