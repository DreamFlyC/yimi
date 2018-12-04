package com.lw.aliyunmonitoossinfo.entity;

import java.io.Serializable;

/**
 * aliyun_monito_ossinfo
 * @author 
 */
public class AliyunMonitoOssinfo implements Serializable {
    private Integer id;

    /**
     * 连接数使用率
     */
    private String connectionusage;

    /**
     * 已用连接数
     */
    private String usedconnection;

    /**
     * CPU使用率
     */
    private String cpuusage;

    /**
     * 操作失败数
     */
    private String cailedcount;

    /**
     * 写入网络带宽
     */
    private String intranetin;

    /**
     * 写入带宽使用率
     */
    private String intranetinratio;

    /**
     * 读取网络带宽
     */
    private String intranetout;

    /**
     * 读取带宽使用率
     */
    private String intranetoutratio;

    /**
     * 内存使用率
     */
    private String memoryusage;

    /**
     * 内存使用量
     */
    private String usedmemory;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getConnectionusage() {
        return connectionusage;
    }

    public void setConnectionusage(String connectionusage) {
        this.connectionusage = connectionusage;
    }

    public String getUsedconnection() {
        return usedconnection;
    }

    public void setUsedconnection(String usedconnection) {
        this.usedconnection = usedconnection;
    }

    public String getCpuusage() {
        return cpuusage;
    }

    public void setCpuusage(String cpuusage) {
        this.cpuusage = cpuusage;
    }

    public String getCailedcount() {
        return cailedcount;
    }

    public void setCailedcount(String cailedcount) {
        this.cailedcount = cailedcount;
    }

    public String getIntranetin() {
        return intranetin;
    }

    public void setIntranetin(String intranetin) {
        this.intranetin = intranetin;
    }

    public String getIntranetinratio() {
        return intranetinratio;
    }

    public void setIntranetinratio(String intranetinratio) {
        this.intranetinratio = intranetinratio;
    }

    public String getIntranetout() {
        return intranetout;
    }

    public void setIntranetout(String intranetout) {
        this.intranetout = intranetout;
    }

    public String getIntranetoutratio() {
        return intranetoutratio;
    }

    public void setIntranetoutratio(String intranetoutratio) {
        this.intranetoutratio = intranetoutratio;
    }

    public String getMemoryusage() {
        return memoryusage;
    }

    public void setMemoryusage(String memoryusage) {
        this.memoryusage = memoryusage;
    }

    public String getUsedmemory() {
        return usedmemory;
    }

    public void setUsedmemory(String usedmemory) {
        this.usedmemory = usedmemory;
    }
}