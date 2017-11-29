package com.qt.webframe.crm.web;

import com.alibaba.fastjson.JSON;
import com.qt.webframe.crm.pojo.Product;
import com.qt.webframe.crm.service.ProductService;
import com.qt.webframe.system.annotation.Authentication;
import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.controller.BaseController;
import com.qt.webframe.system.pojoweb.DTRespAjax;
import com.qt.webframe.system.response.JumpResponse;
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
@RequestMapping(value = "/pro")
public class ProductController extends BaseController {

    private String RET_MSG_ADDPRO_200 = "产品添加成功，请稍候……";
    private String RET_MSG_ADDPRO_400 = "产品添加失败，字段校验出错。";
    private String RET_MSG_ADDPRO_401 = "产品添加失败，产品编码已经存在。";
    private String RET_MSG_ADDPRO_500 = "产品添加失败，服务器发生错误。";

    @Resource
    private ProductService productService;

    @RequestMapping(value = "/org/checkallprolist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "PRO_ORG_CHECKALLPROLIST")
    @ResponseBody
    public DTRespAjax getOrgProductList(HttpServletRequest request, @RequestParam("draw") int draw,
                                     @RequestParam("order[0][dir]") String order_dir,
                                     @RequestParam("start") int start,
                                     @RequestParam("length") int length) {
        String searchString = "";
        if(request.getParameter("searchString")!=null){
            searchString = request.getParameter("searchString");
        }
        String[][] array = productService.getAllProductArray(order_dir,searchString,start,length);
        return array2DtRespAjax(array,draw,length);
    }
    @RequestMapping(value = "/dept/checkdeptprolist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "PRO_DEPT_CHECKALLPROLIST")
    @ResponseBody
    public DTRespAjax getDeptProductList(HttpServletRequest request, @RequestParam("draw") int draw,
                                     @RequestParam("order[0][dir]") String order_dir,
                                     @RequestParam("start") int start,
                                     @RequestParam("length") int length) {
        String searchString = "";
        if(request.getParameter("searchString")!=null){
            searchString = request.getParameter("searchString");
        }
        String[][] array = productService.getAllProductArray(order_dir,searchString,start,length);
        return array2DtRespAjax(array,draw,length);
    }

    @RequestMapping(value = "/org/addpro", method = {RequestMethod.POST}, produces = "application/json")
    @Authentication(value = "PRO_ORG_ADDPRO")
    @ResponseBody
    public JumpResponse addProduct(HttpServletRequest request, @RequestParam String data) {
        String actionUserid = request.getAttribute(SysParams.ACTION_USERID).toString();
        Product pro = JSON.parseObject(data, Product.class);
        String msg = validate(pro);
        JumpResponse response = new JumpResponse();
        if (!StringUtils.isEmpty(msg)) {
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDPRO_400 + "<br>" + msg);
            return response;
        }
        if(productService.checkProNoIsExist(pro.getProductno())){
            response.setCode(RET_CODE_400);
            response.setMsg(RET_MSG_ADDPRO_401);
            return response;
        }
        try{
            productService.addProduct(pro, actionUserid);
        }catch (Exception e){
            response.setCode(RET_CODE_500);
            response.setMsg(RET_MSG_ADDPRO_500+":"+e.getMessage());
            return response;
        }
        response.setCode(RET_CODE_200);
        response.setMsg(RET_MSG_ADDPRO_200);
        response.setJumpUrl("/status_success.html");
        return response;
    }
}
