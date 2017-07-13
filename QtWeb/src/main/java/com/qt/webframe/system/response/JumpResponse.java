package com.qt.webframe.system.response;

/**
 * 跳转响应体，用于ajax请求成功，返回执行页面跳转
 * Created by Slash on 2017/5/24.
 */
public class JumpResponse extends BaseResponse {

    //跳转地址
    private String jumpUrl;

    public String getJumpUrl() {
        return jumpUrl;
    }

    public void setJumpUrl(String jumpUrl) {
        this.jumpUrl = jumpUrl;
    }
}
