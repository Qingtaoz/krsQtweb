package com.qt.webframe.system.pojo;

import java.util.Date;

public class Organization {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_organization.orgid
     *
     * @mbg.generated
     */
    private String orgid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_organization.orgname
     *
     * @mbg.generated
     */
    private String orgname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_organization.orgmanaerid
     *
     * @mbg.generated
     */
    private String orgmanaerid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_organization.isdel
     *
     * @mbg.generated
     */
    private Boolean isdel;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_organization.createuserid
     *
     * @mbg.generated
     */
    private String createuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_organization.createdatetime
     *
     * @mbg.generated
     */
    private Date createdatetime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_organization.updateuserid
     *
     * @mbg.generated
     */
    private String updateuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_organization.updatedatetime
     *
     * @mbg.generated
     */
    private Date updatedatetime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_organization.orglogo
     *
     * @mbg.generated
     */
    private byte[] orglogo;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_organization.orgid
     *
     * @return the value of t_bd_organization.orgid
     *
     * @mbg.generated
     */
    public String getOrgid() {
        return orgid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_organization.orgid
     *
     * @param orgid the value for t_bd_organization.orgid
     *
     * @mbg.generated
     */
    public void setOrgid(String orgid) {
        this.orgid = orgid == null ? null : orgid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_organization.orgname
     *
     * @return the value of t_bd_organization.orgname
     *
     * @mbg.generated
     */
    public String getOrgname() {
        return orgname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_organization.orgname
     *
     * @param orgname the value for t_bd_organization.orgname
     *
     * @mbg.generated
     */
    public void setOrgname(String orgname) {
        this.orgname = orgname == null ? null : orgname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_organization.orgmanaerid
     *
     * @return the value of t_bd_organization.orgmanaerid
     *
     * @mbg.generated
     */
    public String getOrgmanaerid() {
        return orgmanaerid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_organization.orgmanaerid
     *
     * @param orgmanaerid the value for t_bd_organization.orgmanaerid
     *
     * @mbg.generated
     */
    public void setOrgmanaerid(String orgmanaerid) {
        this.orgmanaerid = orgmanaerid == null ? null : orgmanaerid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_organization.isdel
     *
     * @return the value of t_bd_organization.isdel
     *
     * @mbg.generated
     */
    public Boolean getIsdel() {
        return isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_organization.isdel
     *
     * @param isdel the value for t_bd_organization.isdel
     *
     * @mbg.generated
     */
    public void setIsdel(Boolean isdel) {
        this.isdel = isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_organization.createuserid
     *
     * @return the value of t_bd_organization.createuserid
     *
     * @mbg.generated
     */
    public String getCreateuserid() {
        return createuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_organization.createuserid
     *
     * @param createuserid the value for t_bd_organization.createuserid
     *
     * @mbg.generated
     */
    public void setCreateuserid(String createuserid) {
        this.createuserid = createuserid == null ? null : createuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_organization.createdatetime
     *
     * @return the value of t_bd_organization.createdatetime
     *
     * @mbg.generated
     */
    public Date getCreatedatetime() {
        return createdatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_organization.createdatetime
     *
     * @param createdatetime the value for t_bd_organization.createdatetime
     *
     * @mbg.generated
     */
    public void setCreatedatetime(Date createdatetime) {
        this.createdatetime = createdatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_organization.updateuserid
     *
     * @return the value of t_bd_organization.updateuserid
     *
     * @mbg.generated
     */
    public String getUpdateuserid() {
        return updateuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_organization.updateuserid
     *
     * @param updateuserid the value for t_bd_organization.updateuserid
     *
     * @mbg.generated
     */
    public void setUpdateuserid(String updateuserid) {
        this.updateuserid = updateuserid == null ? null : updateuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_organization.updatedatetime
     *
     * @return the value of t_bd_organization.updatedatetime
     *
     * @mbg.generated
     */
    public Date getUpdatedatetime() {
        return updatedatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_organization.updatedatetime
     *
     * @param updatedatetime the value for t_bd_organization.updatedatetime
     *
     * @mbg.generated
     */
    public void setUpdatedatetime(Date updatedatetime) {
        this.updatedatetime = updatedatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_organization.orglogo
     *
     * @return the value of t_bd_organization.orglogo
     *
     * @mbg.generated
     */
    public byte[] getOrglogo() {
        return orglogo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_organization.orglogo
     *
     * @param orglogo the value for t_bd_organization.orglogo
     *
     * @mbg.generated
     */
    public void setOrglogo(byte[] orglogo) {
        this.orglogo = orglogo;
    }
}