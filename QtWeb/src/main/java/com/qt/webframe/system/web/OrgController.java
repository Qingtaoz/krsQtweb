package com.qt.webframe.system.web;

import com.alibaba.fastjson.JSON;
import com.qt.webframe.system.annotation.Authentication;
import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.controller.BaseController;
import com.qt.webframe.system.pojo.Department;
import com.qt.webframe.system.pojo.User;
import com.qt.webframe.system.pojoweb.DTRespAjax;
import com.qt.webframe.system.pojoweb.LayTableResp;
import com.qt.webframe.system.response.JumpResponse;
import com.qt.webframe.system.response.TableResponse;
import com.qt.webframe.system.service.OrgService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Desc
 * Created by Slash on 2017/5/18.
 */
@Controller
@RequestMapping(value = "/org")
public class OrgController extends BaseController {

    private String RET_MSG_ADDUSER_200 = "组织用户添加成功，请稍候……";
    private String RET_MSG_ADDUSER_400 = "组织用户添加失败，字段校验出错。";
    private String RET_MSG_ADDUSER_500 = "组织用户添加失败，服务器发生错误。";
    private String RET_MSG_ADDUSER_401 = "组织用户添加失败，用户名已存在。";

    private String RET_MSG_ADDDEPT_200 = "组织部门添加成功，请稍候……";
    private String RET_MSG_ADDDEPT_400 = "组织部门添加失败，字段校验出错。";
    private String RET_MSG_ADDDEPT_401 = "组织部门添加失败，非法管理员。";
    private String RET_MSG_ADDDEPT_402 = "组织部门添加失败，部门编码已存在。";
    private String RET_MSG_ADDDEPT_403 = "组织部门添加失败，部门名称已存在。";
    private String RET_MSG_ADDDEPT_500 = "组织部门添加失败，服务器发生错误。";

    @Resource
    private OrgService orgService;

    /**
     * 查询组织用户列表 datatables
     * @param request
     * @param draw
     * @param order_column
     * @param order_dir
     * @param search_string
     * @param search_regex
     * @param start
     * @param length
     * @return
     */
    @RequestMapping(value = "/user/checkorguserslist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "ORG_USER_CHECKORGUSERSLIST")
    @ResponseBody
    public DTRespAjax getOrgUserList(HttpServletRequest request, @RequestParam("draw") int draw,
                                     @RequestParam("order[0][column]") int order_column,
                                     @RequestParam("order[0][dir]") String order_dir,
                                     @RequestParam("search[value]") String search_string,
                                     @RequestParam("search[regex]") String search_regex,
                                     @RequestParam("start") int start,
                                     @RequestParam("length") int length) {
        String searchString = "";
        if(request.getParameter("searchString")!=null){
            searchString = request.getParameter("searchString");
        }
        String[][] array = orgService.getOrgUserArray(order_dir,searchString,start,length);
        return array2DtRespAjax(array,draw,length);
    }

    /**
     * 添加组织用户
     * @param request
     * @param data
     * @return
     */
    @RequestMapping(value = "/user/adduser", method = {RequestMethod.POST}, produces = "application/json")
    @Authentication(value = "ORG_USER_ADDUSER")
    @ResponseBody
    public JumpResponse addUser(HttpServletRequest request, @RequestParam String data) {
        String actionUserid = request.getAttribute(SysParams.ACTION_USERID).toString();
        User user = JSON.parseObject(data, User.class);
        String msg = validate(user);
        JumpResponse response = new JumpResponse();
        if (!StringUtils.isEmpty(msg)) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDUSER_400 + "<br>" + msg);
            return response;
        }
        if(orgService.checkUserIsExist(user.getUsername())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDUSER_401);
            return response;
        }
        try{
            orgService.addUser(user, actionUserid);
        }catch (Exception e){
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_ADDUSER_500+":"+e.getMessage());
            return response;
        }
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_ADDUSER_200);
        response.setJumpUrl("/status_success.html");
        return response;
    }


    @RequestMapping(value = "/dept/getnodeptuserlist",method = {RequestMethod.GET},produces = "application/json")
    @Authentication(value = "ORG_DEPT_ADDDEPT")
    @ResponseBody
    public DTRespAjax getNoDeptUserList(HttpServletRequest request, @RequestParam("draw") int draw,
                                        @RequestParam("order[0][column]") int order_column,
                                        @RequestParam("order[0][dir]") String order_dir,
                                        @RequestParam("search[value]") String search_string,
                                        @RequestParam("search[regex]") String search_regex,
                                        @RequestParam("start") int start,
                                        @RequestParam("length") int length){
        String searchString = "";
        if(request.getParameter("searchString")!=null){
            searchString = request.getParameter("searchString");
        }
        String[][] array = orgService.getNoDeptUserArray(order_dir,searchString,start,length);
        return array2DtRespAjax(array,draw,length);
    }

    @RequestMapping(value = "/dept/checkdeptlist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "ORG_DEPT_CHECKDEPTLIST")
    @ResponseBody
    public DTRespAjax getDeptList(HttpServletRequest request, @RequestParam("draw") int draw,
                                     @RequestParam("order[0][dir]") String order_dir,
                                     @RequestParam("start") int start,
                                     @RequestParam("length") int length) {
        String searchString = "";
        if(request.getParameter("searchString")!=null){
            searchString = request.getParameter("searchString");
        }
        String[][] array = orgService.getDeptArray(order_dir,searchString,start,length);
        return array2DtRespAjax(array,draw,length);
    }

    @RequestMapping(value = "/dept/getdeptlist",method = {RequestMethod.GET},produces = "application/json")
    @Authentication(value = "ORG_DEPT_CHECKDEPTLIST")
    @ResponseBody
    public TableResponse getDeptList(HttpServletRequest request,@RequestParam("page") int page,@RequestParam("limit") int limit){
        TableResponse response = new TableResponse();
        List<Department> lst = orgService.getDeptList();
        response.setCode("0");
        response.setMsg("");
        response.setCount(lst.size());
        response.setData(lst);
        return response;
    }


    @RequestMapping(value = "/dept/adddept",method = {RequestMethod.POST},produces = "application/json")
    @Authentication(value = "ORG_DEPT_ADDDEPT")
    @ResponseBody
    public JumpResponse addDept(HttpServletRequest request, @RequestParam String data){
        String actionUserId = request.getAttribute(SysParams.ACTION_USERID).toString();
        Department department = JSON.parseObject(data, Department.class);
        String msg = validate(department);
        JumpResponse response = new JumpResponse();
        if (!StringUtils.isEmpty(msg)) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPT_400 + "<br>" + msg);
            return response;
        }
        if(orgService.checkDeptNoIsExist(department.getDeptno())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPT_402);
            return response;
        }
        if(orgService.checkDeptNameIsExist(department.getDeptname())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPT_403);
            return response;
        }
        if(!orgService.checkUserIsExist(department.getDeptmanageruname())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPT_401);
            return response;
        }
        try{
            orgService.addDept(department, actionUserId);
        }catch (Exception e){
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_ADDDEPT_500+":"+e.getMessage());
            return response;
        }
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_ADDDEPT_200);
        response.setJumpUrl("/status_success.html");
        return response;
    }

    /**
     * 查询组织角色列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/role/checkorgroleslist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "ORG_ROLE_CHECKORGROLELIST")
    @ResponseBody
    public LayTableResp getOrgRoleList(HttpServletRequest request) {
        int start=0;
        int length=100;
        String[][] array = orgService.getOrgRoleArray(start,length);
        return array2LayTableResp(array,array.length);
    }
}
