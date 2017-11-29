package com.qt.webframe.system.session;

import com.qt.webframe.system.pojoweb.WebMenu;

import java.util.List;

/**
 * @Desc 用户session类
 * Created by Slash on 2017/5/22.
 */
public class UserSession {

//    随机token，用户权限校验
    private String token;

//    用户昵称
    private String userNickName;

//    菜单列表，用于生成页面菜单
    private List<WebMenu> menus;

    private String orgName;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }

    public List<WebMenu> getMenus() {
        return menus;
    }

    public void setMenus(List<WebMenu> menus) {
        this.menus = menus;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
}
