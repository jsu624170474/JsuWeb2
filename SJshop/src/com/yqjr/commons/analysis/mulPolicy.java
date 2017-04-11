package com.yqjr.commons.analysis;

/**
 * Created by xufei on 2016/10/22.
 */
public class mulPolicy {

    public static String P0001(String A1 , String A2 ,String AA1 ,String AB1) {
        String flag = "S" ;
        if("Y".equals(A1)&&"Y".equals(A2)&&"Y".equals(AA1)&&"N".equals(AB1)){
            flag = "F" ;
        }
        return flag ;
    }

    /**
     * 申请身份证号与详单身份证号比对是否完全一致
     * @param A1
     * @param A2
     * @param AA1
     * @param AB1
     * @return
     */
    public static String P0002(String A1, String A2, String AA1, String AB1){
        String flag = "S";
        if ("Y".equals(A1) && "Y".equals(A2) && "N".equals(AA1) && "Y".equals(AB1)){
            flag = "F";
        }
        return flag;
    }

    /**
     * 申请人姓名与详单姓名比对是否完全一致
     * @param A1
     * @param A2
     * @param AA1
     * @param AC1
     * @return
     */
    public static String P0003(String A1, String A2, String AA1, String AC1){
        String flag = "S";
        if("Y".equals(A1) && "Y".equals(A2) && "N".equals(AA1) && "Y".equals(AC1)){
            flag = "F";
        }
        return flag;
    }

    /**
     * 申请人姓名与详单姓名比对是否完全一致
     * @param A1
     * @param A2
     * @param AA1
     * @param AB1
     * @return
     */
    public static String P0004(String A1, String A2, String AA1, String AB1){
        String flag = "S";
        if("O".equals(A1) && "O".equals(A2) && "Y".equals(AA1) && "N".equals(AB1)){
            flag = "F";
        }
        return flag;
    }

    /**
     * 详单姓名与朋友姓名比对是否完全一致
     * @param A1
     * @param A2
     * @param AA1
     * @param AC1
     * @return
     */
    public static String P0005(String A1, String A2, String AA1, String AC1){
        String flag = "S";
        if("O".equals(A1) && "O".equals(A2) && "N".equals(AA1) && "Y".equals(AC1)){
            flag = "F";
        }
        return flag;
    }

    /**
     * B4是否大于等10天
     * @param B2
     * @param B3
     * @param B4
     * @return
     */
    public static String P0006(String B2,String B3,String B4){
        String flag = "S";
        if("Y".equals(B2) && "Y".equals(B3) && "Y".equals(B4)){
            flag = "F";
        }
        return flag;
    }
}
