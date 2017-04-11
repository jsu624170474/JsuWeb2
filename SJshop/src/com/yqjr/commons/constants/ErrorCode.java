package com.yqjr.commons.constants;

/**
 * 错误码
 * @author suian
 */
public enum ErrorCode {

	E0001("E0001", "规则编号为空"),
	E0002("E0002", "数据源为空"),
	E0003("E0003", "身份证号为空"),
	E0004("E0004", "学校编号为空"),
	E0005("E0005", "学校区域编码为空"),
	E0006("E0006", "民族编码为空"),
	E0007("E0007", "户籍区域编码为空"),
	E0008("E0008", "商户号为空"),
	E0009("E0009", "无此规则编号"),
	E0010("E0010", "订单流水号为空"),
	E0011("E0011", "订单流水号重复"),
	E0012("E0012", "渠道编号为空"),
	E0013("E0013", "姓名为空"),
	E0014("E0014", "尚未开通渠道"),
	E0015("E0015", "身份证号格式不正确"),
	E0016("E0016", "手机号为空"),
	E0017("E0017", "商户名称为空"),
	E0018("E0018", "银行卡号为空"),
	E0019("E0019", "商户负责人姓名为空"),
	E0020("E0020", "商户负责人手机号为空"),
	
	E0050("E0050", "此客户已在黑名单库"),
	E0098("E0098", "签名验证失败"),
	E0099("E0099", "系统异常")
	;
	
	private String code ;
	private String name ;
     
    private ErrorCode( String code , String name){
    	this.code = code ;
        this.name = name ;
    }
    public String getName() {
        return name;
    }
    public String getCode() {
        return code;
    }
    public static String getName(String code){
    	
    	for(ErrorCode error : ErrorCode.values()){
    		if(error.getCode().equals(code)){
    			return error.getName();
    		}
    	}
    	
    	return "";
    }
}
