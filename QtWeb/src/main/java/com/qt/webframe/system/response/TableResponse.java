package com.qt.webframe.system.response;

import java.util.List;

/**
 * Layui Table 数据响应response
 * Created by Slash on 2017/11/12.
 */
public class TableResponse extends BaseResponse {
    /**
     * 行数
     */
    private int count;
    /**
     * 数据
     */
    private Object data;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
