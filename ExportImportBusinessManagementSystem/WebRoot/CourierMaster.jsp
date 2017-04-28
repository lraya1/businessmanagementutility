<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="com.iebms.dao.ProfileDAO"%>
<%@page import="com.iebms.model.Profile"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%@page import="com.iebms.dao.CityMasterDao"%>
<%@page import="com.yourcompany.struts.form.CityMasterForm"%>
<%@page import="com.iebms.dao.CountryMasterDao"%>
<%@page import="com.yourcompany.struts.form.CountryMasterForm"%>
 
 
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
<script type="text/javascript" src="scripts/moveclock.js"></script>

<script language="JavaScript" src="scripts/gen_validatorv31.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script>
<script language="JavaScript1.1" src="scripts/pass.js">


</script> <script type="text/javascript" src="scripts/image.js"> </script>
 <script type="text/javascript" src="scripts/general.js"> </script>
 <script type="text/javascript" src="scripts/adi.js"> </script>
 <script type="text/javascript" src="scripts/form_validation.js"> </script>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>
<body>
<table width="750" align="center" bgcolor="white">
<tr><td>
<img src="images/goods.jpg" width="780" height="230"></td>
</tr>
<tr>
   <td bgcolor="skyblue"><jsp:include page="UserOptions.jsp"/>
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
    </b></font>
    <h2><font color="black">Courier Request Form</font></h2>
    <%if(request.getParameter("status")!=null){ %>
	<%=request.getParameter("status") %><%} %>
		<form action="courierMasterAction.do" name="register"><table align="center" bgcolor="white">
		<tr><td><font color="black"><b>FromCountry :</b></font> </td>
		<td><select name="fromCountryId"> 
			<option vale="">--Select Any One--</option>
			<%
			String storepath=request.getRealPath("/images");
			CountryMasterDao dao5=new CountryMasterDao();
			CoreList cl5=dao5.ViewCountryMaster(storepath);
			Enumeration en5=cl5.elements();
			while(en5.hasMoreElements())
			{
			CountryMasterForm form5=(CountryMasterForm)en5.nextElement();
			%>
			<option value="<%=form5.getCountryId() %>"><%=form5.getCountryName() %></option>
			<%} %></select></td></tr>
			
			<tr><td><font color="black"><b>FromCity :</b></font> </td>
			<td><select name="fromCityId"> <option value="">--Select Any One--</option> 
			<%
			CityMasterDao dao2=new CityMasterDao();
			CoreList cl2=dao2.ViewCityMaster(storepath);
			Enumeration en2=cl2.elements();
			while(en2.hasMoreElements())
			{
			CityMasterForm form1=(CityMasterForm)en2.nextElement();
			%>
			<option value="<%=form1.getCityId() %>"><%=form1.getCityName() %></option>ion>
			<%}%></select></td></tr>
			
				<tr><td><font color="black"><b>To Country :</b></font> </td>
					<td><select name="toCountryId"> <option vale="">--Select Any One--</option>
			<%CountryMasterDao dao6=new CountryMasterDao();
			CoreList cl6=dao6.ViewCountryMaster(storepath);
			Enumeration en6=cl6.elements();
			while(en6.hasMoreElements())
			{
			CountryMasterForm form6=(CountryMasterForm)en6.nextElement();
			%>
			<option value="<%=form6.getCountryId() %>"><%=form6.getCountryName() %></option>
			<%} %></select></td></tr>
			<%int userid=((Integer)session.getAttribute("user")).intValue();
      %><tr><td><font color="black"><b>ToCity : </b></font></td><td>
      <select name="toCityId"> <option vale="">--Select Any One--</option>
			<%CityMasterDao dao4=new CityMasterDao();
			CoreList cl4=dao4.ViewCityMaster(storepath);
			Enumeration en4=cl4.elements();
			while(en4.hasMoreElements())
			{
			CityMasterForm form3=(CityMasterForm)en4.nextElement();
			%>
			<option value="<%=form3.getCityId() %>"><%=form3.getCityName() %></option>
			<%} %></select></td></tr>>
			<tr><td><font color="black"><b>Courier Amt :</b></font> </td><td><input type=text name="courierAmt"/> </td></tr>
			<tr><td><font color="black"><b>Courier Details :</b></font> </td><td><input type=text name="courierDet"/> </td></tr>
			
		<input type="hidden"  name="userId" value="<%=userid %>"/>
						<tr><td><font color="black"><b>CourierDate : &nbsp;&nbsp;&nbsp;</b></font> </td><td><input type=text name="courierDate" readonly/><a href="javascript:show_calendar('document.register.courierDate', document.register.courierDate.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a> </td></tr>
			<tr><td></td><td><input type=submit name="Register" value="Register"/> </td></tr></table>
		</form>
    <script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("register");
  
 
   frmvalidator.addValidation("fromCountryId","dontselect=0");
    frmvalidator.addValidation("fromCityId","dontselect=0");
    frmvalidator.addValidation("toCountryId","dontselect=0");
    frmvalidator.addValidation("toCityId","dontselect=0");
    
  frmvalidator.addValidation("courierAmt","req","Please Enter Courier Amount");
  
     frmvalidator.addValidation("courierDet","req","Please Enter Courier Details");
     frmvalidator.addValidation("courierDate","req","Please Enter Courier Date");
     
 
 </script>
     
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