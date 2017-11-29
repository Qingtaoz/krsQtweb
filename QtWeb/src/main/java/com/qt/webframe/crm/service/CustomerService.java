package com.qt.webframe.crm.service;

import com.qt.webframe.crm.dao.CustomerMapper;
import com.qt.webframe.crm.dao.R_dept_custMapper;
import com.qt.webframe.crm.pojo.Customer;
import com.qt.webframe.crm.pojo.R_dept_cust;
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
 * @Desc
 * Created by Slash on 2017/6/21.
 */
@Service
public class CustomerService {

    @Resource
    private CustomerMapper customerMapper;

    @Resource
    private DeptService deptService;

    @Resource
    private R_dept_custMapper rDeptCustMapper;

    public String[][] getOrgCustomerArray(String order_dir, String searchString, int start, int length) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "customerno");
        map.put("dir", order_dir);
        List<Customer> customers = customerMapper.selectCustListByStr(map, start, length);
        int size = customers.size();
        strings = new String[size][10];
        for (int i = 0; i < size; i++) {
            strings[i][0] = "";
            strings[i][1] = StringUtil.o2String(customers.get(i).getCustomerno());
            strings[i][2] = StringUtil.o2String(customers.get(i).getCustomername());
            strings[i][3] = StringUtil.o2String(customers.get(i).getCustfrom());
            strings[i][4] = StringUtil.o2String(customers.get(i).getRelax());
            strings[i][5] = StringUtil.o2String(customers.get(i).getTelphone());
            strings[i][6] = StringUtil.o2String(customers.get(i).getPhone());
            strings[i][7] = StringUtil.o2String(customers.get(i).getEmail());
            strings[i][8] = StringUtil.o2String(customers.get(i).getAddress());
            strings[i][9] = StringUtil.dateTime2DateString(customers.get(i).getCreatedatetime());
        }
        return strings;
    }

    @Transactional
    public void addOrgCustomer(Customer customer, String actionUserid) {
        customer.setCustomerid(IdGenerator.getUUID());
        customer.setIsdel(false);
        customer.setCreateuserid(actionUserid);
        customer.setCreatedatetime(new Date());
        if(customerMapper.insertSelective(customer)==0){
            throw new RuntimeException();
        }
    }

    public String[][] getDeptCustomerArray(String order_dir, String searchString, int start, int length,String deptId) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "cust.customerno");
        map.put("dir", order_dir);
        map.put("deptid",deptId);
        List<Customer> customers = customerMapper.selectDeptCustListByStr(map, start, length);
        int size = customers.size();
        strings = new String[size][10];
        for (int i = 0; i < size; i++) {
            strings[i][0] = "";
            strings[i][1] = StringUtil.o2String(customers.get(i).getCustomerno());
            strings[i][2] = StringUtil.o2String(customers.get(i).getCustomername());
            strings[i][3] = StringUtil.o2String(customers.get(i).getCustfrom());
            strings[i][4] = StringUtil.o2String(customers.get(i).getRelax());
            strings[i][5] = StringUtil.o2String(customers.get(i).getTelphone());
            strings[i][6] = StringUtil.o2String(customers.get(i).getPhone());
            strings[i][7] = StringUtil.o2String(customers.get(i).getEmail());
            strings[i][8] = StringUtil.o2String(customers.get(i).getAddress());
            strings[i][9] = StringUtil.dateTime2DateString(customers.get(i).getCreatedatetime());
        }
        return strings;
    }


    @Transactional
    public void addDeptCustomer(Customer customer, String actionUserid) {
        String deptId = deptService.getDeptIdByUserId(actionUserid);
        if (StringUtils.isEmpty(deptId)){
            throw new RuntimeException();
        }
        customer.setCustomerid(IdGenerator.getUUID());
        customer.setIsdel(false);
        customer.setCreateuserid(actionUserid);
        customer.setCreatedatetime(new Date());
        if(customerMapper.insertSelective(customer)==0){
            throw new RuntimeException();
        }
        R_dept_cust rDeptCust = new R_dept_cust();
        rDeptCust.setDeptid(deptId);
        rDeptCust.setCustomerid(customer.getCustomerid());
        if(rDeptCustMapper.insertSelective(rDeptCust)==0){
            throw new RuntimeException();
        }
    }



    public boolean checkCustomerNoIsExist(String custNo){
        Customer customer = customerMapper.selectByCustNo(custNo);
        return customer == null ? false : true;
    }
    public boolean checkCustomerNameIsExist(String custName){
        Customer customer = customerMapper.selectByCustName(custName);
        return customer == null ? false : true;
    }
}
