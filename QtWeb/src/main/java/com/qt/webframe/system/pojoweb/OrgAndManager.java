package com.qt.webframe.system.pojoweb;


import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.NotNull;

/**
 * Created by Slash on 2017/5/22.
 */
public class OrgAndManager {

    @NotNull(message = "组织名称不能为空")
    private String orgName;

    @NotNull(message = "管理用户不能为空")
    private String mangerName;

    @NotNull(message = "管理密码不能为空")
    private String managerPassWord;

    @NotNull(message = "管理昵称不能为空")
    private String managerNickName;

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getMangerName() {
        return mangerName;
    }

    public void setMangerName(String mangerName) {
        this.mangerName = mangerName;
    }

    public String getManagerPassWord() {
        return managerPassWord;
    }

    public void setManagerPassWord(String managerPassWord) {
        this.managerPassWord = managerPassWord;
    }

    public String getManagerNickName() {
        return managerNickName;
    }

    public void setManagerNickName(String managerNickName) {
        this.managerNickName = managerNickName;
    }
}
