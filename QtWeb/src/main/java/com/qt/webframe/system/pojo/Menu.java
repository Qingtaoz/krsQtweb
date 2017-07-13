package com.qt.webframe.system.pojo;

import java.util.Date;

public class Menu {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.menuid
     *
     * @mbg.generated
     */
    private String menuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.menuname
     *
     * @mbg.generated
     */
    private String menuname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.menuurl
     *
     * @mbg.generated
     */
    private String menuurl;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.menulevel
     *
     * @mbg.generated
     */
    private Byte menulevel;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.parentmenuid
     *
     * @mbg.generated
     */
    private String parentmenuid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.isdistribute
     *
     * @mbg.generated
     */
    private Boolean isdistribute;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.isdel
     *
     * @mbg.generated
     */
    private Boolean isdel;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.createuserid
     *
     * @mbg.generated
     */
    private String createuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.createdatetime
     *
     * @mbg.generated
     */
    private Date createdatetime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.updateuserid
     *
     * @mbg.generated
     */
    private String updateuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_menu.updatedatetime
     *
     * @mbg.generated
     */
    private Date updatedatetime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.menuid
     *
     * @return the value of t_bd_menu.menuid
     *
     * @mbg.generated
     */
    public String getMenuid() {
        return menuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.menuid
     *
     * @param menuid the value for t_bd_menu.menuid
     *
     * @mbg.generated
     */
    public void setMenuid(String menuid) {
        this.menuid = menuid == null ? null : menuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.menuname
     *
     * @return the value of t_bd_menu.menuname
     *
     * @mbg.generated
     */
    public String getMenuname() {
        return menuname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.menuname
     *
     * @param menuname the value for t_bd_menu.menuname
     *
     * @mbg.generated
     */
    public void setMenuname(String menuname) {
        this.menuname = menuname == null ? null : menuname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.menuurl
     *
     * @return the value of t_bd_menu.menuurl
     *
     * @mbg.generated
     */
    public String getMenuurl() {
        return menuurl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.menuurl
     *
     * @param menuurl the value for t_bd_menu.menuurl
     *
     * @mbg.generated
     */
    public void setMenuurl(String menuurl) {
        this.menuurl = menuurl == null ? null : menuurl.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.menulevel
     *
     * @return the value of t_bd_menu.menulevel
     *
     * @mbg.generated
     */
    public Byte getMenulevel() {
        return menulevel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.menulevel
     *
     * @param menulevel the value for t_bd_menu.menulevel
     *
     * @mbg.generated
     */
    public void setMenulevel(Byte menulevel) {
        this.menulevel = menulevel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.parentmenuid
     *
     * @return the value of t_bd_menu.parentmenuid
     *
     * @mbg.generated
     */
    public String getParentmenuid() {
        return parentmenuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.parentmenuid
     *
     * @param parentmenuid the value for t_bd_menu.parentmenuid
     *
     * @mbg.generated
     */
    public void setParentmenuid(String parentmenuid) {
        this.parentmenuid = parentmenuid == null ? null : parentmenuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.isdistribute
     *
     * @return the value of t_bd_menu.isdistribute
     *
     * @mbg.generated
     */
    public Boolean getIsdistribute() {
        return isdistribute;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.isdistribute
     *
     * @param isdistribute the value for t_bd_menu.isdistribute
     *
     * @mbg.generated
     */
    public void setIsdistribute(Boolean isdistribute) {
        this.isdistribute = isdistribute;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.isdel
     *
     * @return the value of t_bd_menu.isdel
     *
     * @mbg.generated
     */
    public Boolean getIsdel() {
        return isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.isdel
     *
     * @param isdel the value for t_bd_menu.isdel
     *
     * @mbg.generated
     */
    public void setIsdel(Boolean isdel) {
        this.isdel = isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.createuserid
     *
     * @return the value of t_bd_menu.createuserid
     *
     * @mbg.generated
     */
    public String getCreateuserid() {
        return createuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.createuserid
     *
     * @param createuserid the value for t_bd_menu.createuserid
     *
     * @mbg.generated
     */
    public void setCreateuserid(String createuserid) {
        this.createuserid = createuserid == null ? null : createuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.createdatetime
     *
     * @return the value of t_bd_menu.createdatetime
     *
     * @mbg.generated
     */
    public Date getCreatedatetime() {
        return createdatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.createdatetime
     *
     * @param createdatetime the value for t_bd_menu.createdatetime
     *
     * @mbg.generated
     */
    public void setCreatedatetime(Date createdatetime) {
        this.createdatetime = createdatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.updateuserid
     *
     * @return the value of t_bd_menu.updateuserid
     *
     * @mbg.generated
     */
    public String getUpdateuserid() {
        return updateuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.updateuserid
     *
     * @param updateuserid the value for t_bd_menu.updateuserid
     *
     * @mbg.generated
     */
    public void setUpdateuserid(String updateuserid) {
        this.updateuserid = updateuserid == null ? null : updateuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_menu.updatedatetime
     *
     * @return the value of t_bd_menu.updatedatetime
     *
     * @mbg.generated
     */
    public Date getUpdatedatetime() {
        return updatedatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_menu.updatedatetime
     *
     * @param updatedatetime the value for t_bd_menu.updatedatetime
     *
     * @mbg.generated
     */
    public void setUpdatedatetime(Date updatedatetime) {
        this.updatedatetime = updatedatetime;
    }
}