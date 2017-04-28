<%@ page language="java" pageEncoding="ISO-8859-1"%>
 


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
    
    
    
    <tr><td><table bgcolor="white"><tr><td>
    
   <center><h4><strong><font color="black"><h2>Country Registration  Form</h2></font></strong></h4>
     
	<%if(request.getParameter("status")!=null){ %>
	<%=request.getParameter("status") %><%} %>
		<form action="countryMasterAction.do" name="register">
		<table align="center" bgcolor="skyblue">
			<tr><td bgcolor="white"><strong><font color="black">Country Name :</font></strong> </td>
			<td bgcolor="white"><input type=text name="countryName"/> </td><td></td></tr>
			
			<tr><td bgcolor="white"><strong><font color="black">Country Area :</font></strong> </td>
			<td bgcolor="white"><input type=text name="countryArea"/></td><td></td></tr> 
			<tr><td bgcolor="white"><strong><font color="black">Description : </font></strong></td>
			<td bgcolor="white"><input type=text name="description"/> </td><td></td></tr>
			<tr><td bgcolor="white"><strong><font color="black">Abbreviation :</font></strong> </td>
			<td bgcolor="white"><input type=text name="abbr"/> </td><td></td></tr>
			<tr>
			  <td bgcolor="white"><strong><font color="black">&nbsp;CountryMap :</font></strong> </td>
			  <td bgcolor="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="countryMap" onChange="preview(this)"/> </td><td><img alt="See Photo Here" id="previewField" src="images/Hindu-God-Hanuman-Photo-0007.jpg" height="100" width="100"></td></tr>
			<tr bgcolor="white"><td></td>
			<td><input type=submit name="Register" value="Register"/><input type=reset name="Register" value="Reset"/></td></tr>
				</table> 
		</form>
		<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("register");
  
 
  frmvalidator.addValidation("countryName","req","Please enter Country Name");
  frmvalidator.addValidation("countryName","maxlen=20",	"Max length for countryName is 20");
  frmvalidator.addValidation("countryName","alpha"," countryName Alphabetic chars only");
  
  frmvalidator.addValidation("countryArea","req","Please enter Country Area");
  
  frmvalidator.addValidation("description","req","Please enter Country Description");
  frmvalidator.addValidation("abbr","req","Please enter Country Abbrivation");
  frmvalidator.addValidation("countryMap","req","Please select a Country Map");
  
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
             
                         
                              
     


</body></html>