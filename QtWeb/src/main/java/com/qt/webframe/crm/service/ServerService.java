package com.qt.webframe.crm.service;

import com.qt.webframe.crm.dao.ServerMapper;
import com.qt.webframe.crm.pojo.Server;
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
 * @Desc
 * Created by Slash on 2017/6/21.
 */
@Service
public class ServerService {

    @Resource
    private ServerMapper serverMapper;

    public String[][] getOrgServerArray(String order_dir, String searchString, int start, int length) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "serverNo");
        map.put("dir", order_dir);
        List<Server> servers = serverMapper.selectServListByStr(map, start, length);
        int size = servers.size();
        strings = new String[size][13];
        for (int i = 0; i < size; i++) {
            strings[i][0] = "";
            strings[i][1] = StringUtil.o2String(servers.get(i).getServerno());
            strings[i][2] = StringUtil.o2String(servers.get(i).getTradeno());
            strings[i][3] = StringUtil.dateTime2DateString(servers.get(i).getStartdate());
            strings[i][4] = StringUtil.dateTime2DateString(servers.get(i).getEnddate());
            strings[i][5] = StringUtil.o2String(servers.get(i).getServertype());
            strings[i][6] = StringUtil.o2String(servers.get(i).getContent());
            strings[i][7] = StringUtil.o2String(servers.get(i).getAmount());
            strings[i][8] = StringUtil.dateTime2DateString(servers.get(i).getValiditydate());
            strings[i][9] = StringUtil.o2String(servers.get(i).getServusername());
            strings[i][10] = StringUtil.o2String(servers.get(i).getRelax());
            strings[i][11] = StringUtil.o2String(servers.get(i).getTelphone());
            strings[i][12] = StringUtil.o2String(servers.get(i).getRemark());
        }
        return strings;
    }

    @Transactional
    public void addServer(Server server, String actionUserid) {
        server.setServerid(IdGenerator.getUUID());
        server.setIsdel(false);
        server.setCreateuserid(actionUserid);
        server.setCreatedatetime(new Date());
        if(serverMapper.insertSelective(server)==0){
            throw new RuntimeException();
        }
    }

    @Transactional
    public void addDeptServer(Server server, String actionUserid) {
        server.setServerid(IdGenerator.getUUID());
        server.setIsdel(false);
        server.setCreateuserid(actionUserid);
        server.setCreatedatetime(new Date());
        if(serverMapper.insertSelective(server)==0){
            throw new RuntimeException();
        }
    }

    public boolean checkServerNoIsExist(String serverNo) {
        Server server = serverMapper.selectByServerNo(serverNo);
        return server==null?false:true;
    }

    public String[][] getDeptServerArray(String order_dir, String searchString, int start, int length, String deptid) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "serv.serverNo");
        map.put("dir", order_dir);
        map.put("deptid", deptid);
        List<Server> servers = serverMapper.selectDeptServListByStr(map, start, length);
        int size = servers.size();
        strings = new String[size][13];
        for (int i = 0; i < size; i++) {
            strings[i][0] = "";
            strings[i][1] = StringUtil.o2String(servers.get(i).getServerno());
            strings[i][2] = StringUtil.o2String(servers.get(i).getTradeno());
            strings[i][3] = StringUtil.dateTime2DateString(servers.get(i).getStartdate());
            strings[i][4] = StringUtil.dateTime2DateString(servers.get(i).getEnddate());
            strings[i][5] = StringUtil.o2String(servers.get(i).getServertype());
            strings[i][6] = StringUtil.o2String(servers.get(i).getContent());
            strings[i][7] = StringUtil.o2String(servers.get(i).getAmount());
            strings[i][8] = StringUtil.dateTime2DateString(servers.get(i).getValiditydate());
            strings[i][9] = StringUtil.o2String(servers.get(i).getServusername());
            strings[i][10] = StringUtil.o2String(servers.get(i).getRelax());
            strings[i][11] = StringUtil.o2String(servers.get(i).getTelphone());
            strings[i][12] = StringUtil.o2String(servers.get(i).getRemark());
        }
        return strings;
    }
}
