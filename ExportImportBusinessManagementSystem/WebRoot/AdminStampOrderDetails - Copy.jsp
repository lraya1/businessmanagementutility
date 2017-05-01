
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.Orders"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
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
   <td bgcolor="skyblue"><jsp:include page="Adminoptions.jsp"/>
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
    <h3><font color="black">VIEW ORDER DETAILS</font></h3>
    <font color="black"><b>
     <font color="black"><b>  Export to :</b> <a href="ExportXLS" target="_blank"><font color="black"><b>XLS</b></a>
    <table>
    <tr bgcolor="white">
    <td><strong><font color="black">Orderid</font></strong></td>
    <td><strong><font color="black">Order Date</font></strong></td>
    <td><strong><font color="black">Order Amount</font></strong></td>
    <td><strong><font color="black">Order Status</font></strong></td>
    </tr>
    <%
    String report="";
    report+="<table>    <tr bgcolor=#509C16>    <td><strong><font color=white>Orderid</font></strong></td>    <td><strong><font color=white>Order Date</font></strong></td>    <td><strong><font color=white>Order Amount</font></strong></td>    <td><strong><font color=white>Order Status</font></strong></td>    </tr>";
        CoreList acorelist=(CoreList)request.getAttribute("ViewOrderstaus");Enumeration aenumeration =acorelist.elements();
while(aenumeration.hasMoreElements())
{
Orders aOrders=(Orders)aenumeration.nextElement();
int orderid=aOrders.getOrderID();
String orderdate=aOrders.getOrderDate();
double orderamount=aOrders.getPrice();
String status=aOrders.getStatus();
int userid=aOrders.getUserid();
report+="<tr bgcolor=#C3D7BA><td><strong><font color=white>"+orderid +"</font></strong></td>     <td><strong><font color=white>"+orderdate +"</font></strong></td>     <td><strong><font color=white>"+orderamount +"</font></strong></td>     <td><strong><font color=white>"+status +"</font></strong></td>     <td><strong><font color=white><a href=OrderShipmentMaster.jsp?orderid="+orderid +"&userid="+userid +"&status1="+status +"><u>Order Shipment</u></a></font></strong></td>     </tr>";

     %>
     <tr bgcolor="#C3D7BA"><td><strong><font color="black"><a href="ViewOrderDetails.jsp?orderid=<%=orderid %>"><%=orderid %></a></font></strong></td>
     <td><strong><font color="black"><%=orderdate %></font></strong></td>
     <td><strong><font color="black"><%=orderamount %></font></strong></td>
     <td><strong><font color="black"><%=status %></font></strong></td>
            <%if(!status.equalsIgnoreCase("Delivered")){ %>
     <td><strong><font color="black"><a href="OrderShipmentMaster.jsp?orderid=<%=orderid %>&userid=<%=userid %>&status1=<%=status %>"><u>Order Shipment</u></a></font></strong></td>
     </tr>
<%}}report+="</table>";
             session.setAttribute("Report",report); %>
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