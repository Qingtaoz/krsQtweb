package com.qt.webframe.crm.web;

import com.alibaba.fastjson.JSON;
import com.qt.webframe.crm.pojo.Customer;
import com.qt.webframe.crm.service.CustomerService;
import com.qt.webframe.system.annotation.Authentication;
import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.controller.BaseController;
import com.qt.webframe.system.pojoweb.DTRespAjax;
import com.qt.webframe.system.response.JumpResponse;
import com.qt.webframe.system.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Slash on 2017/6/21.
 */
@Controller
@RequestMapping(value = "/cust")
public class CustomerController extends BaseController {

    private String RET_MSG_ADDCUST_200 = "组织客户添加成功，请稍候……";
    private String RET_MSG_ADDCUST_400 = "组织客户添加失败，字段校验出错。";
    private String RET_MSG_ADDCUST_401 = "组织客户添加失败，客户编码已经存在。";
    private String RET_MSG_ADDCUST_402 = "组织客户添加失败，客户名称已经存在。";
    private String RET_MSG_ADDCUST_500 = "组织客户添加失败，服务器发生错误。";

    private String RET_MSG_ADDDEPTCUST_200 = "部门客户添加成功，请稍候……";
    private String RET_MSG_ADDDEPTCUST_400 = "部门客户添加失败，字段校验出错。";
    private String RET_MSG_ADDDEPTCUST_401 = "部门客户添加失败，客户编码已经存在。";
    private String RET_MSG_ADDDEPTCUST_402 = "部门客户添加失败，客户名称已经存在。";
    private String RET_MSG_ADDDEPTCUST_500 = "部门客户添加失败，服务器发生错误。";

    @Resource
    private CustomerService customerService;

    @Resource
    private DeptService deptService;

    @RequestMapping(value = "/org/checkallcustlist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "CUST_ORG_CHECKALLCUSTLIST")
    @ResponseBody
    public DTRespAjax getOrgCustomerList(HttpServletRequest request, @RequestParam("draw") int draw,
                                     @RequestParam("order[0][dir]") String order_dir,
                                     @RequestParam("start") int start,
                                     @RequestParam("length") int length) {
        String searchString = "";
        if(request.getParameter("searchString")!=null){
            searchString = request.getParameter("searchString");
        }
        String[][] array = customerService.getOrgCustomerArray(order_dir,searchString,start,length);
        return array2DtRespAjax(array,draw,length);
    }

    @RequestMapping(value = "/org/addorgcust", method = {RequestMethod.POST}, produces = "application/json")
    @Authentication(value = "CUST_ORG_ADDORGCUST")
    @ResponseBody
    public JumpResponse addOrgCustomer(HttpServletRequest request, @RequestParam String data) {
        String actionUserid = request.getAttribute(SysParams.ACTION_USERID).toString();
        Customer customer = JSON.parseObject(data, Customer.class);
        String msg = validate(customer);
        JumpResponse response = new JumpResponse();
        if (!StringUtils.isEmpty(msg)) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDCUST_400 + "<br>" + msg);
            return response;
        }
        if(customerService.checkCustomerNoIsExist(customer.getCustomerno())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDCUST_401);
            return response;
        }
        if(customerService.checkCustomerNameIsExist(customer.getCustomername())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDCUST_402);
            return response;
        }
        try{
            customerService.addOrgCustomer(customer, actionUserid);
        }catch (Exception e){
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_ADDCUST_500+":"+e.getMessage());
            return response;
        }
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_ADDCUST_200);
        response.setJumpUrl("/status_success.html");
        return response;
    }

    @RequestMapping(value = "/dept/checkcustlist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "CUST_DEPT_CHECKCUSTLIST")
    @ResponseBody
    public DTRespAjax getDeptCustomerList(HttpServletRequest request, @RequestParam("draw") int draw,
                                         @RequestParam("order[0][dir]") String order_dir,
                                         @RequestParam("start") int start,
                                         @RequestParam("length") int length) {
        String deptId = deptService.getDeptIdByUserId(request.getAttribute(SysParams.ACTION_USERID).toString());
        String searchString = "";
        if(request.getParameter("searchString")!=null){
            searchString = request.getParameter("searchString");
        }
        String[][] array = customerService.getDeptCustomerArray(order_dir,searchString,start,length,deptId);
        return array2DtRespAjax(array,draw,length);
    }

    @RequestMapping(value = "/dept/adddeptcust", method = {RequestMethod.POST}, produces = "application/json")
    @Authentication(value = "CUST_DEPT_ADDDEPTCUST")
    @ResponseBody
    public JumpResponse addDeptCustomer(HttpServletRequest request, @RequestParam String data) {
        String actionUserid = request.getAttribute(SysParams.ACTION_USERID).toString();
        Customer customer = JSON.parseObject(data, Customer.class);
        String msg = validate(customer);
        JumpResponse response = new JumpResponse();
        if (!StringUtils.isEmpty(msg)) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTCUST_400 + "<br>" + msg);
            return response;
        }
        if(customerService.checkCustomerNoIsExist(customer.getCustomerno())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTCUST_401);
            return response;
        }
        if(customerService.checkCustomerNameIsExist(customer.getCustomername())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTCUST_402);
            return response;
        }
        try{
            customerService.addDeptCustomer(customer, actionUserid);
        }catch (Exception e){
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_ADDDEPTCUST_500+":"+e.getMessage());
            return response;
        }
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_ADDDEPTCUST_200);
        response.setJumpUrl("/status_success.html");
        return response;
    }
}
