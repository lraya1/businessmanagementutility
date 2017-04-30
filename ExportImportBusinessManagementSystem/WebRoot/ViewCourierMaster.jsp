<%@page import="com.iebms.dao.CourierMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.CourierMasterForm"%>
<%@page import="com.iebms.dao.CountryMasterDao"%>
<%@page import="com.iebms.dao.CityMasterDao"%>
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

<title>ExportImportBusinessManagementSystem</title>
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
   <td bgcolor="skyblue"><jsp:include page="./Header.jsp" />
   </td></tr>
<tr><td>
<%--<div align="center">--%>
<%--<table bgcolor="white" width="750" align="center">--%>
<%--<tr>--%>
<%--   <td><jsp:include page="Template.html"/></td></tr></table></div>--%>
<div align="center">
<table bgcolor="white" width="770" align="center" height="70">
<tr>
   <td>
   
   
     <p>&nbsp;</p>
     <p>&nbsp;</p><font color="black"><b>  Export to :</b> <a href="ExportXLS" target="_blank"><font color="black"><b>XLS</b></a>
   
     <p>&nbsp;</p>
     <p align="center">
   <center>
    
    <font color="black"><b><%if(request.getParameter("status")!=null){ %>
<%=request.getParameter("status") %><%} %>
<h2><font color="black">View Courier Details</font></h2>
<%

try
{
String report="";
CoreList cl=(CoreList)request.getAttribute("ViewCourierRequests");
Enumeration en=cl.elements();
%>
<table align="center" border=1>
<tr bgcolor="white">

<td><b><font color="black">CourierDate</font></b></td>    
       
<td><font color="black"><b>FromCountry</b></font></td>  
<td><font color="black"><b>ToCoiuntry</b></font></td>    
<td><font color="black"><b>FromCity</b></font></td>     
<td><font color="black"><b>ToCity</b></font></td>       
<td><font color="black"><b>CourierAmt</b></font></td>     
<td><font color="black"><b>CourierDetails</b></font></td>
<td><font color="black"><b>Status</b></font></td>

</tr>
<%
report+="<table align=center border=1><tr bgcolor=#666666><td><div align=center><font color=white><b>CourierDate</b></font></div></td>           <td><div align=center><font color=white><b>FromCountry</b></font></div></td>  <td><div align=center><font color=white><b>ToCoiuntry</b></font></div></td>    <td><div align=center><font color=white><b>FromCity</b></font></div></td>     <td><div align=center><font color=white><b>ToCity</b></font></div></td>       <td><div align=center><font color=white><b>CourierAmt</b></font></div></td>     <td><div align=center><font color=white><b>CourierDetails</b></font></div></td><td><div align=center><font color=white><b>Status</b></font></div></td></tr>";
while(en.hasMoreElements())
{
CourierMasterForm form=(CourierMasterForm)en.nextElement();
String fromcountryname=new CountryMasterDao().getCountryName(form.getFromCountryId());
String tocountryname=new CountryMasterDao().getCountryName(form.getToCountryId());
String fromcityname=new CityMasterDao().getCityName(form.getFromCityId());
String tocityname=new CityMasterDao().getCityName(form.getToCityId());
report+="</table>";
             session.setAttribute("Report",report); %>
 <tr bgcolor="skyblue">
 
 <td><b><%=form.getCourierDate() %></b></td>
 
 <td align="center"><b><%=fromcountryname %></b></td>
 <td align="center"><b><%=tocountryname %></b></td>
 <td align="center"><b><%=fromcityname %></b></td>
 <td align="center"><b><%=tocityname %></b></td>
 <td align="center"><b><%=form.getCourierAmt() %></b></td>
 <td align="center"><b><%=form.getCourierDet() %></b></td>
 <td align="center"><b><%=form.getStatus() %></b></td>
  
 </tr>
 <%}report+="</table>";
             session.setAttribute("Report",report);}catch(Exception e)
 {
 e.printStackTrace();
 }
  %>
  </table>     
  </b></font>
    
    
    
     
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