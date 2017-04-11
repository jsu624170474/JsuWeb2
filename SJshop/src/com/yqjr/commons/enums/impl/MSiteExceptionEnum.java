package com.yqjr.commons.enums.impl;

import com.alibaba.fastjson.JSONObject;
import com.yqjr.commons.enums.ExceptionEnums;
/**
 * @ClassName:     MSiteExceptionEnum.java
 * @Description:   TODO(抛出异常的枚举) 
 * @author         Tas
 * @version        V1.0  
 * @Date           2015年11月19日 下午6:20:12
 */
public enum MSiteExceptionEnum implements ExceptionEnums {
	QUERY_SUCCESS(true, "查询成功"),
	BUY_SUCCESS(true, "下单成功"),
	CANCEL_ORDER_SUCCESS(true, "取消订单成功"),
	ADD_CART_SUCCESS(true, "加入购物车成功"),
	SEND_CAPTCHA_SUCCESS(true, "发送验证码成功，请注意查收"),
	SAVE_SUCCESS(true, "保存成功"),
	ADD_COLLECT_SUCCESS(true, "加入收藏成功"),
	CONCLUDE_SUCCESS(true, "签署合同成功"),
	DEL_SUCCESS(true, "删除成功"),
	PWD_CHANGE_SUCCESS(true, "密码重置成功"),
	LOGIN_SUCCESS(true, "登录成功"),
	CART_WITHOUT_PRO(true, "购物车中没有商品"),
	SERVER_PROCESS_REPAY_SUCCESS(true, "服务端预还款处理成功"),
	SERVER_PROCESS_PAY_SUCCESS(true, "测试支付成功"),
	REGISTER_SUCCESS(true, "注册成功"),
	UPDATE_SUCCESS(true, "更新成功"),
	CREDIT_SUCCESS(true, "信贷系统成功"),
	ORDER_REVIEW_SUCCESS(true, "信贷系统审核成功"),
	RED_ENVELOPE_GET(true, "红包已拆开"),
	WITHDRAW_SUCCESS(true, "提现成功"),
	

	CUST_VERIFY_EXIST_DONT_CONT(true, "我们检测到您已有认证信息，下面的认证信息您无需再继续填写了"),
	CUST_VERIFY_EXIST_DONT_CONT_BUT_NOT_REVIEW(true, "我们检测到您已有认证信息，但未审核"),
	
	UNKNOW_ERROR(false, "未知错误"),
	MD5_ERROR(false, "系统异常，请重试"),
	USER_NOT_EXIST(false,"用户不存在"),
	BLACKLIST(false,"根据您的信用记录，暂不可购买"),
	ORGAN_NOT_EXIST(false, "商户不存在"),
	WAP_USER_NOT_EXIST(false,"不存在该推荐码"),
	CANT_BUY_DIFF_REPAY_TYPE_PRO(false,"不能选择不同还款方式的商品一起购买"),
	CREDIT_NOT_ENOUGH(false,"额度不够了"),
	TO_MUCH_DOWN_PAY(false,"您输入的首付太多了，请选择全款购买"),
	CUST_VERIFY_NOT_EXIST(false,"认证信息不存在"),
	CANCEL_ORDER_FAILS_BY_SYSTEM(false,"系统错误，取消订单失败"),
	CANCEL_ORDER_FAILS_BY_STATUS(false,"订单当前状态不能取消"),
	DEL_ORDER_FAILS_BY_STATUS(false,"订单当前状态不能删除"),
	PRO_IN_CART_EXIST(false,"购物车已存在该商品"),
	ADD_CART_FAILS(false, "加入购物车失败"),
	SAVE_FAILS(false, "保存失败"),
	ADD_COLLECT_FAILS(false, "加入收藏失败"),
	CAPTCHA_WHRONG(false, "验证码错误"),
	CONCLUDE_ERROR(false, "签署合同错误"),
	PRO_IS_NOT_EXIST(false, "没有该商品"),
	OLD_AND_NEW_PWD_DIFF(false, "密码不一致"),
	OLD_PWD_DIFF(false, "原密码错误"),
	USER_OR_PWD_WHRONG(false, "用户名或密码错误"),
	CUST_VERIFY_NEVER_WRITE(false, "您还没有填写认证信息"),
	SHOULD_NOT_REPAY(false, "不需要还款"),
	ORDER_NOT_EXIST(false, "订单不存在"),
	ORDER_NOT_BELONG_ORGAN(false, "订单不属于该商户"),
	CHILD_ORDER_NOT_EXIST(false, "子订单不存在"),
	USER_EXIST(false, "用户已存在"),
	NO_AGREEMENT(false, "用户没有同意协议"),
	UPDATE_FAILS(false, "更新失败"),
	ORGAN_NOT_EXIST_USER(false, "该商户不存在该用户"),
	ORGAN_NOT_EXIST_PRODUCT(false, "该商户不存在该商品"),
	PRODUCT_NOT_EXIST(false, "商品不存在"),
	USER_BLOCK(false, "用户已冻结"),
	CREDIT_ERROR(false, "信贷系统出错"),
	STATUS_ERROR(false, "订单状态错误"),
	PRO_SOLD_OUT(false, "商品已下架"),
	USER_DELETED(false, "用户已被删除"),
	ORGAN_USER_NOT_EXIST(false, "推广员不存在"),
	ORGAN_ACCOUNT_NOT_EXIST(false, "商户账户不存在"),
	ORGAN_ACCOUNT_BLOCK(false, "商户账户已停用"),
	SYS_ACCOUNT_NOT_EXIST(false, "商户用户不存在，请创建ACCOUNT_NO为hfq的商户用户"),
	SYS_TRANS_NOT_EXIST(false, "交易不存在"),
	GUARANTEE_ERROR(false, "担保状态错误"),
	AMT_ERROR(false, "交易金额与订单金额不符"),
	USER_CUST_ALREADY(false,"用户已经有认证信息，无需重复认证 "),
	TRANS_ALREADY(false,"交易重复"),
	CHANGE_ACCOUNT_IS_NOT_EXIST(false,"用户零钱账户不存在"),
	RED_ENVELOPE_IS_ALREADY_GET(false,"该红包已拆开，请刷新页面查看"),
	RED_ENVELOPE_IS_NOT_EXIST(false,"红包不存在"),
	INVALID_CARD_NUMBER(false,"无效的卡号"),
	CHANGE_INSUFFICIENT(false,"零钱余额不足"),
	CHANGE_CAN_NOT_BE_ZERO(false,"提现金额不能为0"),
	RED_ENVELOPE_CODE_ERROR(false,"红包码不存在，请重新填写"),
	RED_ENVELOPE_CODE_FOR_ITSELF(false,"红包码不能为自己的手机号"),
	RECEIPT_TYPE_ERROR(false,"收款方式不正确"),
	PRO_TYPE_DO_NOT_BIND_SYS_PRODUCT_TYPE(false,"下单商品的商品类型找不到对应的产品类型，请联系我们客服400-001-5287")
	;

	public boolean retCode;  
    public String msg;  
    private MSiteExceptionEnum(boolean retCode, String msg){  
        this.retCode = retCode;  
        this.msg = msg;  
    }  	
	@Override
	public boolean getRetCode() {
		// TODO Auto-generated method stub
		return retCode;
	}

	@Override
	public String getMsg() {
		// TODO Auto-generated method stub
		return msg;
	}

	@Override
	public JSONObject getJsonHead(){
		JSONObject retJson = new JSONObject();
		if(getMsg().equals("我们检测到您已有认证信息，下面的认证信息您无需再继续填写了")){
			retJson.put("retcode", "done");
		}else if(getMsg().equals("我们检测到您已有认证信息，但未审核")){
			retJson.put("retcode", "done");
		}else{
			if(getRetCode()){
				retJson.put("retcode","success");
			}else{
				retJson.put("retcode", "failed");
				retJson.put("errcode",this.name());
			}
		}
		retJson.put("msg",getMsg());
		return retJson;
	}
	public static void main(String[] args) {
		System.out.println(MSiteExceptionEnum.CUST_VERIFY_EXIST_DONT_CONT.getJsonHead());
	}
}
