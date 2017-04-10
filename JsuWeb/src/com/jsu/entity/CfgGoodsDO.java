package com.jsu.entity;

public class CfgGoodsDO {
    private Integer id;

    private String name;

    private Integer goodsTypeId;

    private String flag;

    private Double periodAmt;

    private Integer stock;
    
    private String isRecommend;

    private Double salesAmt;

    private String salesDateBegin;

    private String salesDateEnd;

    private String salesLimitNum;

    private String picUrl;

    private String remark;

    private String orderSeq;
    
    private String updateTime;
    
    private String updateUser;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(Integer goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public Double getPeriodAmt() {
        return periodAmt;
    }

    public void setPeriodAmt(Double periodAmt) {
        this.periodAmt = periodAmt;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Double getSalesAmt() {
        return salesAmt;
    }

    public void setSalesAmt(Double salesAmt) {
        this.salesAmt = salesAmt;
    }

    public String getSalesDateBegin() {
        return salesDateBegin;
    }

    public void setSalesDateBegin(String salesDateBegin) {
        this.salesDateBegin = salesDateBegin == null ? null : salesDateBegin.trim();
    }

    public String getSalesDateEnd() {
        return salesDateEnd;
    }

    public void setSalesDateEnd(String salesDateEnd) {
        this.salesDateEnd = salesDateEnd == null ? null : salesDateEnd.trim();
    }

    public String getSalesLimitNum() {
        return salesLimitNum;
    }

    public void setSalesLimitNum(String salesLimitNum) {
        this.salesLimitNum = salesLimitNum == null ? null : salesLimitNum.trim();
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl == null ? null : picUrl.trim();
    }

    public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getOrderSeq() {
        return orderSeq;
    }

    public void setOrderSeq(String orderSeq) {
        this.orderSeq = orderSeq == null ? null : orderSeq.trim();
    }

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public String getIsRecommend() {
		return isRecommend;
	}

	public void setIsRecommend(String isRecommend) {
		this.isRecommend = isRecommend;
	}
}