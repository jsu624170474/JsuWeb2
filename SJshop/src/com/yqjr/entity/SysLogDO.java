package com.yqjr.entity;

public class SysLogDO {
    private Integer operId;

    private String operUser;

    private String operIp;

    private String operType;

    private String operName;

    private String operContent;

    private String operDt;
    
    private String operStatus;

    public Integer getOperId() {
        return operId;
    }

    public void setOperId(Integer operId) {
        this.operId = operId;
    }

    public String getOperUser() {
        return operUser;
    }

    public void setOperUser(String operUser) {
        this.operUser = operUser == null ? null : operUser.trim();
    }

    public String getOperIp() {
        return operIp;
    }

    public void setOperIp(String operIp) {
        this.operIp = operIp == null ? null : operIp.trim();
    }

    public String getOperType() {
        return operType;
    }

    public void setOperType(String operType) {
        this.operType = operType == null ? null : operType.trim();
    }

    public String getOperName() {
        return operName;
    }

    public void setOperName(String operName) {
        this.operName = operName == null ? null : operName.trim();
    }

    public String getOperContent() {
        return operContent;
    }

    public void setOperContent(String operContent) {
        this.operContent = operContent == null ? null : operContent.trim();
    }

    public String getOperDt() {
        return operDt;
    }

    public void setOperDt(String operDt) {
        this.operDt = operDt == null ? null : operDt.trim();
    }

	public String getOperStatus() {
		return operStatus;
	}

	public void setOperStatus(String operStatus) {
		this.operStatus = operStatus;
	}
}