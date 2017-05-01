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

<title>e-PostOfiice</title>
<script type="text/javascript" src="scripts/moveclock.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>
<body>
<table width="750" align="center" bgcolor="white">
<tr><td>
<img src="images/goods.jpg" width="780" height="230"></td>
</tr>
<tr>
   <td bgcolor="skyblue">
   <jsp:include page="Adminoptions.jsp"/>
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
   
   <font color="skyblue"><h1><br></h1>
  
   <p align="center">
   <center>
   <font color="black"><b>  Export to :</b> <a href="ExportXLS" target="_blank"><font color="black"><b>XLS</b></a>
    <font color="black"><b><%if(request.getParameter("status")!=null){ %>
<%=request.getParameter("status") %><%} %>
<%

try
{
String report="";
CoreList cl=(CoreList)request.getAttribute("ViewCourierRequests");
Enumeration en=cl.elements();
%>
  <cente><h2><font color="black"> View Courier Details</font></h2></center>
<table align="center" border=1>
<tr bgcolor="white">
<td><div align="center"><font color="black"><b>CourierDate</b></font></div></td>    
       
<td><div align="center"><font color="black"><b>FromCountry</b></font></div></td>  
<td><div align="center"><font color="black"><b>ToCoiuntry</b></font></div></td>    
<td><div align="center"><font color="black"><b>FromCity</b></font></div></td>     
<td><div align="center"><font color="black"><b>ToCity</b></font></div></td>       
<td><div align="center"><font color="black"><b>CourierAmt</b></font></div></td>     
<td><div align="center"><font color="black"><b>CourierDetails</b></font></div></td>
<td><div align="center"><font color="black"><b>Status</b></font></div></td>
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
 report+="<tr bgcolor=#FFFFFF> <td><font color=#B00606>   <div align=center><b>"+form.getCourierDate() +"</b></div></td>  <td align=center><div align=center><font color=#B00606><b>"+fromcountryname +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+tocountryname +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+fromcityname +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+tocityname +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+form.getCourierAmt() +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+form.getCourierDet() +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+form.getStatus() +"</b></font></div></td> <td align=center><div align=center><a href=CourierShipmentMaster.jsp?courierid="+form.getCourierId()+"<font color=#B00606><b>Accept</b></font></a></div></td> </tr>";
  %> <tr bgcolor="skyblue"> <td><font color="black">   <div align="center"><b><%=form.getCourierDate() %></b></div></td>  <td align="center"><div align="center"><font color="black"><b><%=fromcountryname %></b></font></div></td>
   <td align="center"><div align="center"><font color="black"><b><%=tocountryname %></b></font></div></td>
    <td align="center"><div align="center"><font color="black"><b><%=fromcityname %></b></font></div></td>
     <td align="center"><div align="center"><font color="black"><b><%=tocityname %></b></font></div></td>
      <td align="center"><div align="center"><font color="black"><b><%=form.getCourierAmt() %></b></font></div></td>
       <td align="center"><div align="center"><font color="black"><b><%=form.getCourierDet() %></b></font></div></td> 
       <td align="center"><div align="center"><font color="black"><b><%=form.getStatus() %></b></font></div></td> 
       <%if(!form.getStatus().equalsIgnoreCase("Deliverd")){ %>
       <td align="center"><div align="center"><a href="CourierShipmentMaster.jsp?courierid=<%=form.getCourierId() %>"><font color="black"><b>Accept</b></font></a></div></td> </tr>
 <%}}report+="</table>";
             session.setAttribute("Report",report);}catch(Exception e)
 {
 e.printStackTrace();
 }
 
  %>
  </table>     
     
     
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