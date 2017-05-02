
<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="com.iebms.dao.ProfileDAO"%>
<%@page import="com.iebms.model.Profile"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
 
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
</style>

<title>ImportExportBusinessManagementSystem</title>
<script type="text/javascript" src="scripts/moveclock.js"></script>
<script language="JavaScript" src="scripts/gen_validatorv31.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script>
<script language="JavaScript1.1" src="scripts/pass.js">


</script> <script type="text/javascript" src="scripts/image.js"> </script>
 <script type="text/javascript" src="scripts/general.js"> </script>
 <script type="text/javascript" src="scripts/adi.js"> </script>
 <script type="text/javascript" src="scripts/form_validation.js"> </script>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>
<body>
<table width="750" align="center" bgcolor="white">
<tr><td>
<img src="images/goods.jpg" width="780" height="230"></td>
</tr>
<tr>
   <td bgcolor="skyblue"><jsp:include page="./Header.jsp" /></td></tr>
<tr><td>
<%--<div align="center">--%>
<%--<table bgcolor="white" width="750" align="center">--%>
<%--<tr>--%>
<%--   <td><jsp:include page="Template.html"/></td></tr></table></div>--%>
<div align="center">
<table bgcolor="white" width="770" align="center" height="70">
<tr>
   <td>
   <font color="skyblue"><h1><br></h1>
  
   <p align="center">
    
    <%if(request.getParameter("status")!=null){ %>
	<%=request.getParameter("status") %><%} %>
	<%if(request.getParameter("status1").equalsIgnoreCase("Pending"))
	{%>
		<form action="orderShipmentAction.do" method="post" name="register">
		<table align="center" bgcolor="white">
			<tr><td></td><td><input type="hidden" name="userId" value="<%=request.getParameter("userid") %>"/>
			</td></tr>
		 
			<tr><td><font color="black"><b>ShipmentInchargeEmployee :</b></font> 
			</td><td><select name="shipmentInchargeEmpId"> 
			<option>--Select Any One--</option>
			<%
			String storepath=request.getRealPath("/images");
			EmployeMasterDao dao=new EmployeMasterDao();
			CoreList cl=dao.ViewEmployeMaster(storepath);
			Enumeration en=cl.elements();
			while(en.hasMoreElements())
			{EmployeMasterForm form=(EmployeMasterForm)en.nextElement(); 
			 %>
			  <option value="<%=form.getEmployeId() %>"><%=form.getUsername() %></option>
			 <%} %></select></td></tr>
			<tr><td> </td><td><input type="hidden" name="orderId" value="<%=request.getParameter("orderid") %>"/>
			
			<tr><td><font color="black"><b>ShipmentDate :</b></font> </td><td><input type=text name="shipmentDate"/> <a href="javascript:show_calendar('document.register.shipmentDate', document.register.shipmentDate.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a></td></tr>
			<tr><td> </td><td><input type="hidden" name="shipmentStatus" value="pending"/></td></tr>
			<tr><td>.</td><td><input type=submit name="Register" value="Register"/></td></tr></table>
		</form>
    <%}else{ %>
    <center><font color="black"><b>ORDER IS ALRADY ASSIGNED</b></font></center><%}%>
    
    
    
   <center>
     
     </center>
    
     
     
     </td></tr></table>
          <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
           <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
           <p>&nbsp;</p>
             
                         
                              
     <p>&nbsp;</p></div>


</body></html>