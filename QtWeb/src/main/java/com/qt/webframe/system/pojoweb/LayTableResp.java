package com.qt.webframe.system.pojoweb;

/**
 * Created by Slash on 2017/7/24.
 */
public class LayTableResp {
    private int totalDataCount;
    private String[][] data;

    public int getTotalDataCount() {
        return totalDataCount;
    }

    public void setTotalDataCount(int totalDataCount) {
        this.totalDataCount = totalDataCount;
    }

    public String[][] getData() {
        return data;
    }

    public void setData(String[][] data) {
        this.data = data;
    }
}
