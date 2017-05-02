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
   
   <font color="skyblue"><h1><br></h1>
  
   <p align="center">
   <center>
    
    <font color="black"><b>
    
  <%if(request.getParameter("status").equalsIgnoreCase("InActive"))
  {
  %>
  <H2>This Card is Already Used</H2>
  <%
  }else{
  %><h2><center><font color="black">Credit Card No</font></center></h2>
    <form action="Paybill.jsp" method="post">
    <table>
    <tr><td><font color="black"><b>Card Number</b></font></td><td><input type="text" name="Creditcardno"/></td></tr>
 <%    int cardid=Integer.parseInt(request.getParameter("cardid"));
 int operatorid=Integer.parseInt(request.getParameter("operatorid"));
 int amount=Integer.parseInt(request.getParameter("amount"));
 %>
 <input type="hidden" name="cardid" value="<%=cardid %>"/>
 <input type="hidden" name="operatorid" value="<%=operatorid %>"/>
 <input type="hidden" name="amount" value="<%=amount %>"/>
 <tr><td> </td><td><input type="submit" name="send" value="pay"/></td></tr>
  </table>  </form>
    
    <%} %>
    
    
     
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