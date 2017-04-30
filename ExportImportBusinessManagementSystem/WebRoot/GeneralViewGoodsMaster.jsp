<%@page import="com.iebms.dao.GoodsMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.GoodsMasterForm"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html>
<head>
<style>
body,td,th {
	color: white;
	;
}
.style9 {    color: black}
body {
	background-color: white;
}
.style13 {color: white; font-weight: bold; }
.style14 {color: #666666; font-weight: bold; }
</style>

<title>ImportExportBusinessManagementSystem</title>
<script type="text/javascript" src="scripts/moveclock.js"></script>

<script type="text/javascript">
function validate()
{
var form =document.register
if(form.userName.value=="")
{
alert("User Name is Required");
return false;
}
else if(form.password.value=="")
{
alert("Pass Word is Required");
return false;
}  
return true;
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>
<body>
<table width="750" align="center" bgcolor="white">
<tr><td>
<img src="images/goods.jpg" width="780" height="230"></td>
</tr>
<tr>
   <td bgcolor="skyblue"><jsp:include page="generalOptions.jsp"/></td></tr>
<tr><td>
<%--<div align="center">--%>
<%--<table bgcolor="white" width="750" align="center">--%>
<%--<tr>--%>
<%--   <td><jsp:include page="Template.html"/></td></tr></table></div>--%>
<div align="center">
<table bgcolor="white" width="770" align="center" height="70">
<tr>
   <td bgcolor="white">
   <font color="skyblue"><h4></h4>
  
   <p align="center">
     <table  align="center" bgcolor="#999999"><tr><td bgcolor="white">
     <span class="style9"><b>View Goods Details </b></span>
    
    
    
    
     <table bgcolor="#999999"> <tr><td bgcolor="white">
    
    
     <%if(request.getParameter("status")!=null){ %>
	<%=request.getParameter("status") %><%} %>
	
	<%
	try
	{
	
	CoreList cl=(CoreList)request.getAttribute("ViewGoods");
	Enumeration en=cl.elements();
	%>
	<table align="center" border=1>
	<tr bgcolor="skyblue">
	<td><div align="center" class="style13">GoodsName</div></td>
	<td><div align="center" class="style13">GoodsDesc</div></td>
	</tr>
	<%
	while(en.hasMoreElements())
	{
	GoodsMasterForm form=(GoodsMasterForm)en.nextElement();
	 %>
<tr bgcolor="white">
<td><div align="center" class="style14 style9"><strong><font color="black"><%=form.getGoodsName()%></font></strong></div></td>
<td><div align="center" class="style14 style9"><font color="black"><strong><%=form.getGoodsDesc() %></strong></font></div></td></tr>
<%} }catch(Exception e)
{
e.printStackTrace();
}
%>
</table>

     
     
     
     </td></tr></table>
     
     
     
     </td></tr></table>
          <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
                              
     <p>&nbsp;</p></td></tr></table></div>


</body></html> 