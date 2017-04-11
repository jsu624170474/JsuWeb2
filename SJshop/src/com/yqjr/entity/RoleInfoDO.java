package com.yqjr.entity;

import java.util.Date;

/**
 * 
 * @ClassName:		RoleInfoDO.java
 * @Description:	系统角色信息表
 * @author 			WQ
 * @date 			2016年6月19日 下午3:15:59
 *
 */
public class RoleInfoDO {
	private Integer roleId;
	private String roleName;//角色名称
	private String creator;//创建人
	private Date createTime;//创建时间
	private Integer auditSequence;//审核级别
	private String roleDisc;//角色备注
	
	private Integer dealerId;//经销商ID
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
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
	public Integer getAuditSequence() {
		return auditSequence;
	}
	public void setAuditSequence(Integer auditSequence) {
		this.auditSequence = auditSequence;
	}
	public String getRoleDisc() {
		return roleDisc;
	}
	public void setRoleDisc(String roleDisc) {
		this.roleDisc = roleDisc;
	}
	public Integer getDealerId() {
		return dealerId;
	}
	public void setDealerId(Integer dealerId) {
		this.dealerId = dealerId;
	}
	
}
