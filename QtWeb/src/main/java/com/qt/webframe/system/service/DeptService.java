package com.qt.webframe.system.service;

import com.qt.webframe.system.dao.DepartmentMapper;
import com.qt.webframe.system.dao.R_dept_userMapper;
import com.qt.webframe.system.dao.UserMapper;
import com.qt.webframe.system.pojo.Department;
import com.qt.webframe.system.pojo.R_dept_user;
import com.qt.webframe.system.pojo.User;
import com.qt.webframe.system.utils.StringUtil;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Slash on 2017/5/18.
 */
@Service
public class DeptService {

    @Resource
    private R_dept_userMapper rDeptUserMapper;

    @Resource
    private UserMapper userMapper;

    /**
     * 根据用户id获取部门id（用户部门为多对一的关系）
     * @param userid
     * @return
     */
    public String getDeptIdByUserId(String userid){
        R_dept_user rDeptUser = rDeptUserMapper.selectByUserId(userid);
        return rDeptUser==null?"":rDeptUser.getDeptid();
    }

    public String[][] getDeptUserArray(String order_dir, String searchString, int start, int length,String deptid) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "user.username");
        map.put("dir", order_dir);
        map.put("deptid", deptid);
        List<User> users = userMapper.selectDeptUserListByStr(map, start, length);
        int size = users.size();
        strings = new String[size][11];
        for (int i = 0; i < size; i++) {
            strings[i][0] = "";
            strings[i][1] = StringUtil.o2String(users.get(i).getUsername());
            strings[i][2] = StringUtil.o2String(users.get(i).getNickname());
            strings[i][3] = StringUtil.o2String(users.get(i).getPhonenum());
            strings[i][4] = StringUtil.o2String(users.get(i).getEmail());
            strings[i][5] = StringUtil.o2String(users.get(i).getSex());
            strings[i][6] = StringUtil.dateTime2DateString(users.get(i).getBirthdate());
            strings[i][7] = StringUtil.o2String(users.get(i).getRealname());
            strings[i][8] = StringUtil.o2String(users.get(i).getProvince());
            strings[i][9] = StringUtil.o2String(users.get(i).getCity());
            strings[i][10] = StringUtil.o2String(users.get(i).getAddress());
        }
        return strings;
    }
}
