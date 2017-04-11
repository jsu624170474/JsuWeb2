package com.yqjr.commons.analysis;

import com.yqjr.commons.util.NumberUtil;

/**
 * Created by xufei on 2016/10/22.
 */
public class singlePolicy {
    /**
     * B1是否大于等于112天
     * @param B1
     * @return flag
     */
    public String P0007(int B1){
        String flag = "S";
        if(B1>=112){
            flag = "F";
        }
        return flag;
    }

    /**
     * C1是否大于等于2次
     * @param C1
     * @return flag
     */
    public String P0008(int C1){
        String flag = "S";
        if(C1>=2){
            flag = "F";
        }
        return flag;
    }

    /**
     * C3是否大于等于25元
     * @param C3
     * @return flag
     */
    public String P0009(int C3){
        String flag = "S";
        if(C3>=25){
            flag = "F";
        }
        return flag;
    }

    /**
     * C5是否大于等于0.5
     * @param C5
     * @return flag
     */
    public static String P0010(float C5){
        String flag = "S";
        if(C5>=0.5){
            flag = "F";
        }
        return flag;
    }

    /**
     * C6中小于-0.1的数值是否连续大于等于2个
     * @param C6
     * @return flag
     */
    public static String P0011(float C6[]){
        String flag = "S";
        if(NumberUtil.count(C6)>=2){
            flag = "F";
        }
        return flag;
    }

    /**
     * C8中小于-0.1的数值是否连续大于等于2个
     * @param C8
     * @return flag
     */
    public static String P0012(float C8[]){
        String flag = "S";
        if(NumberUtil.count(C8)>=2){
            flag = "F";
        }
        return flag;
    }

    /**
     * C11是否大于月度话费金额最大值*80%
     * @param C11
     * @param D12
     * @return flag
     */
    public static String P0013(float C11,float D12){
        String flag = "S";
        if(C11>D12*0.8){
            flag = "F";
        }
        return flag;
    }

    /**
     * D1是否大于等于4次
     * @param D1
     * @return
     */
    public static String P0014(int D1){
        String flag = "S";
        if(D1>=4){
            flag = "F";
        }
        return flag;
    }

    /**
     * D2是否大于等于2次
     * @param D2
     * @return
     */
    public static String P0015(int D2){
        String flag = "S";
        if(D2>=2){
            flag="F";
        }
        return flag;
    }

    /**
     * D3是否大于等于1次
     * @param D3
     * @return
     */
    public static String P0016(int D3){
        String flag = "S";
        if(D3>=1){
            flag = "F";
        }
        return flag;
    }

    /**
     * D4是否大于等于2次
     * @param D4
     * @return
     */
    public static String P0017(int D4){
        String flag = "S";
        if(D4>=2){
            flag = "F";
        }
        return flag;
    }

    /**
     * D6是否大于等于60条
     * @param D6
     * @return
     */
    public static String P0018(int D6){
        String flag = "S";
        if(D6>=60){
            flag = "F";
        }
        return flag;
    }

    /**
     * D8是否大于等于0.5
     * @param D8
     * @return
     */
    public static String P0019(float D8){
        String flag = "S";
        if(D8>=0.5){
            flag = "F";
        }
        return flag;
    }

    /**
     * D9中小于-0.1的数值是否连续大于等于2个
     * @param D9
     * @return
     */
    public static String P0020(float D9[]){
        String flag = "S";
        if(NumberUtil.count(D9)>=2){
            flag = "F";
        }
        return flag;
    }
    public static String P0021(float D11[]){
        String flag = "S";
        if(NumberUtil.count(D11)>=2){
            flag="F";
        }
        return flag;
    }

    /**
     * D14是否大于月度有效通话记录条数(D12)最大值*80%
     * @param D12
     * @param D14
     * @return
     */
    public static String P0022(float D12,float D14){
        String flag = "S";
        if(D14>D12*0.8){
            flag = "F";
        }
        return flag;
    }
    /**
     * E4是否大于等于2次
     * @param E4
     * @return
     */
    public static String P0023(int E4){
        String flag = "S";
        if(E4>=2){
            flag = "F";
        }
        return flag;
    }
    /**
     * E5是否大于等于10组
     * @param E5
     * @return
     */
    public static String P0024(int E5){
        String flag = "S";
        if(E5>=10){
            flag = "F";
        }
        return flag;
    }
    /**
     * F5是否大于等于1条
     * @param F5
     * @return
     */
    public static String P0025(int F5){
        String flag = "S";
        if(F5>=1){
            flag = "F";
        }
        return flag;
    }
    /**
     * F7是否大于等于2次
     * @param F7
     * @return
     */
    public static String P0026(int F7){
        String flag = "S";
        if(F7>=2){
            flag = "F";
        }
        return flag;
    }
    /**
     * G1是否大于等于2
     * @param G1
     * @return
     */
    public static String P0027(int G1){
        String flag = "S";
        if(G1>=2){
            flag = "F";
        }
        return flag;
    }
    /**
     * H4是否大于等于80%
     * @param H4
     * @return
     */
    public static String P0028(float H4){
        String flag = "S";
        if(H4>=0.8){
            flag = "F";
        }
        return flag;
    }
    /**
     * I3大于等于0.2的条件下，I3是否大于等于2个月
     * @param I3
     * @return
     */
    public static String P0029(float I3){
        String flag = "S";
        if(I3>=0.2){
            if(I3>=2) {
                flag = "F";
            }
        }
        return flag;
    }
    /**
     * J1是否大于等于1次
     * @param J1
     * @return
     */
    public static String P0030(int J1){
        String flag = "S";
        if(J1>=1){
            flag = "F";
        }
        return flag;
    }
    /**
     * J2是否大于等于1次
     * @param J2
     * @return
     */
    public static String P0031(int J2){
        String flag = "S";
        if(J2>=1){
            flag = "F";
        }
        return flag;
    }
}
