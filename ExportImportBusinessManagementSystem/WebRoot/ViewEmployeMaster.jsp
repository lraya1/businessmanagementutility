<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
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
  
   <p align="center" class="style3">
   
    
     <p align="center">
    <form action="deleteEmployeeAction.do">
<%if(request.getParameter("status")!=null){ %>
<%=request.getParameter("status") %><%} %>
<center><h2><font color="black">View Employee Details</font></h2></center>
 <%
 
 String storepath=request.getRealPath("/images");
 try
 {
 EmployeMasterDao dao=new EmployeMasterDao();
 CoreList cl=(CoreList)request.getAttribute("viewEmployees");
 Enumeration en=cl.elements();
 %>
 <table align="center" border=1>
 <tr bgcolor="white">
 <td colspan=2><font color="black"><strong>EmpFirstName</strong></font></td>       
<td><font color="black"><strong>DtOfBirth</strong></font></td>            
<td><font color="black"><strong>DtOfJoin</strong></font></td>             
<td><font color="black"><strong>Address</strong></font></td>                
<td><font color="black"><strong>Phone</strong></font></td>                  
<td><font color="black"><strong>Email</strong></font></td>                 
<td><font color="black"><strong>Image</strong></font></td>                  
</tr>
<%while(en.hasMoreElements())
{
EmployeMasterForm form=(EmployeMasterForm)en.nextElement();
%>
<tr bgcolor="skyblue"><td><input type=checkbox name="TypeId" value="<%=form.getEmployeId()%>"></td>
<td><strong><%=form.getEmployeFirstName() %></strong></td>
<td><strong><%=form.getDateOfBirth()%></strong></td>
<td><strong><%=form.getDateOfJoin()%></strong></td>
<td><strong><%=form.getAddress()%></strong></td>
<td><strong><%=form.getPhone()%></strong></td>
<td><strong><%=form.getEmail()%></strong></td>
<td><img src="images/<%=form.getImage()%>" height=50 width=100></td>
</tr>
<%}} catch(Exception e)
{
e.printStackTrace();
}
%>  
</table>
<center><input type=submit name="Delete" value="Delete"></center>
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