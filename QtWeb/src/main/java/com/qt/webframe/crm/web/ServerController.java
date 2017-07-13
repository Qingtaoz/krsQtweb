package com.qt.webframe.crm.web;

import com.alibaba.fastjson.JSON;
import com.qt.webframe.crm.pojo.Server;
import com.qt.webframe.crm.service.ServerService;
import com.qt.webframe.crm.service.TradeService;
import com.qt.webframe.system.annotation.Authentication;
import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.controller.BaseController;
import com.qt.webframe.system.pojoweb.DTRespAjax;
import com.qt.webframe.system.response.JumpResponse;
import com.qt.webframe.system.service.DeptService;
import com.qt.webframe.system.service.OrgService;
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
@RequestMapping(value = "/serv")
public class ServerController extends BaseController {

    private String RET_MSG_ADDSERVER_200 = "组织服务添加成功，请稍候……";
    private String RET_MSG_ADDSERVER_400 = "组织服务添加失败，字段校验出错。";
    private String RET_MSG_ADDSERVER_401 = "组织服务添加失败，服务编码已经存在。";
    private String RET_MSG_ADDSERVER_402 = "组织服务添加失败，非法交易编码。";
    private String RET_MSG_ADDSERVER_403 = "组织服务添加失败，非法用户编码。";
    private String RET_MSG_ADDSERVER_500 = "组织服务添加失败，服务器发生错误。";
    private String RET_MSG_ADDDEPTSERVER_200 = "部门服务添加成功，请稍候……";
    private String RET_MSG_ADDDEPTSERVER_400 = "部门服务添加失败，字段校验出错。";
    private String RET_MSG_ADDDEPTSERVER_401 = "部门服务添加失败，服务编码已经存在。";
    private String RET_MSG_ADDDEPTSERVER_402 = "部门服务添加失败，非法交易编码。";
    private String RET_MSG_ADDDEPTSERVER_403 = "部门服务添加失败，非法用户编码。";
    private String RET_MSG_ADDDEPTSERVER_500 = "部门服务添加失败，服务器发生错误。";

    @Resource
    private ServerService serverService;

    @Resource
    private TradeService tradeService;

    @Resource
    private OrgService orgService;

    @Resource
    private DeptService deptService;

    @RequestMapping(value = "/org/checkallservlist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "SERV_ORG_CHECKALLSERVLIST")
    @ResponseBody
    public DTRespAjax getOrgServerList(HttpServletRequest request, @RequestParam("draw") int draw,
                                     @RequestParam("order[0][dir]") String order_dir,
                                     @RequestParam("start") int start,
                                     @RequestParam("length") int length) {
        String searchString = "";
        if(request.getParameter("searchString")!=null){
            searchString = request.getParameter("searchString");
        }
        String[][] array = serverService.getOrgServerArray(order_dir,searchString,start,length);
        return array2DtRespAjax(array,draw,length);
    }

    @RequestMapping(value = "/org/addserv", method = {RequestMethod.POST}, produces = "application/json")
    @Authentication(value = "SERV_ORG_ADDSERV")
    @ResponseBody
    public JumpResponse addServer(HttpServletRequest request, @RequestParam String data) {
        String actionUserid = request.getAttribute(SysParams.ACTION_USERID).toString();
        Server server = JSON.parseObject(data, Server.class);
        String msg = validate(server);
        JumpResponse response = new JumpResponse();
        if (!StringUtils.isEmpty(msg)) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDSERVER_400 + "<br>" + msg);
            return response;
        }
        if(serverService.checkServerNoIsExist(server.getServerno())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDSERVER_401);
            return response;
        }
        if(!tradeService.checkTradeNoIsExist(server.getTradeno())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDSERVER_402);
            return response;
        }
        if(!orgService.checkUserIsExist(server.getServusername())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDSERVER_403);
            return response;
        }
        try{
            serverService.addServer(server, actionUserid);
        }catch (Exception e){
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_ADDSERVER_500+":"+e.getMessage());
            return response;
        }
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_ADDSERVER_200);
        response.setJumpUrl("/status_success.html");
        return response;
    }

    @RequestMapping(value = "/dept/checkdeptservlist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "SERV_DEPT_CHECKDEPTSERVLIST")
    @ResponseBody
    public DTRespAjax getDeptServerList(HttpServletRequest request, @RequestParam("draw") int draw,
                                       @RequestParam("order[0][dir]") String order_dir,
                                       @RequestParam("start") int start,
                                       @RequestParam("length") int length) {
        String deptid = deptService.getDeptIdByUserId(request.getAttribute(SysParams.ACTION_USERID).toString());
        String searchString = "";
        if(request.getParameter("searchString")!=null){
            searchString = request.getParameter("searchString");
        }
        String[][] array = serverService.getDeptServerArray(order_dir,searchString,start,length,deptid);
        return array2DtRespAjax(array,draw,length);
    }

    @RequestMapping(value = "/dept/addserv", method = {RequestMethod.POST}, produces = "application/json")
    @Authentication(value = "SERV_DEPT_ADDSERV")
    @ResponseBody
    public JumpResponse addDeptServer(HttpServletRequest request, @RequestParam String data) {
        String actionUserid = request.getAttribute(SysParams.ACTION_USERID).toString();
        Server server = JSON.parseObject(data, Server.class);
        String msg = validate(server);
        JumpResponse response = new JumpResponse();
        if (!StringUtils.isEmpty(msg)) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTSERVER_400 + "<br>" + msg);
            return response;
        }
        if(serverService.checkServerNoIsExist(server.getServerno())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTSERVER_401);
            return response;
        }
        if(!tradeService.checkTradeNoIsExist(server.getTradeno())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTSERVER_402);
            return response;
        }
        if(!orgService.checkUserIsExist(server.getServusername())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTSERVER_403);
            return response;
        }
        try{
            serverService.addDeptServer(server, actionUserid);
        }catch (Exception e){
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_ADDDEPTSERVER_500+":"+e.getMessage());
            return response;
        }
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_ADDDEPTSERVER_200);
        response.setJumpUrl("/status_success.html");
        return response;
    }
}
