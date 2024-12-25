/**
 * 获取地址栏参数 
 */
function GetUrlParam(paraName) {
	var url = document.location.toString();
	var arrObj = url.split("?");
	
	if (arrObj.length > 1) {
		var arrPara = arrObj[1].split("&");
		var arr;
		for (var i = 0; i < arrPara.length; i++) {
			arr = arrPara[i].split("=");
			if (arr != null && arr[0] == paraName) {
				return arr[1];
			}
		}
		
		return "";
	}
	else {
		return "";
	}
}


/**
 * 设置cookie
 * @param c_name			属性名
 * @param value				值
 * @param expiredays		过期时间（单位：分钟）
 * @returns
 */
function setCookie(c_name,value,expiredays)
{
	var exdate=new Date()
	exdate.setDate(exdate.getDate()+expiredays)
	document.cookie=c_name+ "=" +escape(value)+
	((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
}


/**
 * 取回cookie
 * @param c_name
 * @returns
 */
function getCookie(c_name)
{
	if (document.cookie.length>0)
	  {
	  c_start=document.cookie.indexOf(c_name + "=")
	  if (c_start!=-1)
	    { 
	    c_start=c_start + c_name.length+1 
	    c_end=document.cookie.indexOf(";",c_start)
	    if (c_end==-1) c_end=document.cookie.length
	    return unescape(document.cookie.substring(c_start,c_end))
	    } 
	  }
	return ""
}