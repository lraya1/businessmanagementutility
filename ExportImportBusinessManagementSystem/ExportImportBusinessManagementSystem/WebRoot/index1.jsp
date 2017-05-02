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

<title>ImportExportBusinessManagementSystem</title><script language="JavaScript" src="scripts/gen_validatorv31.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script>
<script language="JavaScript1.1" src="scripts/pass.js">


</script> <script type="text/javascript" src="scripts/image.js"> </script>
 <script type="text/javascript" src="scripts/general.js"> </script>
 <script type="text/javascript" src="scripts/adi.js"> </script>
 <script type="text/javascript" src="scripts/form_validation.js"> </script>

<script type="text/javascript" src="scripts/moveclock.js"></script>

<script type="text/javascript" src="scripts/moveclock.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>
<body>
<table width="750" align="center" bgcolor="white">
<tr><td>
<img src="images/goods.jpg" width="780" height="230"></td>
</tr>
<tr>
   <td bgcolor="skyblue"><jsp:include page="generalOptions.jsp"/></td></tr>
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
      <h2><font color="black"><b>Employee Login Form</b></font></h2>
   <%if(request.getParameter("status")!=null){ %>
    <font color="black"><b> <%=request.getParameter("status") %></b></font>
    <%} %> 
      <table  align="center" bgcolor="#999999"><tr><td>
     
    
    
    
    <table> <tr><td>
    
    
    <form id="form1" name="register" method="post" action="employeeLoginAction.do">
    
     <table width="200" align="center" bgcolor="white">
       <tr>
         <td><span class="style9"><b>UserName</b></span></td>
         <td><label>
           <input type="text" name="username"/>
         </label></td>
       </tr>
       <tr>
         <td><span class="style9"><b>PassWord</b></span></td>
         <td><label>
           <input type="password" name="password"/>
         </label></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td>
           <label>
             <input type="submit" name="submit" value="Login" />
             </label>
                  </td>
       </tr>
     </table>
     
     </form><script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("register");
  
 
  frmvalidator.addValidation("username","req","Please enter your User Name");
  
  frmvalidator.addValidation("password","req","Please enter your Password");
 
 </script>
     
     </td></tr></table>
     
     
     
     </td></tr></table>
          <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
                              
     <p>&nbsp;</p></td></tr></table></div>


</body></html>