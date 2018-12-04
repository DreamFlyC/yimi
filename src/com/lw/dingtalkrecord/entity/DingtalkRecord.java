package com.lw.dingtalkrecord.entity;

import java.io.Serializable;
import java.util.Date;

public class DingtalkRecord implements Serializable{
	private int id;  //唯一标示ID
	private int groupId;  //考勤组ID
	private int planId;  //排班ID
	private Date workDate;  //工作日
	private int userId;  //用户ID
	private int approveId;  //关联的审批id
	private int procInstId;  //关联的审批实例id
	private Date baseCheckTime;  //计算迟到和早退，基准时间；也可作为排班打卡时间
	private Date userCheckTime;  //实际打卡时间
	private int classId;  //考勤班次id，没有的话表示该次打卡不在排班内
	private String isLegal;  //是否合法,，当timeResult和locationResult都为Normal时，该值为Y；否则为N
	private String locationMethod;  //定位方法
	private int deviceId;  //设备id
	private String userAddress;  //用户打卡地址
	private String userLongitude;  //用户打卡经度
	private String userLatitude;  //用户打卡纬度
	private String userAccuracy;  //用户打卡定位精度
	private String userSsid;   //用户打卡wifi SSID
	private String userMacAddr;  //用户打卡wifi Mac地址
	private Date planCheckTime;  //排班打卡时间
	private String baseAddress;  //基准地址
	private String baseLongitude;  //基准经度
	private String baseLatitude;  //基准纬度
	private String baseAccuracy;  //基准定位精度
	private String baseSsid;  //基准wifi ssid
	private String baseMacAddr;   //基准 Mac 地址
	private String outsideRemark;  //打卡备注
	private String checkType; //考勤类型
	private String sourceType;  //数据来源
	private String timeResult;  //时间结果
	private String locationResult;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public int getPlanId() {
		return planId;
	}
	public void setPlanId(int planId) {
		this.planId = planId;
	}
	public Date getWorkDate() {
		return workDate;
	}
	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getApproveId() {
		return approveId;
	}
	public void setApproveId(int approveId) {
		this.approveId = approveId;
	}
	public int getProcInstId() {
		return procInstId;
	}
	public void setProcInstId(int procInstId) {
		this.procInstId = procInstId;
	}
	public Date getBaseCheckTime() {
		return baseCheckTime;
	}
	public void setBaseCheckTime(Date baseCheckTime) {
		this.baseCheckTime = baseCheckTime;
	}
	public Date getUserCheckTime() {
		return userCheckTime;
	}
	public void setUserCheckTime(Date userCheckTime) {
		this.userCheckTime = userCheckTime;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getIsLegal() {
		return isLegal;
	}
	public void setIsLegal(String isLegal) {
		this.isLegal = isLegal;
	}
	public String getLocationMethod() {
		return locationMethod;
	}
	public void setLocationMethod(String locationMethod) {
		this.locationMethod = locationMethod;
	}
	public int getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserLongitude() {
		return userLongitude;
	}
	public void setUserLongitude(String userLongitude) {
		this.userLongitude = userLongitude;
	}
	public String getUserLatitude() {
		return userLatitude;
	}
	public void setUserLatitude(String userLatitude) {
		this.userLatitude = userLatitude;
	}
	public String getUserAccuracy() {
		return userAccuracy;
	}
	public void setUserAccuracy(String userAccuracy) {
		this.userAccuracy = userAccuracy;
	}
	public String getUserSsid() {
		return userSsid;
	}
	public void setUserSsid(String userSsid) {
		this.userSsid = userSsid;
	}
	public String getUserMacAddr() {
		return userMacAddr;
	}
	public void setUserMacAddr(String userMacAddr) {
		this.userMacAddr = userMacAddr;
	}
	public Date getPlanCheckTime() {
		return planCheckTime;
	}
	public void setPlanCheckTime(Date planCheckTime) {
		this.planCheckTime = planCheckTime;
	}
	public String getBaseAddress() {
		return baseAddress;
	}
	public void setBaseAddress(String baseAddress) {
		this.baseAddress = baseAddress;
	}
	public String getBaseLongitude() {
		return baseLongitude;
	}
	public void setBaseLongitude(String baseLongitude) {
		this.baseLongitude = baseLongitude;
	}
	public String getBaseLatitude() {
		return baseLatitude;
	}
	public void setBaseLatitude(String baseLatitude) {
		this.baseLatitude = baseLatitude;
	}
	public String getBaseAccuracy() {
		return baseAccuracy;
	}
	public void setBaseAccuracy(String baseAccuracy) {
		this.baseAccuracy = baseAccuracy;
	}
	public String getBaseSsid() {
		return baseSsid;
	}
	public void setBaseSsid(String baseSsid) {
		this.baseSsid = baseSsid;
	}
	public String getBaseMacAddr() {
		return baseMacAddr;
	}
	public void setBaseMacAddr(String baseMacAddr) {
		this.baseMacAddr = baseMacAddr;
	}
	public String getOutsideRemark() {
		return outsideRemark;
	}
	public void setOutsideRemark(String outsideRemark) {
		this.outsideRemark = outsideRemark;
	}
	public String getCheckType() {
		return checkType;
	}
	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}
	public String getSourceType() {
		return sourceType;
	}
	public void setSourceType(String sourceType) {
		this.sourceType = sourceType;
	}
	public String getTimeResult() {
		return timeResult;
	}
	public void setTimeResult(String timeResult) {
		this.timeResult = timeResult;
	}
	public String getLocationResult() {
		return locationResult;
	}
	public void setLocationResult(String locationResult) {
		this.locationResult = locationResult;
	}
	
	
	
}
