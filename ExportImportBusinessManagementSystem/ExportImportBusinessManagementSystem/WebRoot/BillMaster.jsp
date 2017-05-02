<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="com.iebms.dao.ProfileDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="com.iebms.model.Profile"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">

<html>
<head><script language="JavaScript" src="scripts/gen_validatorv31.js" type="text/javascript"></script>
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
   <font color="skyblue"><h1></h1>
  
   <p align="center">
   <center>
    
    <font color="black"><b>
    <%if(request.getParameter("status")!=null){ %>
	<%=request.getParameter("status") %><%} %>
	<body>
	<font color="black" size="5"> Billing Details </font>
		<form action="BillAction.do" method="post" name="register">
		 <%int userid=((Integer)session.getAttribute("user")).intValue(); %>
     
		<table align="center" bgcolor="white"><!--
			<tr><td><font color="black"><b>ServiceNo :</b></font> </td><td></td></tr> 
			--><!--<tr><td><font color="black"><b>No Of Units :</b></font> </td>
			<td><input type=text name="noOfUnits"/> </td></tr>
			--><input type='hidden' name="serviceNo" value='0'/><tr><td><font color="black"><b>Items :</b></font> </td>
			<td><input type=text name="billNo"/></td></tr>
			<tr><td><font color="black"><b>BillDate :</b></font> </td><td><input type=text name="billDate"/><a href="javascript:show_calendar('document.register.billDate', document.register.billDate.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a></td></tr>
			<tr><td><font color="black"><b>Amount : </b></font></td><td><input type=text name="amount"/> $</td></tr>
			<tr><td><input type="hidden" name="userId" value="<%=userid%>"/></td></tr>
			 
			<tr><td><input type="hidden" name="employeId" value="2"/> </td></tr>
				 <tr><td><font color="black"><b>Credit Card Number :</b></font> </td><td><input type=text name="creditcardno"/> </td></tr>
			<tr><td></td><td><input type=submit name="Register" value="Register"/> </td></tr></table>
		</form>
		<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("register");
  
 
  frmvalidator.addValidation("serviceNo","req","Please enter Service No");
   frmvalidator.addValidation("serviceNo","age");
  
  frmvalidator.addValidation("serviceNo","req","Please enter BillNo");
   frmvalidator.addValidation("serviceNo","age");
  
   frmvalidator.addValidation("noOfUnits","req","Please enter No of Units");
   frmvalidator.addValidation("noOfUnits","age");
   
   frmvalidator.addValidation("amount","req","Please enter a Amount" );
   frmvalidator.addValidation("amount","age");
    frmvalidator.addValidation("creditcardno","req","Please enter a creditcardno");
   frmvalidator.addValidation("creditcardno","age");
   
   
 //  frmvalidator.addValidation("firstName","maxlen=20",	"Max length for FirstName is 20");
  // frmvalidator.addValidation("firstName","alpha"," First Name Alphabetic chars only");
  
  
    
 </script>
  
		</b>
		</font>
    
    
    
     
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