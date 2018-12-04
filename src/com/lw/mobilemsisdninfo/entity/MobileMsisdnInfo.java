package com.lw.mobilemsisdninfo.entity;

import java.io.Serializable;

/**
 * mobile_msisdn_info
 * @author 
 */
public class MobileMsisdnInfo implements Serializable {
    private Integer id;

    /**
     * 返回结果类型 1.查询数据 2.数据下载地址(结果类型只返回1)
     */
    private Integer type;

    /**
     * 号码信号列表
     */
    private String msisdninfolist;

    /**
     * 号码信息
     */
    private String msisdninfo;

    /**
     * 号码
     */
    private String msisdn;

    /**
     * 集成电路卡识别码
     */
    private String iccid;

    /**
     * 查询结果：0 成功；1 失败；
     */
    private String code;

    /**
     * 查询错误描述
     */
    private String error;

    /**
     * APN信息列表
     */
    private String apnlist;

    /**
     * APN信息
     */
    private String apninfo;

    /**
     * APN名称
     */
    private String apnname;

    /**
     * 个人套餐总流量
     */
    private String apninfoTotalflow;

    /**
     * 号码已用总流量
     */
    private String apninfoUsedflow;

    /**
     * 号码剩余总流量，查询成功必填 单位为：MB
     */
    private String apninfoRestflow;

    /**
     * 套餐外流量 单位为：MB
     */
    private String extrapkgflow;

    /**
     * 最后一次流量发生时间 格式：yyyyMMddHHmmss
     */
    private String lastflowtime;

    /**
     * 套餐列表
     */
    private String pkginfolist;

    /**
     * 套餐流量
     */
    private String pkginfo;

    /**
     * 套餐编码
     */
    private String pkgcode;

    /**
     * 套餐名称
     */
    private String pkgname;

    /**
     * 产品实例ID,为空显示“-”
     */
    private String subsprodid;

    /**
     * 套餐总流量 单位：MB
     */
    private String pkginfoTotalflow;

    /**
     * 套餐剩余流量 单位：MB
     */
    private String pkginfoUsedflow;

    /**
     * 套餐剩余流量 单位为：MB
     */
    private String pkginfoRestflow;

    /**
     * 套餐生效日期 格式：yyyyMMddHHmmss
     */
    private String pkgeffdate;

    /**
     * 套餐失效日期格式：yyyyMMddHHmmss
     */
    private String pkgexpiredate;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getMsisdninfolist() {
        return msisdninfolist;
    }

    public void setMsisdninfolist(String msisdninfolist) {
        this.msisdninfolist = msisdninfolist;
    }

    public String getMsisdninfo() {
        return msisdninfo;
    }

    public void setMsisdninfo(String msisdninfo) {
        this.msisdninfo = msisdninfo;
    }

    public String getMsisdn() {
        return msisdn;
    }

    public void setMsisdn(String msisdn) {
        this.msisdn = msisdn;
    }

    public String getIccid() {
        return iccid;
    }

    public void setIccid(String iccid) {
        this.iccid = iccid;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getApnlist() {
        return apnlist;
    }

    public void setApnlist(String apnlist) {
        this.apnlist = apnlist;
    }

    public String getApninfo() {
        return apninfo;
    }

    public void setApninfo(String apninfo) {
        this.apninfo = apninfo;
    }

    public String getApnname() {
        return apnname;
    }

    public void setApnname(String apnname) {
        this.apnname = apnname;
    }

    public String getApninfoTotalflow() {
        return apninfoTotalflow;
    }

    public void setApninfoTotalflow(String apninfoTotalflow) {
        this.apninfoTotalflow = apninfoTotalflow;
    }

    public String getApninfoUsedflow() {
        return apninfoUsedflow;
    }

    public void setApninfoUsedflow(String apninfoUsedflow) {
        this.apninfoUsedflow = apninfoUsedflow;
    }

    public String getApninfoRestflow() {
        return apninfoRestflow;
    }

    public void setApninfoRestflow(String apninfoRestflow) {
        this.apninfoRestflow = apninfoRestflow;
    }

    public String getExtrapkgflow() {
        return extrapkgflow;
    }

    public void setExtrapkgflow(String extrapkgflow) {
        this.extrapkgflow = extrapkgflow;
    }

    public String getLastflowtime() {
        return lastflowtime;
    }

    public void setLastflowtime(String lastflowtime) {
        this.lastflowtime = lastflowtime;
    }

    public String getPkginfolist() {
        return pkginfolist;
    }

    public void setPkginfolist(String pkginfolist) {
        this.pkginfolist = pkginfolist;
    }

    public String getPkginfo() {
        return pkginfo;
    }

    public void setPkginfo(String pkginfo) {
        this.pkginfo = pkginfo;
    }

    public String getPkgcode() {
        return pkgcode;
    }

    public void setPkgcode(String pkgcode) {
        this.pkgcode = pkgcode;
    }

    public String getPkgname() {
        return pkgname;
    }

    public void setPkgname(String pkgname) {
        this.pkgname = pkgname;
    }

    public String getSubsprodid() {
        return subsprodid;
    }

    public void setSubsprodid(String subsprodid) {
        this.subsprodid = subsprodid;
    }

    public String getPkginfoTotalflow() {
        return pkginfoTotalflow;
    }

    public void setPkginfoTotalflow(String pkginfoTotalflow) {
        this.pkginfoTotalflow = pkginfoTotalflow;
    }


    public String getPkginfoRestflow() {
        return pkginfoRestflow;
    }

    public void setPkginfoRestflow(String pkginfoRestflow) {
        this.pkginfoRestflow = pkginfoRestflow;
    }

    public String getPkgeffdate() {
        return pkgeffdate;
    }

    public void setPkgeffdate(String pkgeffdate) {
        this.pkgeffdate = pkgeffdate;
    }

    public String getPkgexpiredate() {
        return pkgexpiredate;
    }

    public void setPkgexpiredate(String pkgexpiredate) {
        this.pkgexpiredate = pkgexpiredate;
    }

	public String getPkginfoUsedflow() {
		return pkginfoUsedflow;
	}

	public void setPkginfoUsedflow(String pkginfoUsedflow) {
		this.pkginfoUsedflow = pkginfoUsedflow;
	}

    
}