package com.qt.webframe.system.response;

/**
 * 响应体
 * Created by Slash on 2017/5/23.
 */
public class BaseResponse {
    //响应码
    private String code;
    //响应信息
    private String msg;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
