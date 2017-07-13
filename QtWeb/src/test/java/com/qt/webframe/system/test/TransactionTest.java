package com.qt.webframe.system.test;

import com.qt.webframe.system.dao.ParamsMapper;
import com.qt.webframe.system.pojo.Params;
import org.junit.Test;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by Slash on 2017/6/28.
 */
public class TransactionTest extends SpringTestCase {

    @Resource
    private ParamsMapper paramsMapper;

    @Test
    @Transactional
    public void test1(){
        Params p1 = new Params();
        p1.setParamcode("test1");
        p1.setParamdesc("test1");
        p1.setParamtype("test1");
        p1.setParamvalue("test1");
        paramsMapper.insert(p1);
        Params p2 = new Params();
        p2.setParamcode("test2");
        p2.setParamdesc("test2");
        p2.setParamtype("test2");
        p2.setParamvalue("test2");
        paramsMapper.insert(p2);
//        throw new RuntimeException("testException!");
    }
}
