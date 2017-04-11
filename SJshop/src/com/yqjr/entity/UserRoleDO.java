package com.yqjr.entity;

import java.math.BigInteger;
import java.util.Date;

public class UserRoleDO {
	private BigInteger userRoleId;	//主键
	private BigInteger userId;		//用户ID
	private BigInteger roleId;		//角色代表的ID
	private String creator;			//创建者
	private Date createTime;		//创建的时间
	
	public UserRoleDO() {
		super();
	}
	public UserRoleDO(BigInteger userRoleId, BigInteger userId,
                      BigInteger roleId, String creator, Date createTime) {
		super();
		this.userRoleId = userRoleId;
		this.userId = userId;
		this.roleId = roleId;
		this.creator = creator;
		this.createTime = createTime;
	}
	public BigInteger getUserRoleId() {
		return userRoleId;
	}
	public void setUserRoleId(BigInteger userRoleId) {
		this.userRoleId = userRoleId;
	}
	public BigInteger getUserId() {
		return userId;
	}
	public void setUserId(BigInteger userId) {
		this.userId = userId;
	}
	public BigInteger getRoleId() {
		return roleId;
	}
	public void setRoleId(BigInteger roleId) {
		this.roleId = roleId;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
