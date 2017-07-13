package com.qt.webframe.crm.service;

import com.qt.webframe.crm.dao.ProductMapper;
import com.qt.webframe.crm.pojo.Product;
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
 * Created by Slash on 2017/6/21.
 */
@Service
public class ProductService {

    @Resource
    private ProductMapper productMapper;

    public String[][] getAllProductArray(String order_dir, String searchString, int start, int length) {
        String[][] strings;
        Map<String, Object> map = new HashMap();
        map.put("search", StringUtils.isEmpty(searchString) ? null : searchString);
        map.put("order", "productno");
        map.put("dir", order_dir);
        List<Product> products = productMapper.selectProListByStr(map, start, length);
        int size = products.size();
        strings = new String[size][5];
        for (int i = 0; i < size; i++) {
            strings[i][0] = "";
            strings[i][1] = StringUtil.o2String(products.get(i).getProductno());
            strings[i][2] = StringUtil.o2String(products.get(i).getProductname());
            strings[i][3] = StringUtil.o2String(products.get(i).getVersion());
            strings[i][4] = StringUtil.dateTime2DateString(products.get(i).getCreatedatetime());
        }
        return strings;
    }

    @Transactional
    public void addProduct(Product pro, String actionUserid) {
        pro.setProductid(IdGenerator.getUUID());
        pro.setIsdel(false);
        pro.setCreateuserid(actionUserid);
        pro.setCreatedatetime(new Date());
        if (productMapper.insertSelective(pro) == 0) {
            throw new RuntimeException();
        }
    }

    public boolean checkProNoIsExist(String productno) {
        Product pro = productMapper.selectByProNo(productno);
        return pro == null ? false : true;
    }
}
