package com.qt.webframe.crm.service;

import com.qt.webframe.crm.dao.R_dept_tradeMapper;
import com.qt.webframe.crm.dao.TradeMapper;
import com.qt.webframe.crm.pojo.R_dept_trade;
import com.qt.webframe.crm.pojo.Trade;
import com.qt.webframe.system.service.DeptService;
import com.qt.webframe.system.utils.IdGenerator;
import com.qt.webframe.system.utils.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Slash on 2017/6/21.
 */
@Service
public class TradeService {

    @Resource
    private TradeMapper tradeMapper;

    @Resource
    private R_dept_tradeMapper rDeptTradeMapper;

    @Resource
    private DeptService deptService;

    public String[][] getOrgTradeArray(String order_dir, String searchString, int start, int length) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "tradeNo");
        map.put("dir", order_dir);
        List<Trade> trades = tradeMapper.selectTraListByStr(map, start, length);
        int size = trades.size();
        strings = new String[size][14];
        for (int i = 0; i < size; i++) {
            strings[i][0] = "";
            strings[i][1] = StringUtil.o2String(trades.get(i).getTradeno());
            strings[i][2] = StringUtil.o2String(trades.get(i).getCustomerno());
            strings[i][3] = StringUtil.o2String(trades.get(i).getProductno());
            strings[i][4] = StringUtil.o2String(trades.get(i).getModules());
            strings[i][5] = StringUtil.o2String(trades.get(i).getCount());
            strings[i][6] = StringUtil.o2String(trades.get(i).getAmount());
            strings[i][7] = StringUtil.dateTime2DateString(trades.get(i).getFreeserver());
            strings[i][8] = StringUtil.o2String(trades.get(i).getSerialnumber());
            strings[i][9] = StringUtil.o2String(trades.get(i).getCdkey());
            strings[i][10] = StringUtil.o2String(trades.get(i).getSignatures());
            strings[i][11] = StringUtil.o2String(trades.get(i).getEncryptiontype());
            strings[i][12] = StringUtil.o2String(trades.get(i).getVoucherpapertype());
            strings[i][13] = StringUtil.dateTime2DateString(trades.get(i).getTradedate());

        }
        return strings;
    }
    @Transactional
    public void addOrgTrade(Trade trade, String actionUserid) {
        trade.setTradeid(IdGenerator.getUUID());
        trade.setIsdel(false);
        trade.setCreateuserid(actionUserid);
        trade.setCreatedatetime(new Date());
        if (tradeMapper.insertSelective(trade) == 0) {
            throw new RuntimeException();
        }
    }

    public String[][] getDeptTradeArray(String order_dir, String searchString, int start, int length,String deptid) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "tra.tradeNo");
        map.put("dir", order_dir);
        map.put("deptid", deptid);
        List<Trade> trades = tradeMapper.selectDeptTraListByStr(map, start, length);
        int size = trades.size();
        strings = new String[size][14];
        for (int i = 0; i < size; i++) {
            strings[i][0] = "";
            strings[i][1] = StringUtil.o2String(trades.get(i).getTradeno());
            strings[i][2] = StringUtil.o2String(trades.get(i).getCustomerno());
            strings[i][3] = StringUtil.o2String(trades.get(i).getProductno());
            strings[i][4] = StringUtil.o2String(trades.get(i).getModules());
            strings[i][5] = StringUtil.o2String(trades.get(i).getCount());
            strings[i][6] = StringUtil.o2String(trades.get(i).getAmount());
            strings[i][7] = StringUtil.dateTime2DateString(trades.get(i).getFreeserver());
            strings[i][8] = StringUtil.o2String(trades.get(i).getSerialnumber());
            strings[i][9] = StringUtil.o2String(trades.get(i).getCdkey());
            strings[i][10] = StringUtil.o2String(trades.get(i).getSignatures());
            strings[i][11] = StringUtil.o2String(trades.get(i).getEncryptiontype());
            strings[i][12] = StringUtil.o2String(trades.get(i).getVoucherpapertype());
            strings[i][13] = StringUtil.dateTime2DateString(trades.get(i).getTradedate());
        }
        return strings;
    }

    @Transactional
    public void addDeptTrade(Trade trade, String actionUserid) {
        String deptid = deptService.getDeptIdByUserId(actionUserid);
        if (StringUtils.isEmpty(deptid)) {
            throw new RuntimeException();
        }
        trade.setTradeid(IdGenerator.getUUID());
        trade.setIsdel(false);
        trade.setCreateuserid(actionUserid);
        trade.setCreatedatetime(new Date());
        if (tradeMapper.insertSelective(trade) == 0) {
            throw new RuntimeException();
        }
        R_dept_trade r_dept_trade = new R_dept_trade();
        r_dept_trade.setDeptid(deptid);
        r_dept_trade.setTradeid(trade.getTradeid());
        if (rDeptTradeMapper.insertSelective(r_dept_trade) == 0) {
            throw new RuntimeException();
        }
    }

    public boolean checkTradeNoIsExist(String tradeno) {
        Trade trade = tradeMapper.selectByTradeNo(tradeno);
        return trade == null ? false : true;
    }
}
