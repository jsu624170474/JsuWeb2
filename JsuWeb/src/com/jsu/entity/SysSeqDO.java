package com.jsu.entity;

public class SysSeqDO {
    private String name;

    private Long val;

    private Integer raise;

    private String desc;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getVal() {
        return val;
    }

    public void setVal(Long val) {
        this.val = val;
    }

    public Integer getRaise() {
        return raise;
    }

    public void setRaise(Integer raise) {
        this.raise = raise;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc == null ? null : desc.trim();
    }
}