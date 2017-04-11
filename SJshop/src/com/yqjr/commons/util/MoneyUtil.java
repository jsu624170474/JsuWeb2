package com.yqjr.commons.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class MoneyUtil {

	public static String formatMoney(Object osource, int scale, String fmtstr) {
		if (osource == null || "".equals(osource))
			return "";

		String source = osource.toString();

		source = new BigDecimal(source).toPlainString();

		source = source.trim();
		if (source.length() == 0) {
			source = "0";
		}
		Double money = new Double(source);
		DecimalFormat fmt = null;
		String pattern = "###,##0";
		if (fmtstr != null && !fmtstr.equals("")) {
			pattern = fmtstr;
		}
		if (scale > 0) {
			pattern = pattern + ".";
			try {
				pattern = StringUtil.rightPad(pattern, pattern.length() + scale, "0");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		fmt = new DecimalFormat(pattern);
		source = fmt.format(money);
		return source;
	}
	
	/**
	 * 格式化金额显示
	 * 
	 * @param source
	 *            例:12345.67800
	 * @param scale
	 *            例:2
	 * @return 例:12,345.68
	 */
	public static String formatMoney(Object osource, int scale) {
		return formatMoney(osource, scale, "");
	}
	/**
	 * 将人民币转化为大写
	 * 如:1837.33返回：壹仟捌佰叁拾柒圆叁角叁分
	 * @param source
	 * @return
	 */
	public static String formatRmb(String source) {
		String CN_ZERO = "零";
		String CN_SYMBOL = "";
		String CN_DOLLAR = "圆";
		String CN_INTEGER = "整";

		String[] digits = new String[] { "零", "壹", "贰", "叁", "肆", "伍", "陆",
				"柒", "捌", "玖" };
		String[] radices = new String[] { "", "拾", "佰", "仟" };
		String[] bigRadices = new String[] { "", "万", "亿", "万" };
		String[] decimals = new String[] { "角", "分" };

		String integral = null; // 整数部分
		String decimal = null; // 小数部分
		String outputCharacters = null; // 最终转换输出结果

		String d = null;
		int zeroCount = 0, p = 0, quotient = 0, modulus = 0;

		// 删除数字中的逗号,
		source = source.replace("/,/g", "");
		// 删除数字左边的0
		source = source.replace("/^0+/", "");

		// 拆分数字中的整数与小数部分
		String[] parts = source.split("\\.");
		if (parts.length > 1) {
			integral = parts[0];
			decimal = parts[1];

			// 如果小数部分长度大于2，四舍五入，保留两位小数
			if (decimal.length() > 2) {
				long dd = Math.round(Double.parseDouble("0." + decimal) * 100);
				decimal = Long.toString(dd);
			}

		} else {
			integral = parts[0];
			decimal = "0";
		}

		// Start processing:
		outputCharacters = "";
		// Process integral part if it is larger than 0:
		if (Double.parseDouble(integral) > 0) {

			zeroCount = 0;

			for (int i = 0; i < integral.length(); i++) {

				p = integral.length() - i - 1;
				d = integral.substring(i, i + 1);

				quotient = p / 4;
				modulus = p % 4;
				if (d.equals("0")) {
					zeroCount++;
				} else {
					if (zeroCount > 0) {
						outputCharacters += digits[0];
					}
					zeroCount = 0;
					outputCharacters += digits[Integer.parseInt(d)]
							+ radices[modulus];
				}
				if (modulus == 0 && zeroCount < 4) {
					outputCharacters += bigRadices[quotient];
				}
			}
			outputCharacters += CN_DOLLAR;
		}

		// Process decimal part if it is larger than 0:
		if (Double.parseDouble(decimal) > 0) {
			for (int i = 0; i < decimal.length(); i++) {
				d = decimal.substring(i, i + 1);
				if (!d.equals("0")) {
					outputCharacters += digits[Integer.parseInt(d)]
							+ decimals[i];
				} else {
					if (i == 0) {
						outputCharacters += CN_ZERO;
					}
				}
			}
		}

		// Confirm and return the final output string:
		if (outputCharacters.equals("")) {
			outputCharacters = CN_ZERO + CN_DOLLAR;
		}
		if (decimal == null || decimal.equals("0")) {
			outputCharacters += CN_INTEGER;
		}

		outputCharacters = CN_SYMBOL + outputCharacters;
		return outputCharacters;
	}
	
	/**
	 * 将金额单位分转换为元
	 * 
	 * @param cent
	 * @return
	 */
	public static Double cent2Dollar(Integer cent) {
		return new Double(dollar2Cent(cent.intValue()));
	}
	
	public static String cent2Dollar(String cent, int fmtScale) {
		if (fmtScale < 0 || fmtScale > 10)
			fmtScale = 0;
		return formatMoney(cent2Dollar(cent), fmtScale);
	}

	public static String cent2Dollar(String cent) {
		if (cent == null)
			return "0.00";
		double icent = 0;
		try {
			icent = new Double(cent).doubleValue();
		} catch (Exception ex) {
			ex.printStackTrace();
			return "0.00";
		}
		return "" + cent2Dollar(icent);
	}

	public static Double cent2Dollar(double cent) {
		if (cent == 0)
			return new Double("0.00");

		try {
			return new Double(new Double(cent).doubleValue() / 100);
		} catch (Exception ex) {
			ex.printStackTrace();
			return new Double(0.00);
		}
	}

	public static String dollar2Cent(String cent) {
		if (cent == null)
			return "0";
		double icent = 0;
		try {
			icent = new Double(cent).doubleValue();
		} catch (Exception ex) {
			ex.printStackTrace();
			return "0";
		}
		return "" + dollar2Cent(icent);
	}

	public static int dollar2Cent(double cent) {
		if (cent == 0)
			return 0;

		return new Double(cent * 100).intValue();
	}
	/**
	 * 精确减法运算
	 * @param v1
	 * @param v2
	 * @return
	 */
	public static Double doubleSub(Double v1,Double v2){
		BigDecimal b1=new BigDecimal(Double.toString(v1));
		BigDecimal b2=new BigDecimal(Double.toString(v2));
		return b1.subtract(b2).doubleValue();
	}
	/**
	 * 精确加法运算
	 * @param v1
	 * @param v2
	 * @return
	 */
	public static Double doubleAdd(Double v1,Double v2){
		BigDecimal b1=new BigDecimal(Double.toString(v1));
		BigDecimal b2=new BigDecimal(Double.toString(v2));
		return b1.add(b2).doubleValue();
	}
	/**
	 * 精确乘法运算
	 * @param v1
	 * @param v2
	 * @return
	 */
	public static Double doubleMul(Double v1,Double v2){
		BigDecimal b1=new BigDecimal(Double.toString(v1));
		BigDecimal b2=new BigDecimal(Double.toString(v2));
		return b1.multiply(b2).doubleValue();
	}
	/**
	 * 提供精确的除法运算，结果四舍五入
	 * @param v1除数
	 * @param v2被除数
	 * @param scale精确位数
	 * @return
	 */
	public static Double doubleDiv(Double v1,Double v2,int scale){
		BigDecimal b1=new BigDecimal(Double.toString(v1));
		BigDecimal b2=new BigDecimal(Double.toString(v2));
		return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	/**
	 * 提供精确的四舍五入
	 * @param v1需要四舍五入的数字
	 * @param scale小数点后保留几位
	 * @return结果
	 */
	public static Double round(double v1,int scale){
		if(scale<0){
			return v1;
		}
		BigDecimal b1=new BigDecimal(Double.toString(v1));
		BigDecimal b2=new BigDecimal("1");
		return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	/**
	 * 获取小于该数的最大整数
	 * @param value
	 * @return
	 */
	public static Integer floor(Double value){
		return (int) Math.floor(value);
	}
	
	
	
	
	/**
	 * 
	 * @author lzk_b
	 *
	 *	枚举类型，用来定义计算月供的类型
	 *	MONTHLY_AMT 为惠分期月供
	 *	OTHER_MONTHLY_AMT 为市场月供
	 */
	public enum MonthlyAmtType{  
		
		MONTHLY_AMT(0.02),OTHER_MONTHLY_AMT(0.03);
		private MonthlyAmtType(double rate){
			this.rate = rate;
		}
		private double rate;
		
		public double value(){
			return this.rate;
		}
	} 
	/**
	 * 计算月供金额
	 * @param downPayment		首付金额
	 * @param periodNum			分期期数
	 * @param proSalePrice		销售价格
	 * @param interestRate		利率
	 * @return 月供
	 */
	public static Double calcMonthPayment(double downPayment,int periodNum,double proSalePrice,double interestRate){
		String  tmpResult = null;
		//interestRate = interestRate / 12;
		if(interestRate > 0){
			//double tmp = Math.pow((1+interestRate),periodNum);
			tmpResult = (Math.ceil(100*proSalePrice*(1-downPayment/proSalePrice)*(interestRate / 12)*(Math.pow((1+(interestRate / 12)),periodNum))/((Math.pow((1+(interestRate / 12)),periodNum))-1))/100)+"";
			return Double.parseDouble(tmpResult) ;
		}else{//利率为0，那么返回（售价-首付）/期数
			 tmpResult = Math.ceil((proSalePrice-downPayment)/periodNum) + "";
			 return Double.parseDouble(tmpResult) ;
		}
		
	}
	
	/**
	 * 计算提前还款的已还金额（提前还款代表是还一个订单剩下所以待还的期数）
	 * @author Tas
	 * @param proPeriodAmt	商品的分期金额（商品的价格减去商品的首付）（订单明细代表的就是商品）
	 * @param proMonthlyAmt	商品的月供（月供就是月供）
	 * @param paidNum		商品已还的期数（也就是订单已还的期数）
	 * @param unpaidNum		商品未还的期数（也就是订单未还期数）
	 * @param proRate		商品的利率（是购买的时候的利率，并不是商品的利率）
	 * @return				提前还款利息减半的金额
	 */
	public static Double calcCapitalForPrepayment(double proPeriodAmt,double proMonthlyAmt,int paidNum,int unpaidNum,double proRate){
		double capital = 0 ;
		double interest= 0;
		for (int i = 0; i < paidNum; i++) {
//			interest +=((proPeriodAmt-capital)*proRate/12);
			capital+=(proMonthlyAmt-((proPeriodAmt-capital)*proRate/12));
		}
		double unpaid= 0;
		proPeriodAmt-=capital;
		for (int i = 0; i < unpaidNum; i++) {
			interest +=((proPeriodAmt-unpaid)*proRate/12);
			if(i==0){
			unpaid+=(proMonthlyAmt-((proPeriodAmt)*proRate/12));
			}else{
				unpaid+=(proMonthlyAmt-((proPeriodAmt-unpaid)*proRate/12));
			}
		}
		interest = interest*0.5;
		unpaid+=interest;
		return unpaid;
	}
	
	/**
	 * 
	 * @Title: guaranteeAmt 
	 * @Description:担保额度恢复
	 * @param monAmt 月供
	 * @param batch 还款批次
	 * @param pernum 分期期数
	 * @param rate 月供利率(商品总的利率/12)
	 * @return
	 */
	public static double guaranteeAmt(double monAmt,Integer batch,Integer pernum,double rate){
		double minu = Math.pow(1+rate, pernum-batch+1);
		return MoneyUtil.doubleDiv(monAmt, minu, 2);
	}
	
	/**
	 * 
	 * @Title: interestAmt 
	 * @Description:计算订单的利息分成
	 * @param periodAmt 分期金额
	 * @param basicRate 月基准利率(基准利率/12)
	 * @param commisionRate 月佣金利率(佣金利率/12)
	 * @param orderRate 月订单利率(订单利率/12)
	 * @param periodNum 分期期数
	 * @return
	 */
	public static double interestAmt(double periodAmt, double basicRate,
			double commisionRate, double orderRate, Integer periodNum) {
		double totalRate = doubleAdd(basicRate, doubleAdd(commisionRate, orderRate));
		double totalDou = Math.pow(doubleAdd(1.0, totalRate), periodNum);
		double basicDou = Math.pow(doubleAdd(1.0, basicRate), periodNum);
		double totalAmt = doubleDiv(periodAmt*totalRate*totalDou, totalDou-1, 2);
		double basicAmt = doubleDiv(periodAmt*basicRate*basicDou, basicDou-1, 2);
		double amt = doubleSub(totalAmt, basicAmt)*0.7*periodNum;
		return amt;
	}
    /**
     * 实际利率法
     * @author Bean(mailto:mailxbs@126.com)
     * @param a 现值
     * @param b 年金
     * @param c 期数
     * @param cnt 运算次数
     * @param ina 误差位数
     * @return 利率
     */
    public static double rate(double a,double b,double c,int cnt,int ina){
    	double rate = 1,x,jd = 0.1,side = 0.1,i = 1;
    	do{
    		x = a/b - (Math.pow(1+rate, c)-1)/(Math.pow(rate+1, c)*rate);
    		if(x*side>0){side = -side;jd *=10;}
    		rate += side/jd;
    	}while(i++<cnt&&Math.abs(x)>=1/Math.pow(10, ina));
    	if(i>cnt)return Double.NaN;
    	return rate;
    }
    public static void main(String agrs[]) {  
        {  
        Double 现值 = -90000.00;  
        Double 年金 = -3155.00;  
        Double 期数 = 36d;  
           
        //计算200次，比Excel20次要精确，误差精确到小数点后10位  
        System.out.println(rate(现值,年金,期数,22220,10));  
        }  
    }  
	/*
	public static void main(String[] args) {
		System.out.println(calcMonthPayment(3000,12,4000,0.15));
	}*/
	
}
