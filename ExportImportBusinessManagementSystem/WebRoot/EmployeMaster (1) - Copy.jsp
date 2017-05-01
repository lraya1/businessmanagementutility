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

<title>ImportExportBusinessManagementSystem</title>
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
   <td bgcolor="skyblue"><jsp:include page="Adminoptions.jsp"/></td></tr>
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
  
   <p align="center" class="style3">
  
   
     <p>&nbsp;</p>
     <p>&nbsp;</p>
     <p>&nbsp;</p>
     <p align="center">
    <center><font color="black"><b>Employee Registeration Form</b></font></center>
    
    <form action="employeeRegisterAction.do" name="register">
    <table align="center" bgcolor="white">
			
			<tr><td><font color="black"><b>EmployeFirstName :</b></font> </td><td><input type=text name="employeFirstName"/></td></tr>  
			<tr><td><font color="black"><b>EmployeMiddleName :</b></font> </td><td><input type=text name="employeMiddleName"/></td></tr> 
			<tr><td><font color="black"><b>EmployeLastName : </b></font></td><td><input type=text name="employeLastName"/></td></tr> 
			<tr><td><font color="black"><b>DateOfBirth :</b></font> </td><td>&nbsp;&nbsp;&nbsp;&nbsp;<input type=text name="dateOfBirth"/><a href="javascript:show_calendar('document.register.dateOfBirth', document.register.dateOfBirth.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a></td></tr>
			<tr><td><font color="black"><b>Phone :</b></font> </td><td><input type=text name="phone"/></td></tr> 
			<input type="hidden" name="userId" value="10001"/>
			
		
			<tr><td><font color="black"><b>Address : </b></font></td><td><input type=text name="address"/></td></tr>
			 <tr><td><font color="black"><b>Email : </b></font></td><td><input type=text name="email"/></td></tr>
			<tr><td><font color="black"><b>Image : </b></font></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=file name="image"/></td></tr>
			<tr><td><font color="black"><b>User Name:</b></font> </td><td><input type=text name="username"/></td></tr>
			<tr><td><font color="black"><b>Password : </b></font></td><td><input type=password name="password"/></td></tr>
			
			
			<tr><td></td><td><input type=submit name="Register" value="Register"/></td></tr></table>
		</form>
    
   <script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("register");
  
 
  frmvalidator.addValidation("employeFirstName","req","Please enter First Name");
  frmvalidator.addValidation("employeFirstName","maxlen=20",	"Max length for FirstName is 20");
  frmvalidator.addValidation("employeFirstName","alpha"," First Name Alphabetic chars only");
  
  frmvalidator.addValidation("employeMiddleName","req","Please enter  Middle Name");
  frmvalidator.addValidation("employeMiddleName","maxlen=20","Max length is 20");
  frmvalidator.addValidation("employeMiddleName","alpha"," Middle Name Alphabetic chars only");
 
 frmvalidator.addValidation("employeLastName","req","Please enter  Last Name");
  frmvalidator.addValidation("employeLastName","maxlen=20","Max length is 20");
  frmvalidator.addValidation("employeLastName","alpha"," Last Name Alphabetic chars only");
  
   
  
   frmvalidator.addValidation("dateOfBirth","req","Please enter your DOB"); 3
   
   frmvalidator.addValidation("phone","req");
  
  frmvalidator.addValidation("phone","maxlen=50");
  frmvalidator.addValidation("phone","numeric");
 frmvalidator.addValidation("phone","Phone");
   
  
   frmvalidator.addValidation("address","req","Please Enter Address");
  
  frmvalidator.addValidation("email","maxlen=50");
  frmvalidator.addValidation("email","req");
  frmvalidator.addValidation("email","email");
  
   frmvalidator.addValidation("image","req","Please enter a Image");
    
    frmvalidator.addValidation("username","req","Please enter a User Name");
    frmvalidator.addValidation("password","req","Please enter a Password");
    
  
 </script>
   
   
     
     
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