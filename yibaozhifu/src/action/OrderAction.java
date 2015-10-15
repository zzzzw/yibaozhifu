package action;


import java.util.Properties;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;
import common.PaymentUtil;

@SuppressWarnings("serial")    
@Results( { 

})

public class OrderAction extends ActionSupport  {
    //用易宝支付订单
	public String ybpayment() throws Exception {

	    //用易宝实现支付
	    Properties props = new Properties();
	props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		
		String p0_Cmd = "Buy";//业务类型，固定值Buy
		String p1_MerId ="10001126856";//商号编码，在易宝的唯一标识
		String p2_Order ="3454352355";//订单号，这个是你每次都要修改的参数
		String p3_Amt = "0.01";//支付金额
		String p4_Cur = "CNY";//交易币种，固定值CNY
		String p5_Pid = "";//商品名称
		String p6_Pcat = "";//商品种类
		String p7_Pdesc = "";//商品描述
		String p8_Url = "http://localhost:8080/yibaozhifu/index.jsp";//在支付成功后，易宝会访问这个地址。
		String p9_SAF = "";//送货地址
		String pa_MP = "";//扩展信息
		String pd_FrpId =ServletActionContext.getRequest().getParameter("pd_FrpId");//支付通道
		String pr_NeedResponse = "1";//应答机制，固定值1
		
		//
		 // 2. 计算hmac
		 // 需要13个参数
		 // 需要keyValue
		 //需要加密算法
		 //
		String keyValue = props.getProperty("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);
		
		//
		 // 3. 重定向到易宝的支付网关
		 //
		StringBuilder sb = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
		sb.append("?").append("p0_Cmd=").append(p0_Cmd);
		sb.append("&").append("p1_MerId=").append(p1_MerId);
		sb.append("&").append("p2_Order=").append(p2_Order);
		sb.append("&").append("p3_Amt=").append(p3_Amt);
		sb.append("&").append("p4_Cur=").append(p4_Cur);
		sb.append("&").append("p5_Pid=").append(p5_Pid);
		sb.append("&").append("p6_Pcat=").append(p6_Pcat);
		sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
		sb.append("&").append("p8_Url=").append(p8_Url);
		sb.append("&").append("p9_SAF=").append(p9_SAF);
		sb.append("&").append("pa_MP=").append(pa_MP);
		sb.append("&").append("pd_FrpId=").append(pd_FrpId);
		sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
		sb.append("&").append("hmac=").append(hmac);
		
		ServletActionContext.getResponse().sendRedirect(sb.toString());
		
	    return null;
	}
   



   

}
