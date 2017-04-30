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
<script language="JavaScript" src="scripts/gen_validatorv31.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script>
<script language="JavaScript1.1" src="scripts/pass.js">


</script> <script type="text/javascript" src="scripts/image.js"> </script>
 <script type="text/javascript" src="scripts/general.js"> </script>
 <script type="text/javascript" src="scripts/adi.js"> </script>
 <script type="text/javascript" src="scripts/form_validation.js"> </script>

<script type="text/javascript" src="scripts/moveclock.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script type="text/javascript">
function validate()
{
var form=document.register
if(form.username.value=="")
{
alert("username is Required");
form.username.focus();
return false;

}
if(form.squest.value==""&&form.ownquest.value=="")
{
alert("select a question ");
form.squest.focus();
return false;

}
if(form.sanswer.value==""||form.sanswer.value=="")
{
alert("Answer is Required ");
form.sanswer.focus();
return false;

}

 return true;
}
</script>
<script type="text/javascript">
//var x_win = window.self; 
function check()
{   
    var form = document.register;

    if(!form.ch.checked)
    {
          form.ownquest.disabled=true;
          form.squest.disabled=false;
    }
    else{
    
          form.ownquest.disabled=false;
          form.squest.disabled=true;
    }
    
    }</script>
</head>
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
    
     <%if(request.getParameter("status")!=null) {%>
      <%=request.getParameter("status") %>
      <%} %>
      
      
      <FORM action="./RecoverPasswordAction" method="post" name="register" onsubmit="return validate()">
      
      <table width="325" height="115" align="center" bordercolor="#660000" bgcolor="#597B84">
        <tr bgcolor="#150015"><p><strong><h3><cite>x<center><font color="#FFFFFF">ForgotPassword Form</font></center></cite></h3></strong></p></tr>
      	  <tr>
          <td width="119"><div align="center"><span class="style1"><font color="#FFFFFF">UserName</font></span></div></td>
          <td width="144"><div align="center"><p>	</p><p></p>
            <input type="text" name="username"/>
            </div></td>
        </tr>
         <tr>
    <td><span class=Title> <span class="style1"><font color="#FFFFFF">SecurityQuestion</font></span></td>
    <td><select name="squest">
      <option value="select" selected="true"><font size="3" face="Verdana">--Select One---</font></option>
      <option value="What is your favorite pastime?"><font size="3" face="Verdana">What is your favorite pastime?</font></option>
      <option value="Who your childhood hero?"><font size="3" face="Verdana">Who your childhood hero?</font></option>
      <option value="What is the name of your first school?"><font size="3" face="Verdana">What is the name of your first school?</font></option>
      <option value="Where did you meet your spouse?"><font size="3" face="Verdana">Where did you meet your spouse?</font></option>
      <option value="What is your favorite sports team?"><font size="3" face="Verdana">What is your favorite sports team?</font></option>
      <option value="What is your father middle name?"><font size="3" face="Verdana">What is your father middle name?</font></option>
      <option value="What was your high school mascot?"><font size="3" face="Verdana">What was your high school mascot?</font></option>
      <option value="What make was your first car or bike?"><font size="3" face="Verdana">What make was your first car or bike?</font></option>
      <option value="What is your pet name?"><font size="3" face="Verdana">What is your pet name?</font></option>
    </select></td>
</tr>
        <tr>
    <td colspan="2">
         <input type="checkbox" name="ch" value="1" onClick="check(register)" />
     <span class=Title><span class="style1"><font color="#FFFFFF">Own Question</font> </span></td>
  </tr>
   <tr>
    <td><span class=Title><span class="style1"><font color="#FFFFFF">Own Question</font></span></td>
    <td><input type="text" name="ownquest" disabled="disabled" size="37"/>    </td>
  </tr>
<tr>
    <td><span class=Title><span class="style1"><font color="#FFFFFF"> Security Answer</font></span></td>
    <td><INPUT name="sanswer" type="text"></td>
</tr>
  <tr><td><div align="center"><span class="style2"></span></div></td>
        <td><div align="center">
          <input type="submit" name="send" value="Recover"/>
        </div></td>
     
	  </table></form>
     </table>
     
     </td></tr></table>
     
     
     
     


</body></html>