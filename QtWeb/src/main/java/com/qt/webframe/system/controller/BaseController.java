package com.qt.webframe.system.controller;

import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.pojoweb.DTRespAjax;
import com.qt.webframe.system.pojoweb.LayTableResp;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 *
 * Created by Slash on 2017/5/18.
 */
@Controller
public class BaseController {

    public static final String RET_CODE_200 = "200";//请求已成功
    public static final String RET_CODE_400 = "400";//请求失败
    public static final String RET_CODE_500 = "500";//服务器错误

    public String validate(Object t){
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Object>> violations = validator.validate(t);
        Iterator<ConstraintViolation<Object>> iterator = violations.iterator();
        StringBuilder sb = new StringBuilder();
        if (iterator.hasNext()){
            sb.append(iterator.next().getMessage()+"<br>");
        }
        return sb.toString().trim();
    }
    public DTRespAjax array2DtRespAjax(String[][] array,int draw,int length){
        DTRespAjax dtRespAjax = new DTRespAjax();
        dtRespAjax.setDraw(draw);
        int l = array.length;
        dtRespAjax.setRecordsTotal(length);
        dtRespAjax.setRecordsFiltered(l);
        dtRespAjax.setData(array);
        return dtRespAjax;
    }
    public LayTableResp array2LayTableResp(String[][] array,int totalCount){
        LayTableResp resp = new LayTableResp();
        resp.setData(array);
        resp.setTotalDataCount(totalCount);
        return resp;
    }
}
