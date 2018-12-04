package com.lw.aliyunmonitordsinfo.entity;

import java.io.Serializable;

/**
 * aliyun_monito_rdsinfo
 * @author 
 */
public class AliyunMonitoRdsinfo implements Serializable {
    private Integer id;

    /**
     * CPU使用率
     */
    private String cpuusage;

    /**
     * 磁盘使用率
     */
    private String diskusage;

    /**
     * IOPS使用率
     */
    private String iopsusage;

    /**
     * 连接数使用率
     */
    private String connectionusage;

    /**
     * 只读实例延迟
     */
    private String datadelay;

    /**
     * 内存使用率
     */
    private String memoryusage;

    /**
     * Mysql每秒网络入流量
     */
    private String mysqlNetworkinnew;

    /**
     * Mysql每秒网络出流量
     */
    private String mysqlNetworkoutnew;

    /**
     * SQLServe每秒网络入流量
     */
    private String sqlserverNetworkinnew;

    /**
     * SQLServer每秒网络出流量
     */
    private String sqlserverNetworkoutnew;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCpuusage() {
        return cpuusage;
    }

    public void setCpuusage(String cpuusage) {
        this.cpuusage = cpuusage;
    }

    public String getDiskusage() {
        return diskusage;
    }

    public void setDiskusage(String diskusage) {
        this.diskusage = diskusage;
    }

    public String getIopsusage() {
        return iopsusage;
    }

    public void setIopsusage(String iopsusage) {
        this.iopsusage = iopsusage;
    }

    public String getConnectionusage() {
        return connectionusage;
    }

    public void setConnectionusage(String connectionusage) {
        this.connectionusage = connectionusage;
    }

    public String getDatadelay() {
        return datadelay;
    }

    public void setDatadelay(String datadelay) {
        this.datadelay = datadelay;
    }

    public String getMemoryusage() {
        return memoryusage;
    }

    public void setMemoryusage(String memoryusage) {
        this.memoryusage = memoryusage;
    }

    public String getMysqlNetworkinnew() {
        return mysqlNetworkinnew;
    }

    public void setMysqlNetworkinnew(String mysqlNetworkinnew) {
        this.mysqlNetworkinnew = mysqlNetworkinnew;
    }

    public String getMysqlNetworkoutnew() {
        return mysqlNetworkoutnew;
    }

    public void setMysqlNetworkoutnew(String mysqlNetworkoutnew) {
        this.mysqlNetworkoutnew = mysqlNetworkoutnew;
    }

    public String getSqlserverNetworkinnew() {
        return sqlserverNetworkinnew;
    }

    public void setSqlserverNetworkinnew(String sqlserverNetworkinnew) {
        this.sqlserverNetworkinnew = sqlserverNetworkinnew;
    }

    public String getSqlserverNetworkoutnew() {
        return sqlserverNetworkoutnew;
    }

    public void setSqlserverNetworkoutnew(String sqlserverNetworkoutnew) {
        this.sqlserverNetworkoutnew = sqlserverNetworkoutnew;
    }

}