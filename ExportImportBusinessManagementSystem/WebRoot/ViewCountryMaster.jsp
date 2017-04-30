<%@page import="com.iebms.dao.CountryMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.CountryMasterForm"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html>
<head>
<script language="JavaScript" src="scripts/gen_validatorv31.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script>
<script language="JavaScript1.1" src="scripts/pass.js">


</script> <script type="text/javascript" src="scripts/image.js"> </script>
 <script type="text/javascript" src="scripts/general.js"> </script>
 <script type="text/javascript" src="scripts/adi.js"> </script>
 <script type="text/javascript" src="scripts/form_validation.js"> </script>

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
.style2 {
	    color: black;
	font-weight: bold;
}
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
    
    
    
    
    
   <center>
     <%if(request.getParameter("status")!=null){ %>
	<%=request.getParameter("status") %><%} %>
	<h2><font color="black"><b>View Country Details</b></font></h2>
 <form action="DeleteCountryMaster.jsp">
 <%
 try
 {
 //String storepath=request.getRealPath("/images");
// CountryMasterDao dao=new CountryMasterDao();
 CoreList cl=(CoreList)request.getAttribute("viewcountrymaster");
 Enumeration en=cl.elements();
 %>
 <table align="center">
 <tr bgcolor="skyblue">
 <td colspan="2"><div align="center"><span class="style1"><font color="black">CountryName</font> </span></div></td>   
<td><div align="center"><span class="style1"><font color="black">Abbr</font></span></div></td><!--           
<td><div align="center"><span class="style1"><font color="black">CountryMap<font color="black"></span></div></td>     
--><td><div align="center"><span class="style1"><font color="black">CountryArea</font></span></div></td>    
<td><div align="center"><span class="style1"><font color="black">Desc</font></span></div></td>
 </tr>
<%while(en.hasMoreElements())
{
CountryMasterForm form=(CountryMasterForm)en.nextElement();
%>
 <tr bgcolor="white"><td><input name="TypeId" type=checkbox value="<%=form.getCountryId()%>"></td>
 <td align="center"><a href="UpdateCountryAction.jsp?Id=<%=form.getCountryId()%>" class="style2"><u><%=form.getCountryName()%></u></a></td>
 <td align="center"><span class="style2"><%=form.getAbbr() %></span></td><!--
 <td align="center"><img src="images/<%=form.getCountryMap() %>" width=100 height=50></td>
 --><td align="center"><span class="style2"><%=form.getCountryArea() %> SqFt</span></td>
 <td align="center"><span class="style2"><%=form.getDescription() %></span></td></tr>
<%}}catch(Exception e)
{
e.printStackTrace();
}
%>
 </table>
 <center><input type=submit name="Delete" value="Delete"></center>
 </form>
     
     
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