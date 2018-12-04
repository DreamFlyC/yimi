package com.lw.tpartnerbasicinfo.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * t_partner_basic_info
 * @author CZP
 */
public class TPartnerBasicInfo implements Serializable {
    /**
     * ID
     */
    private String partnerId;

    /**
     * 上级运营商
     */
    private String parentPartnerId;

    /**
     * 运营商编码
     */
    private String code;

    /**
     * 运营商名称
     */
    private String name;

    /**
     * 所在地省
     */
    private String province;

    /**
     * 所在地市
     */
    private String city;

    /**
     * 所在地区县
     */
    private String district;

    /**
     * 所在地详细地址
     */
    private String address;

    /**
     * 联系人姓名
     */
    private String contacterName;

    /**
     * 联系人手机
     */
    private String contacterMobile;

    /**
     * 联系人座机
     */
    private String contacterTelephone;

    /**
     * 联系人邮箱
     */
    private String contacterEmail;

    /**
     * 联系人证件类型
     */
    private String contacterCertificateType;

    /**
     * 联系人证件号码
     */
    private String contacterCertificateNo;

    /**
     * 运营商性质(个人|单位)
     */
    private String property;

    /**
     * 营业执照
     */
    private String tradingCertificate;

    /**
     * 机构代码
     */
    private String companyCode;

    /**
     * 负责人姓名
     */
    private String principalName;

    /**
     * 负责人手机
     */
    private String principalMobile;

    /**
     * 负责人座机
     */
    private String principalTelephone;

    /**
     * 负责人邮箱
     */
    private String principalEmail;

    /**
     * 负责人证件类型
     */
    private String principalCertificateType;

    /**
     * 负责人证件号码
     */
    private String principalCertificateNo;

    /**
     * 网址
     */
    private String companyWebsite;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 最后修改人
     */
    private String lastModifyBy;

    /**
     * 最后修改时间
     */
    private Date lastModifyTime;


    public String getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(String partnerId) {
        this.partnerId = partnerId;
    }

    public String getParentPartnerId() {
        return parentPartnerId;
    }

    public void setParentPartnerId(String parentPartnerId) {
        this.parentPartnerId = parentPartnerId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContacterName() {
        return contacterName;
    }

    public void setContacterName(String contacterName) {
        this.contacterName = contacterName;
    }

    public String getContacterMobile() {
        return contacterMobile;
    }

    public void setContacterMobile(String contacterMobile) {
        this.contacterMobile = contacterMobile;
    }

    public String getContacterTelephone() {
        return contacterTelephone;
    }

    public void setContacterTelephone(String contacterTelephone) {
        this.contacterTelephone = contacterTelephone;
    }

    public String getContacterEmail() {
        return contacterEmail;
    }

    public void setContacterEmail(String contacterEmail) {
        this.contacterEmail = contacterEmail;
    }

    public String getContacterCertificateType() {
        return contacterCertificateType;
    }

    public void setContacterCertificateType(String contacterCertificateType) {
        this.contacterCertificateType = contacterCertificateType;
    }

    public String getContacterCertificateNo() {
        return contacterCertificateNo;
    }

    public void setContacterCertificateNo(String contacterCertificateNo) {
        this.contacterCertificateNo = contacterCertificateNo;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getTradingCertificate() {
        return tradingCertificate;
    }

    public void setTradingCertificate(String tradingCertificate) {
        this.tradingCertificate = tradingCertificate;
    }

    public String getCompanyCode() {
        return companyCode;
    }

    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
    }

    public String getPrincipalName() {
        return principalName;
    }

    public void setPrincipalName(String principalName) {
        this.principalName = principalName;
    }

    public String getPrincipalMobile() {
        return principalMobile;
    }

    public void setPrincipalMobile(String principalMobile) {
        this.principalMobile = principalMobile;
    }

    public String getPrincipalTelephone() {
        return principalTelephone;
    }

    public void setPrincipalTelephone(String principalTelephone) {
        this.principalTelephone = principalTelephone;
    }

    public String getPrincipalEmail() {
        return principalEmail;
    }

    public void setPrincipalEmail(String principalEmail) {
        this.principalEmail = principalEmail;
    }

    public String getPrincipalCertificateType() {
        return principalCertificateType;
    }

    public void setPrincipalCertificateType(String principalCertificateType) {
        this.principalCertificateType = principalCertificateType;
    }

    public String getPrincipalCertificateNo() {
        return principalCertificateNo;
    }

    public void setPrincipalCertificateNo(String principalCertificateNo) {
        this.principalCertificateNo = principalCertificateNo;
    }

    public String getCompanyWebsite() {
        return companyWebsite;
    }

    public void setCompanyWebsite(String companyWebsite) {
        this.companyWebsite = companyWebsite;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getLastModifyBy() {
        return lastModifyBy;
    }

    public void setLastModifyBy(String lastModifyBy) {
        this.lastModifyBy = lastModifyBy;
    }

    public Date getLastModifyTime() {
        return lastModifyTime;
    }

    public void setLastModifyTime(Date lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
    }
}