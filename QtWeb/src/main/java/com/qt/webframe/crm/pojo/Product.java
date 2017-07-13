package com.qt.webframe.crm.pojo;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Date;

public class Product {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_product.productid
     *
     * @mbg.generated
     */
    private String productid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_product.productno
     *
     * @mbg.generated
     */
    @NotNull(message = "{pro.no.notnull}")
    @Length(max = 20, message = "{pro.no.formaterr}")
    @Pattern(regexp = "^[A-Za-z0-9]+$", message = "{pro.no.formaterr}")
    private String productno;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_product.productname
     *
     * @mbg.generated
     */
    @NotNull(message = "{pro.name.notnull}")
    @Length(max = 20, message = "{pro.name.formaterr}")
    private String productname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_product.version
     *
     * @mbg.generated
     */
    @Length(max = 16, message = "{pro.version.formaterr}")
    private String version;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_product.isdel
     *
     * @mbg.generated
     */
    private Boolean isdel;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_product.createuserid
     *
     * @mbg.generated
     */
    private String createuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_product.createdatetime
     *
     * @mbg.generated
     */
    private Date createdatetime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_product.updateuserid
     *
     * @mbg.generated
     */
    private String updateuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_product.updatedatetime
     *
     * @mbg.generated
     */
    private Date updatedatetime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_product.productid
     *
     * @return the value of t_bd_product.productid
     *
     * @mbg.generated
     */
    public String getProductid() {
        return productid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_product.productid
     *
     * @param productid the value for t_bd_product.productid
     *
     * @mbg.generated
     */
    public void setProductid(String productid) {
        this.productid = productid == null ? null : productid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_product.productno
     *
     * @return the value of t_bd_product.productno
     *
     * @mbg.generated
     */
    public String getProductno() {
        return productno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_product.productno
     *
     * @param productno the value for t_bd_product.productno
     *
     * @mbg.generated
     */
    public void setProductno(String productno) {
        this.productno = productno == null ? null : productno.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_product.productname
     *
     * @return the value of t_bd_product.productname
     *
     * @mbg.generated
     */
    public String getProductname() {
        return productname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_product.productname
     *
     * @param productname the value for t_bd_product.productname
     *
     * @mbg.generated
     */
    public void setProductname(String productname) {
        this.productname = productname == null ? null : productname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_product.version
     *
     * @return the value of t_bd_product.version
     *
     * @mbg.generated
     */
    public String getVersion() {
        return version;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_product.version
     *
     * @param version the value for t_bd_product.version
     *
     * @mbg.generated
     */
    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_product.isdel
     *
     * @return the value of t_bd_product.isdel
     *
     * @mbg.generated
     */
    public Boolean getIsdel() {
        return isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_product.isdel
     *
     * @param isdel the value for t_bd_product.isdel
     *
     * @mbg.generated
     */
    public void setIsdel(Boolean isdel) {
        this.isdel = isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_product.createuserid
     *
     * @return the value of t_bd_product.createuserid
     *
     * @mbg.generated
     */
    public String getCreateuserid() {
        return createuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_product.createuserid
     *
     * @param createuserid the value for t_bd_product.createuserid
     *
     * @mbg.generated
     */
    public void setCreateuserid(String createuserid) {
        this.createuserid = createuserid == null ? null : createuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_product.createdatetime
     *
     * @return the value of t_bd_product.createdatetime
     *
     * @mbg.generated
     */
    public Date getCreatedatetime() {
        return createdatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_product.createdatetime
     *
     * @param createdatetime the value for t_bd_product.createdatetime
     *
     * @mbg.generated
     */
    public void setCreatedatetime(Date createdatetime) {
        this.createdatetime = createdatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_product.updateuserid
     *
     * @return the value of t_bd_product.updateuserid
     *
     * @mbg.generated
     */
    public String getUpdateuserid() {
        return updateuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_product.updateuserid
     *
     * @param updateuserid the value for t_bd_product.updateuserid
     *
     * @mbg.generated
     */
    public void setUpdateuserid(String updateuserid) {
        this.updateuserid = updateuserid == null ? null : updateuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_product.updatedatetime
     *
     * @return the value of t_bd_product.updatedatetime
     *
     * @mbg.generated
     */
    public Date getUpdatedatetime() {
        return updatedatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_product.updatedatetime
     *
     * @param updatedatetime the value for t_bd_product.updatedatetime
     *
     * @mbg.generated
     */
    public void setUpdatedatetime(Date updatedatetime) {
        this.updatedatetime = updatedatetime;
    }
}