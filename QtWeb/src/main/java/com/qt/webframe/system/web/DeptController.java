package com.qt.webframe.system.web;

import com.qt.webframe.system.annotation.Authentication;
import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.controller.BaseController;
import com.qt.webframe.system.pojoweb.DTRespAjax;
import com.qt.webframe.system.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Desc
 * Created by Slash on 2017/5/18.
 */
@Controller
@RequestMapping(value = "/dept")
public class DeptController extends BaseController {

    @Resource
    private DeptService deptService;

    /**
     * 获取当前部门下用户列表
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
    @RequestMapping(value = "/user/checkdeptuserslist", method = {RequestMethod.GET}, produces = "application/json")
    @Authentication(value = "DEPT_USER_CHECKDEPTANDSUBDEPTUSERLIST")
    @ResponseBody
    public DTRespAjax getOrgUserList(HttpServletRequest request, @RequestParam("draw") int draw,
                                     @RequestParam("order[0][column]") int order_column,
                                     @RequestParam("order[0][dir]") String order_dir,
                                     @RequestParam("search[value]") String search_string,
                                     @RequestParam("search[regex]") String search_regex,
                                     @RequestParam("start") int start,
                                     @RequestParam("length") int length) {
        String deptid = deptService.getDeptIdByUserId(request.getAttribute(SysParams.ACTION_USERID).toString());
        String searchString = "";
        if(request.getParameter("searchString")!=null){
            searchString = request.getParameter("searchString");
        }
        String[][] array = deptService.getDeptUserArray(order_dir,searchString,start,length,deptid);
        return array2DtRespAjax(array,draw,length);
    }

}
