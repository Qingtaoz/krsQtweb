package com.qt.webframe.system.service;

import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.dao.*;
import com.qt.webframe.system.pojo.Department;
import com.qt.webframe.system.pojo.R_dept_user;
import com.qt.webframe.system.pojo.R_user_role;
import com.qt.webframe.system.pojo.User;
import com.qt.webframe.system.utils.IdGenerator;
import com.qt.webframe.system.utils.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Slash on 2017/5/18.
 */
@Service
public class OrgService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private DepartmentMapper departmentMapper;

    @Resource
    private R_dept_userMapper rDeptUserMapper;

    @Resource
    private R_user_roleMapper rUserRoleMapper;

    @Resource
    private RoleMapper roleMapper;

    @Transactional
    public void addUser(User user, String actionUserid) {
        user.setUserid(IdGenerator.getUUID());
        user.setIsforbidden(false);
        user.setIsdel(false);
        user.setCreateuserid(actionUserid);
        user.setCreatedatetime(new Date());
        if (userMapper.insertSelective(user) == 0) {
            throw new RuntimeException();
        }
    }

    public String[][] getOrgUserArray(String order_dir, String searchString, int start, int length) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "username");
        map.put("dir", order_dir);
        List<User> users = userMapper.selectOrgUserListByStr(map, start, length);
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

    public String[][] getNoDeptUserArray(String order_dir, String searchString, int start, int length) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "username");
        map.put("dir", order_dir);
        List<User> users = userMapper.selectNoDeptUserListByStr(map, start, length);
        int size = users.size();
        strings = new String[size][12];
        for (int i = 0; i < size; i++) {
            strings[i][0] = "";
            strings[i][1] = StringUtil.o2String(users.get(i).getUsername());
            strings[i][2] = StringUtil.o2String(users.get(i).getNickname());
            strings[i][3] = StringUtil.o2String(users.get(i).getPhonenum());
        }
        return strings;
    }

    @Transactional
    public void addDept(Department department, String actionUserid) {
        department.setDeptid(IdGenerator.getUUID());
        department.setIsdel(false);
        department.setCreateuserid(actionUserid);
        department.setCreatedatetime(new Date());
        if (departmentMapper.insertSelective(department) == 0) {
            throw new RuntimeException();
        }
        User user = userMapper.selectByUsername(department.getDeptmanageruname());
        if (user == null) {
            throw new RuntimeException();
        }
        R_dept_user rDeptUser = new R_dept_user();
        rDeptUser.setDeptid(department.getDeptid());
        rDeptUser.setUserid(user.getUserid());
        if (rDeptUserMapper.insertSelective(rDeptUser) == 0) {
            throw new RuntimeException();
        }
        R_user_role rUserRole = new R_user_role();
        rUserRole.setUserid(user.getUserid());
        rUserRole.setRoleid(roleMapper.selectRoleIdByName(SysParams.ROLE_DEPT_MANAGER).getRoleid());
        if (rUserRoleMapper.insert(rUserRole) == 0) {
            throw new RuntimeException();
        }
    }

    /**
     * 检测用户名是否已经存在
     *
     * @param username
     * @return
     */
    public boolean checkUserIsExist(String username) {
        User user = userMapper.selectByUsername(username);
        return user == null ? false : true;
    }

    /**
     * 检测部门No是否已经存在
     *
     * @param deptNo
     * @return
     */
    public boolean checkDeptNoIsExist(String deptNo) {
        Department department = departmentMapper.selectByDeptNo(deptNo);
        return department == null ? false : true;
    }

    /**
     * 检测部门name是否已经存在
     *
     * @param deptName
     * @return
     */
    public boolean checkDeptNameIsExist(String deptName) {
        Department department = departmentMapper.selectByDeptName(deptName);
        return department == null ? false : true;
    }

    public String[][] getDeptArray(String order_dir, String searchString, int start, int length) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "deptno");
        map.put("dir", order_dir);
        List<Department> departments = departmentMapper.selectDeptListByStr(map, start, length);
        int size = departments.size();
        strings = new String[size][6];
        for (int i = 0; i < size; i++) {
            strings[i][0] = "";
            strings[i][1] = StringUtil.o2String(departments.get(i).getDeptno());
            strings[i][2] = StringUtil.o2String(departments.get(i).getDeptname());
            strings[i][3] = StringUtil.o2String(departments.get(i).getDeptname());
            strings[i][4] = StringUtil.o2String(departments.get(i).getDeptmanageruname());
            strings[i][5] = StringUtil.dateTime2DateString(departments.get(i).getCreatedatetime());
        }
        return strings;
    }
}
