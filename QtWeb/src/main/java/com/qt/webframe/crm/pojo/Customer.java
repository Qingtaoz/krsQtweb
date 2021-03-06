package com.qt.webframe.crm.pojo;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Date;

public class Customer {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.customerid
     *
     * @mbg.generated
     */
    private String customerid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.customerno
     *
     * @mbg.generated
     */
    @NotNull(message = "{cust.no.notnull}")
    @Length(max = 20, message = "{cust.no.formaterr}")
    @Pattern(regexp = "^[A-Za-z0-9]+$", message = "{cust.no.formaterr}")
    private String customerno;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.customername
     *
     * @mbg.generated
     */
    @NotNull(message = "{cust.name.notnull}")
    @Length(max = 50, message = "{cust.name.formaterr}")
    private String customername;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.custfrom
     *
     * @mbg.generated
     */
    @NotNull(message = "{cust.from.notnull}")
    @Length(max = 20, message = "{cust.from.formaterr}")
    private String custfrom;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.relax
     *
     * @mbg.generated
     */
    @NotNull(message = "{cust.relax.notnull}")
    @Length(max = 16, message = "{cust.relax.formaterr}")
    private String relax;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.telphone
     *
     * @mbg.generated
     */
    @NotNull(message = "{cust.tel.notnull}")
    @Length(max = 16, message = "{cust.tel.formaterr}")
    private String telphone;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.phone
     *
     * @mbg.generated
     */
    private String phone;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.email
     *
     * @mbg.generated
     */
    private String email;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.address
     *
     * @mbg.generated
     */
    @NotNull(message = "{cust.addr.notnull}")
    @Length(max = 200, message = "{cust.addr.formaterr}")
    private String address;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.isdel
     *
     * @mbg.generated
     */
    private Boolean isdel;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.createuserid
     *
     * @mbg.generated
     */
    private String createuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.createdatetime
     *
     * @mbg.generated
     */
    private Date createdatetime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.updateuserid
     *
     * @mbg.generated
     */
    private String updateuserid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_bd_customer.updatedatetime
     *
     * @mbg.generated
     */
    private Date updatedatetime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.customerid
     *
     * @return the value of t_bd_customer.customerid
     *
     * @mbg.generated
     */
    public String getCustomerid() {
        return customerid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.customerid
     *
     * @param customerid the value for t_bd_customer.customerid
     *
     * @mbg.generated
     */
    public void setCustomerid(String customerid) {
        this.customerid = customerid == null ? null : customerid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.customerno
     *
     * @return the value of t_bd_customer.customerno
     *
     * @mbg.generated
     */
    public String getCustomerno() {
        return customerno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.customerno
     *
     * @param customerno the value for t_bd_customer.customerno
     *
     * @mbg.generated
     */
    public void setCustomerno(String customerno) {
        this.customerno = customerno == null ? null : customerno.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.customername
     *
     * @return the value of t_bd_customer.customername
     *
     * @mbg.generated
     */
    public String getCustomername() {
        return customername;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.customername
     *
     * @param customername the value for t_bd_customer.customername
     *
     * @mbg.generated
     */
    public void setCustomername(String customername) {
        this.customername = customername == null ? null : customername.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.custfrom
     *
     * @return the value of t_bd_customer.custfrom
     *
     * @mbg.generated
     */
    public String getCustfrom() {
        return custfrom;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.custfrom
     *
     * @param custfrom the value for t_bd_customer.custfrom
     *
     * @mbg.generated
     */
    public void setCustfrom(String custfrom) {
        this.custfrom = custfrom == null ? null : custfrom.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.relax
     *
     * @return the value of t_bd_customer.relax
     *
     * @mbg.generated
     */
    public String getRelax() {
        return relax;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.relax
     *
     * @param relax the value for t_bd_customer.relax
     *
     * @mbg.generated
     */
    public void setRelax(String relax) {
        this.relax = relax == null ? null : relax.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.telphone
     *
     * @return the value of t_bd_customer.telphone
     *
     * @mbg.generated
     */
    public String getTelphone() {
        return telphone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.telphone
     *
     * @param telphone the value for t_bd_customer.telphone
     *
     * @mbg.generated
     */
    public void setTelphone(String telphone) {
        this.telphone = telphone == null ? null : telphone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.phone
     *
     * @return the value of t_bd_customer.phone
     *
     * @mbg.generated
     */
    public String getPhone() {
        return phone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.phone
     *
     * @param phone the value for t_bd_customer.phone
     *
     * @mbg.generated
     */
    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.email
     *
     * @return the value of t_bd_customer.email
     *
     * @mbg.generated
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.email
     *
     * @param email the value for t_bd_customer.email
     *
     * @mbg.generated
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.address
     *
     * @return the value of t_bd_customer.address
     *
     * @mbg.generated
     */
    public String getAddress() {
        return address;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.address
     *
     * @param address the value for t_bd_customer.address
     *
     * @mbg.generated
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.isdel
     *
     * @return the value of t_bd_customer.isdel
     *
     * @mbg.generated
     */
    public Boolean getIsdel() {
        return isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.isdel
     *
     * @param isdel the value for t_bd_customer.isdel
     *
     * @mbg.generated
     */
    public void setIsdel(Boolean isdel) {
        this.isdel = isdel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.createuserid
     *
     * @return the value of t_bd_customer.createuserid
     *
     * @mbg.generated
     */
    public String getCreateuserid() {
        return createuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.createuserid
     *
     * @param createuserid the value for t_bd_customer.createuserid
     *
     * @mbg.generated
     */
    public void setCreateuserid(String createuserid) {
        this.createuserid = createuserid == null ? null : createuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.createdatetime
     *
     * @return the value of t_bd_customer.createdatetime
     *
     * @mbg.generated
     */
    public Date getCreatedatetime() {
        return createdatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.createdatetime
     *
     * @param createdatetime the value for t_bd_customer.createdatetime
     *
     * @mbg.generated
     */
    public void setCreatedatetime(Date createdatetime) {
        this.createdatetime = createdatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.updateuserid
     *
     * @return the value of t_bd_customer.updateuserid
     *
     * @mbg.generated
     */
    public String getUpdateuserid() {
        return updateuserid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.updateuserid
     *
     * @param updateuserid the value for t_bd_customer.updateuserid
     *
     * @mbg.generated
     */
    public void setUpdateuserid(String updateuserid) {
        this.updateuserid = updateuserid == null ? null : updateuserid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_bd_customer.updatedatetime
     *
     * @return the value of t_bd_customer.updatedatetime
     *
     * @mbg.generated
     */
    public Date getUpdatedatetime() {
        return updatedatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_bd_customer.updatedatetime
     *
     * @param updatedatetime the value for t_bd_customer.updatedatetime
     *
     * @mbg.generated
     */
    public void setUpdatedatetime(Date updatedatetime) {
        this.updatedatetime = updatedatetime;
    }


}