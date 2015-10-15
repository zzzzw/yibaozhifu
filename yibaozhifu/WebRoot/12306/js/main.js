

//使用传统js完成

 // 使用js计算总票价 
window.onload=function(){
	
	    var c = 0;
		var obj = document.getElementsByName("a");
		for (i = 0; i < obj.length; i++) {
			// obj[i].id;
			c += eval(obj[i].value);  //eval函数计算值
		}
	  document.getElementById("zpj").innerText=c;

	
	
	
}

function zf()
{
  var c= document.getElementById("zpj").innerText;
  
  //使用get方式往后台传
  var href="dd!zf.action?zonge="+c;
   location.href=href;
   
}

//使用jquery完成

   

//判断是否勾选乘客，再决定是否提交



//付款成功提示
function tk()
{
 alert("付款成功,请尽快去领取车票");
  location.href="12306/p1.jsp";
 
}
