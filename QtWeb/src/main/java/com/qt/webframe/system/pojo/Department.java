package com.qt.webframe.system.pojo;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Date;

public class Department {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.deptid
     *
     * @mbg.generated
     */
    private String deptid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.deptno
     *
     * @mbg.generated
     */
    @NotNull(message = "{dept.no.notnull}")
    @Length(max = 20, message = "{dept.no.formaterr}")
    @Pattern(regexp = "^[A-Za-z0-9]+$", message = "{dept.no.formaterr}")
    private String deptno;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.deptname
     *
     * @mbg.generated
     */
    @NotNull(message = "{dept.name.notnull}")
    @Length(max = 20, message = "{dept.name.formaterr}")
    @Pattern(regexp = "^[\u0391-\uFFE5]+$", message = "{dept.name.formaterr}")
    private String deptname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.deptlogo
     *
     * @mbg.generated
     */
    private String deptlogo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.deptmanageruname
     *
     * @mbg.generated
     */
    @NotNull(message = "{dept.manager.notnull}")
    private String deptmanageruname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.isend
     *
     * @mbg.generated
     */
    private Boolean isend;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.isdel
     *
     * @mbg.generated
     */
    private Boolean isdel;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.createuserid
     *
     * @mbg.generated
     */
    private String createuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.createdatetime
     *
     * @mbg.generated
     */
    private Date createdatetime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.updateuserid
     *
     * @mbg.generated
     */
    private String updateuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_department.updatedatetime
     *
     * @mbg.generated
     */
    private Date updatedatetime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.deptid
     *
     * @return the value of t_bd_department.deptid
     *
     * @mbg.generated
     */
    public String getDeptid() {
        return deptid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.deptid
     *
     * @param deptid the value for t_bd_department.deptid
     *
     * @mbg.generated
     */
    public void setDeptid(String deptid) {
        this.deptid = deptid == null ? null : deptid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.deptno
     *
     * @return the value of t_bd_department.deptno
     *
     * @mbg.generated
     */
    public String getDeptno() {
        return deptno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.deptno
     *
     * @param deptno the value for t_bd_department.deptno
     *
     * @mbg.generated
     */
    public void setDeptno(String deptno) {
        this.deptno = deptno == null ? null : deptno.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.deptname
     *
     * @return the value of t_bd_department.deptname
     *
     * @mbg.generated
     */
    public String getDeptname() {
        return deptname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.deptname
     *
     * @param deptname the value for t_bd_department.deptname
     *
     * @mbg.generated
     */
    public void setDeptname(String deptname) {
        this.deptname = deptname == null ? null : deptname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.deptlogo
     *
     * @return the value of t_bd_department.deptlogo
     *
     * @mbg.generated
     */
    public String getDeptlogo() {
        return deptlogo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.deptlogo
     *
     * @param deptlogo the value for t_bd_department.deptlogo
     *
     * @mbg.generated
     */
    public void setDeptlogo(String deptlogo) {
        this.deptlogo = deptlogo == null ? null : deptlogo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.deptmanageruname
     *
     * @return the value of t_bd_department.deptmanageruname
     *
     * @mbg.generated
     */
    public String getDeptmanageruname() {
        return deptmanageruname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.deptmanageruname
     *
     * @param deptmanageruname the value for t_bd_department.deptmanageruname
     *
     * @mbg.generated
     */
    public void setDeptmanageruname(String deptmanageruname) {
        this.deptmanageruname = deptmanageruname == null ? null : deptmanageruname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.isend
     *
     * @return the value of t_bd_department.isend
     *
     * @mbg.generated
     */
    public Boolean getIsend() {
        return isend;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.isend
     *
     * @param isend the value for t_bd_department.isend
     *
     * @mbg.generated
     */
    public void setIsend(Boolean isend) {
        this.isend = isend;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.isdel
     *
     * @return the value of t_bd_department.isdel
     *
     * @mbg.generated
     */
    public Boolean getIsdel() {
        return isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.isdel
     *
     * @param isdel the value for t_bd_department.isdel
     *
     * @mbg.generated
     */
    public void setIsdel(Boolean isdel) {
        this.isdel = isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.createuserid
     *
     * @return the value of t_bd_department.createuserid
     *
     * @mbg.generated
     */
    public String getCreateuserid() {
        return createuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.createuserid
     *
     * @param createuserid the value for t_bd_department.createuserid
     *
     * @mbg.generated
     */
    public void setCreateuserid(String createuserid) {
        this.createuserid = createuserid == null ? null : createuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.createdatetime
     *
     * @return the value of t_bd_department.createdatetime
     *
     * @mbg.generated
     */
    public Date getCreatedatetime() {
        return createdatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.createdatetime
     *
     * @param createdatetime the value for t_bd_department.createdatetime
     *
     * @mbg.generated
     */
    public void setCreatedatetime(Date createdatetime) {
        this.createdatetime = createdatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.updateuserid
     *
     * @return the value of t_bd_department.updateuserid
     *
     * @mbg.generated
     */
    public String getUpdateuserid() {
        return updateuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.updateuserid
     *
     * @param updateuserid the value for t_bd_department.updateuserid
     *
     * @mbg.generated
     */
    public void setUpdateuserid(String updateuserid) {
        this.updateuserid = updateuserid == null ? null : updateuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_department.updatedatetime
     *
     * @return the value of t_bd_department.updatedatetime
     *
     * @mbg.generated
     */
    public Date getUpdatedatetime() {
        return updatedatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_department.updatedatetime
     *
     * @param updatedatetime the value for t_bd_department.updatedatetime
     *
     * @mbg.generated
     */
    public void setUpdatedatetime(Date updatedatetime) {
        this.updatedatetime = updatedatetime;
    }
}