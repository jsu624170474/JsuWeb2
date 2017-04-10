package com.jsu.dao;

import java.util.List;

import com.jsu.entity.LeaveMessageDO;

public interface LeaveMessageDao {
    int insert(LeaveMessageDO record);

    public List<LeaveMessageDO> list(LeaveMessageDO leaveMessage);
}