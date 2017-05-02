<%@page import="com.iebms.dao.BillMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.BillMasterForm"%>


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
.style1 {
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
   <td bgcolor="skyblue">
   <jsp:include page="./Header.jsp" />
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
   
   <font color="skyblue"><h1></h1>
  
   <p align="center">
   
    <p>&nbsp;</p><font color="black"><b>  Export to :</b> <a href="ExportXLS" target="_blank"><font color="black"><b>XLS</b></a>
     <div align="center"><font color="black"><b>
       <%if(request.getParameter("status")!=null){ %>
              <%=request.getParameter("status") %>
       <%} %>
             <%
try
{
String report="";
report+=" <table align=center border=1>           <tr bgcolor=#509C16>    <td><div align=center><font color=white><b>BillDate</b></font></div></td>                    <td><div align=center><font color=white><b>BillNo</b></font></div></td>             <td><div align=center><font color=white><b>ServiceNo</b></font></div></td>          <td><div align=center><font color=white><b>NoOfUnits</b></font></div></td>          <td><div align=center><font color=white><b>Amount</b></font></div></td>             </tr>";
//BillMasterDao dao=new BillMasterDao();
CoreList cl=(CoreList)request.getAttribute("viewBills");
Enumeration en=cl.elements();
%>
       </b></font>
       <h2><font color="black">View  Bills</font></h2>
         <table align="center" border=1>
           <tr bgcolor="white">
    <td><div align="center"><font color="black"><b>BillDate</b></font></div></td>       
             
<td><div align="center"><font color="black"><b>Items</b></font></div></td><!--         
    <td><div align="center"><font color="black"><b>ServiceNo</b></font></div></td>      
    <td><div align="center"><font color="black"><b>NoOfUnits</b></font></div></td>      
    --><td><div align="center"><font color="black"><b>Amount</b></font></div></td>         
    </tr>
           <%while(en.hasMoreElements()) 
{
BillMasterForm form=(BillMasterForm)en.nextElement();
report+=" <tr bgcolor=#C3D7BA>    <td><span class=style1>"+form.getBillDate() +"</span></td>    <td align=center><span class=style1>"+form.getBillNo() +"</span></td>    <td align=center><span class=style1>"+form.getServiceNo() +"</span></td>    <td align=center><span class=style1>"+form.getNoOfUnits() +"</span></td>    <td align=center><span class=style1>"+form.getAmount() +"</span></td>    </tr>";
%>
           <tr bgcolor="#C3D7BA">
    <td><span class="style1"><%=form.getBillDate() %></span></td>
    <td align=center><span class="style1"><%=form.getBillNo() %></span></td><!--
    <td align=center><span class="style1"><%=form.getServiceNo() %></span></td>
    <td align=center><span class="style1"><%=form.getNoOfUnits() %></span></td>
    --><td align=center><span class="style1"><%=form.getAmount() %></span></td>
    </tr>
           <%} report+="</table>";
             session.setAttribute("Report",report);}catch(Exception e)
{
e.printStackTrace();
}
%>       
         </table>
     </div></td></tr></table>
          <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
           <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
           <p>&nbsp;</p>
             
                         
                              
     <p>&nbsp;</p></div>


</body></html>