package com.yqjr.task;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.yqjr.commons.util.PublicRequestUtil;
import com.yqjr.commons.util.StringUtil;

/**
 * Created by xufei on 2016/10/23.
 */
@Component
public class BatchWithhold {
    private Logger logger = LoggerFactory.getLogger(BatchWithhold.class);

     public void sendNotifyResult(){

         logger.debug("====定时发送未成功的通知.sendTrans start.====");

         logger.debug("====定时发送未成功的通知.sendTrans end.====");
     }
}
