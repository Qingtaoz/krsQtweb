package com.qt.webframe.crm.web;

import com.alibaba.fastjson.JSON;
import com.qt.webframe.crm.pojo.Trade;
import com.qt.webframe.crm.service.CustomerService;
import com.qt.webframe.crm.service.ProductService;
import com.qt.webframe.crm.service.TradeService;
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
 * @Desc
 * Created by Slash on 2017/6/21.
 */
@Controller
@RequestMapping(value = "/tra")
public class TradeController extends BaseController {

    private String RET_MSG_ADDORGTRADE_200 = "组织交易添加成功，请稍候……";
    private String RET_MSG_ADDORGTRADE_400 = "组织交易添加失败，字段校验出错。";
    private String RET_MSG_ADDORGTRADE_401 = "组织交易添加失败，交易编码已经存在。";
    private String RET_MSG_ADDORGTRADE_402 = "组织交易添加失败，非法客户编码。";
    private String RET_MSG_ADDORGTRADE_403 = "组织交易添加失败，非法产品编码。";
    private String RET_MSG_ADDORGTRADE_500 = "组织交易添加失败，服务器发生错误。";

    private String RET_MSG_ADDDEPTTRADE_200 = "组织交易添加成功，请稍候……";
    private String RET_MSG_ADDDEPTTRADE_400 = "组织交易添加失败，字段校验出错。";
    private String RET_MSG_ADDDEPTTRADE_401 = "组织交易添加失败，交易编码已经存在。";
    private String RET_MSG_ADDDEPTTRADE_402 = "组织交易添加失败，非法客户编码。";
    private String RET_MSG_ADDDEPTTRADE_403 = "组织交易添加失败，非法产品编码。";
    private String RET_MSG_ADDDEPTTRADE_500 = "组织交易添加失败，服务器发生错误。";

    @Resource
    private TradeService tradeService;

    @Resource
    private CustomerService customerService;

    @Resource
    private ProductService productService;

    @Resource
    private DeptService deptService;

    @RequestMapping(value = "/org/checktralist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "TRA_ORG_CHECKALLTRALIST")
    @ResponseBody
    public DTRespAjax getOrgTradeList(HttpServletRequest request, @RequestParam("draw") int draw,
                                      @RequestParam("order[0][dir]") String order_dir,
                                      @RequestParam("start") int start,
                                      @RequestParam("length") int length) {
        String searchString = "";
        if (request.getParameter("searchString") != null) {
            searchString = request.getParameter("searchString");
        }
        String[][] array = tradeService.getOrgTradeArray(order_dir, searchString, start, length);
        return array2DtRespAjax(array, draw, length);
    }
    @RequestMapping(value = "/org/addtra", method = {RequestMethod.POST}, produces = "application/json")
    @Authentication(value = "TRA_ORG_ADDTRA")
    @ResponseBody
    public JumpResponse addOrgTrade(HttpServletRequest request, @RequestParam String data) {
        String actionUserid = request.getAttribute(SysParams.ACTION_USERID).toString();
        Trade trade = JSON.parseObject(data, Trade.class);
        String msg = validate(trade);
        JumpResponse response = new JumpResponse();
        if (!StringUtils.isEmpty(msg)) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDORGTRADE_400 + "<br>" + msg);
            return response;
        }
        if (tradeService.checkTradeNoIsExist(trade.getTradeno())) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDORGTRADE_401);
            return response;
        }
        if (!customerService.checkCustomerNoIsExist(trade.getCustomerno())) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDORGTRADE_402);
            return response;
        }
        if (!productService.checkProNoIsExist(trade.getProductno())) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDORGTRADE_403);
            return response;
        }
        try {
            tradeService.addOrgTrade(trade, actionUserid);
        } catch (Exception e) {
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_ADDORGTRADE_500 + ":" + e.getMessage());
            return response;
        }
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_ADDORGTRADE_200);
        response.setJumpUrl("/status_success.html");
        return response;
    }

    @RequestMapping(value = "/dept/checkdepttralist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "TRA_DEPT_CHECKDEPTTRALIST")
    @ResponseBody
    public DTRespAjax getDeptTradeList(HttpServletRequest request, @RequestParam("draw") int draw,
                                       @RequestParam("order[0][dir]") String order_dir,
                                       @RequestParam("start") int start,
                                       @RequestParam("length") int length) {
        String deptid = deptService.getDeptIdByUserId(request.getAttribute(SysParams.ACTION_USERID).toString());
        String searchString = "";
        if (request.getParameter("searchString") != null) {
            searchString = request.getParameter("searchString");
        }
        String[][] array = tradeService.getDeptTradeArray(order_dir, searchString, start, length, deptid);
        return array2DtRespAjax(array, draw, length);
    }

    @RequestMapping(value = "/dept/addtra", method = {RequestMethod.POST}, produces = "application/json")
    @Authentication(value = "TRA_DEPT_ADDTRA")
    @ResponseBody
    public JumpResponse addDeptTrade(HttpServletRequest request, @RequestParam String data) {
        String actionUserid = request.getAttribute(SysParams.ACTION_USERID).toString();
        Trade trade = JSON.parseObject(data, Trade.class);
        String msg = validate(trade);
        JumpResponse response = new JumpResponse();
        if (!StringUtils.isEmpty(msg)) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTTRADE_400 + "<br>" + msg);
            return response;
        }
        if (tradeService.checkTradeNoIsExist(trade.getTradeno())) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTTRADE_401);
            return response;
        }
        if (!customerService.checkCustomerNoIsExist(trade.getCustomerno())) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTTRADE_402);
            return response;
        }
        if (!productService.checkProNoIsExist(trade.getProductno())) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDDEPTTRADE_403);
            return response;
        }
        try{
            tradeService.addDeptTrade(trade, actionUserid);
        }catch (Exception e){
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_ADDDEPTTRADE_500);
            return response;
        }
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_ADDDEPTTRADE_200);
        response.setJumpUrl("/status_success.html");
        return response;
    }
}
