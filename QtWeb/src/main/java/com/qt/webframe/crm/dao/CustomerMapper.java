package com.qt.webframe.crm.dao;

import com.qt.webframe.crm.pojo.Customer;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CustomerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_bd_customer
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String customerid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_bd_customer
     *
     * @mbg.generated
     */
    int insert(Customer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_bd_customer
     *
     * @mbg.generated
     */
    int insertSelective(Customer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_bd_customer
     *
     * @mbg.generated
     */
    Customer selectByPrimaryKey(String customerid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_bd_customer
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Customer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_bd_customer
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Customer record);

    List<Customer> selectCustListByStr(Map<String, Object> map, int start, int length);

    Customer selectByCustNo(String custNo);

    Customer selectByCustName(String custName);

    List<Customer> selectDeptCustListByStr(Map<String, Object> map, int start, int length);
}