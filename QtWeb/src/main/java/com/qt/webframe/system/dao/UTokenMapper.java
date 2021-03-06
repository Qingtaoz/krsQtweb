package com.qt.webframe.system.dao;

import com.qt.webframe.system.pojo.UToken;
import org.springframework.stereotype.Repository;

@Repository
public interface UTokenMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_sys_usertoken
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String userid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_sys_usertoken
     *
     * @mbg.generated
     */
    int insert(UToken record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_sys_usertoken
     *
     * @mbg.generated
     */
    int insertSelective(UToken record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_sys_usertoken
     *
     * @mbg.generated
     */
    UToken selectByPrimaryKey(String userid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_sys_usertoken
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(UToken record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_sys_usertoken
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(UToken record);

    UToken selectUserIdByToken(String token);
}