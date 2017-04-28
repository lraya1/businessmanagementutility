
<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="com.iebms.dao.ProfileDAO"%>
<%@page import="com.iebms.model.Profile"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%@page import="com.iebms.dao.StampOrderMasterDao"%>
<%@page import="com.yourcompany.struts.form.StampOrderMasterForm"%>
 
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

<title>e-PostOfiice</title>
<script type="text/javascript" src="scripts/moveclock.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>
<body>
<table width="750" align="center" bgcolor="white">
<tr><td>
<img src="images/goods.jpg" width="780" height="230"></td>
</tr>
<tr>
   <td bgcolor="skyblue"><jsp:include page="Adminoptions.jsp"/></td></tr>
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
	
		<form action="updateCourierShipment.do">
		<table align="center">
			<tr><td></td><td><input type="hidden" name="courierId" value="<%=request.getParameter("courierid") %>"/>
			</td></tr>
		 
			<tr><td><font color="black"><b>ShipmentInchargeEmployee :</b></font> </td>
			<td><select name="employeId"/> 
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
			
				<tr><td>.</td><td><input type=submit name="Register" value="Register"/></td></tr></table>
		</form>
    
    
    
    
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