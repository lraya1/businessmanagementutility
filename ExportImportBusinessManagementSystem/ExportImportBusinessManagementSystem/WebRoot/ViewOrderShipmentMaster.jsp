<%@page import="com.iebms.dao.OrderShipmentMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.OrderShipmentMasterForm"%>
<%@page import="com.iebms.dao.ProfileDAO"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html>
<head>
<style>
body,td,th {
	color: white;
	;
}
body {
	background-color: white;
}
.style1 {color: #666666}
.style4 {    color: black; font-weight: bold; }
.style5 {
	color: white;
	font-weight: bold;
}
</style>

<title>ExportImportBusinessManagementSystem</title>
<script type="text/javascript" src="scripts/moveclock.js"></script>



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
   
   
     <p class="style1">&nbsp;</p>
     <p class="style1">&nbsp;</p>
     <p class="style1">&nbsp;</p><font color="black"><b>  Export to :</b> <a href="ExportXLS" target="_blank"><font color="black"><b>XLS</b></a>
  
     <p align="center" class="style1">
    <h3 class="style1">
      <form action="DeleteOrderShipmentMaster.jsp">
  
  <%if(request.getParameter("status")!=null){%>
  <%=request.getParameter("status")%>
  <%}%>
  <%
try
{
String report="";
report+=" <table align=center border=1>  <tr bgcolor=#666666>  <td><div align=center><span class=style4>ShipmentDate</span></div></td>            <td><div align=center><span class=style4>OrderId</span></div></td>                  <td><div align=center><span class=style4>Customer Name</span></div></td>                   <td><div align=center><span class=style4>ShipmentStatus</span></div></td>         </tr>";
//OrderShipmentMasterDao dao=new OrderShipmentMasterDao();
CoreList cl=(CoreList)request.getAttribute("ordershipmentmaster");
Enumeration en=cl.elements();
%>
  <center><h2><font color="black">View Shipment Details</font></h2></center>
  <table align="center" border=1>
  <tr bgcolor="white">  
  <td><div align="center"><span class="style4">ShipmentDate</span></div></td>          
  <td><div align="center"><span class="style4">OrderId</span></div></td>                
  <td><div align="center"><span class="style4">Customer Name</span></div></td>                 
  <td><div align="center"><span class="style4">ShipmentStatus</span></div></td>  </tr>       
  
<% while(en.hasMoreElements())
{
OrderShipmentMasterForm form=(OrderShipmentMasterForm)en.nextElement();
String username=new ProfileDAO().getusername(form.getUserId());
 report+=" <tr bgcolor=#FFFFFF>   <td><a href=UpdateOrderShipmentMaster.jsp?Id="+form.getShipmentId() +" class=style5>"+form.getShipmentDate() +"</a></td>   <td><span class=style5>"+form.getOrderId() +"</span></td>   <td><span class=style5>"+username +"</span></td>   <td><span class=style5>"+form.getShipmentStatus() +"</span></td>   <td><a href=ChangeStatus.jsp?shipmentid="+form.getShipmentId() +"&orderid="+form.getOrderId() +" class=style5>Change Status</a></td>   </tr>";
 %>
    <tr bgcolor="skyblue">
   <td><class="style5"><%=form.getShipmentDate() %></td>
   <td><span class="style5"><a href="EmployeeViewOrderDetails.jsp?orderid=<%=form.getOrderId() %>"><%=form.getOrderId() %></a></span></td>
   <td><span class="style5"><%=username %></span></td>
   <td><span class="style5"><%=form.getShipmentStatus() %></span></td>
          <%if(!form.getShipmentStatus().equalsIgnoreCase("Deliverd")){ %>
   <td><a href="ChangeStatus.jsp?shipmentid=<%=form.getShipmentId() %>&orderid=<%=form.getOrderId() %>" class="style5">Change Status</a></td>
   <%} %>
   </tr>
    <%}report+="</table>";
             session.setAttribute("Report",report);}catch(Exception e)
 {
 e.printStackTrace();
 }
 %>  
    </table>
      </form>
    </h3>
    
    
   <center class="style1">
     </center>     </td></tr>
</table>
          <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
           <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
           <p>&nbsp;</p>
             
                         
                              
     <p>&nbsp;</p></div>


</body></html>