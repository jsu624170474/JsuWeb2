package com.jsu.entity;

import java.util.List;

public class SysMenuInfoDO {
    private String menuId;

    private String menuName;

    private String menuOrder;

    private String linkUrl;

    private String dispImage;

    private String status;

    private String remark;
    
    private List<SysMenuInfoDO> subMenuList;

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId == null ? null : menuId.trim();
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public String getMenuOrder() {
        return menuOrder;
    }

    public void setMenuOrder(String menuOrder) {
        this.menuOrder = menuOrder == null ? null : menuOrder.trim();
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl == null ? null : linkUrl.trim();
    }

    public String getDispImage() {
        return dispImage;
    }

    public void setDispImage(String dispImage) {
        this.dispImage = dispImage == null ? null : dispImage.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public List<SysMenuInfoDO> getSubMenuList() {
		return subMenuList;
	}

	public void setSubMenuList(List<SysMenuInfoDO> subMenuList) {
		this.subMenuList = subMenuList;
	}
    
}