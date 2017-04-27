<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html>
<head>
<style>
body,td,th {
	    color: black;
	;
}
.style9 {    color: black}
body {
	background-color: white;
}
</style>

<title>ImportExportBusinessManagementSystem</title>
<script type="text/javascript" src="scripts/moveclock.js"></script>

<script type="text/javascript">
//var x_win = window.self; 

function goOn() {
var port=document.register.port.value;
var host=document.register.host.value;
var userName=document.register.userName.value;
window.location.href='http://'+host+':'+port+'/Epost-Office/ChekUserAction.do?userName='+userName;

} 
</script>
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
   <td bgcolor="skyblue"><jsp:include page="EmployeeOptions.jsp"/></td></tr>
<tr><td>
<%--<div align="center">--%>
<%--<table bgcolor="white" width="750" align="center">--%>
<%--<tr>--%>
<%--   <td><jsp:include page="Template.html"/></td></tr></table></div>--%>
<div align="center">
<table bgcolor="white" width="770" align="center" height="70">
<tr>
   <td>
    <table> <tr><td>
        <font color="skyblue"><h1><br></h1>
  
   <p align="center" class="style3">
  
    
   <%if(request.getParameter("status")!=null){ %>
      <%=request.getParameter("status") %><%} %>
      <form action="./EmployeeRegisterAction" method="post" name="register">
      
      <table border="1" bgcolor="" bordercolor="#FF0000">
      <tr><td>
      <b>Your E-PostOffice Account gives you access to view the E-Post Office details .   If you already have a E-Post Office Account, you can <a href="index.jsp">sign in</a> here.</b> 
       <input type="hidden" name="port" value="<%=request.getLocalPort() %>"/>
 <input type="hidden" name="host" value="<%=request.getServerName() %>"/>
      
       <table width="350" border="0" align="left">
<th colspan=2><font size="3" face="verdana"><b>1.Personal Details</b></font></th>
<tr></tr><tr></tr>
<tr>
    <td><font size="3" face="Verdana"><LABEL FOR="userName" ACCESSKEY="U">
	<b><U>U</U>ser Name</b></LABEL></font></td>
    <td width="303"><input id="userName" type="text" name="userName" onBlur="goOn()" value="<%if(request.getParameter("userName")!=null)out.print(request.getParameter("userName")); %>" size="20" /><font size="3" face="Verdana"><%if(request.getParameter("status1")!=null)
                                                                                                            out.print(request.getParameter("status1"));    %></font>
  </td><td><input type="button" name="check" value="check" onClick="goOn()"></td>	
</tr>
<tr>
 <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
   </LABEL><b><U>P</U>assword</b></font></td>
  <td>
    
        <input type="text" name="password"  onkeyup="testPassword(document.forms.register.password.value);" onChange="Encrypt(document.forms.register.password.value);"></td></tr>
        <tr><td></td><td>
          <a id="Words">Strength:</a></td>
      <td><table cellpadding=0 cellspacing=0><tr><td height=15  bgcolor=#dddddd></td></tr></table></td>

 
</tr>
<tr>
    <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>P</U>Confirm</b></font></td>
    <td><input type="text" name="conformpassword" value="" size="20" onBlur="checkconformpassword()"/></td>
</tr>
  <tr>
    <td><font size="3" face="verdana"><LABEL FOR="firstName" ACCESSKEY="F">
<b><U>F</U>irst Name</b></LABEL></font></td>
    <td width="255"><input id="firstName" type="text" name="firstName"  onblur="strValidate(this)"></td>
  </tr>
<tr>
    <td width="120"><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>L</U>ast Name</b></font></td>
    <td width="273"><font size="3" face="Verdana">
      <input type="text" name="lastName" value="" size="20" onBlur="strValidate(this)"/>
    </font></td>
  </tr>
  <tr>
    <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>B</U>irth Date</b></font></td>
    <td><font size="3" face="Verdana">
   <input type="text" name="dob" value="" size="20"   readonly/><a href="javascript:show_calendar('document.register.dob', document.register.dob.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a> 
    </font></td>
  </tr>
  <tr>
    <td><font size="3" face="verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>G</U>ender</b></font></td>
    <td width="255"><select name="gender">
    <option value="select" selected="true"><font size="3" face="Verdana">Select </font></option>
    <option value="Male"><font size="3" face="Verdana">Male</font></option>
    <option value="Female"><font size="3" face="Verdana">Female</font></option>
      </select></td>
  </tr>
  <tr>
    <td><font size="3" face="verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>B</U>rowse Photo</b></font></td>
    <td><input type="file" name="photo" class="textfield" onChange="preview(this)" /></td>
  </tr>
  <tr>
    <td><font size="3" face="verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>E</U>mail</b></font></td>
    <td><input type="text" name="email" value="" onBlur="isValidEmail(this.value)"/></td>
  </tr>
  <tr>
    <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>F</U>ax No</b></font></td>
    <td><font size="3" face="Verdana">
      <input type="text" name="fax" value="" size="20"/>
    </font></td>
  </tr>
<th colspan="2"><font size="3" face="verdana"><b>2.Contact Details</b></font></th>
<tr></tr><tr></tr>
<tr>
    <td><font size="3" face="Verdana"><LABEL FOR="addressType" ACCESSKEY="A">
<b>	<U>A</U>ddress Type</b></LABEL> </font></td>
    <td width="255"><select id="addressType" name="addressType" onChange="cleartext()">
    <option value="select" selected="true"><font size="3" face="Verdana">Select </font></option>
    <option value="home"><font size="3" face="Verdana">Home</font></option>
    <option value="office"><font size="3" face="Verdana">Office</font></option>
    <option value="personal"><font size="3" face="Verdana">Personal</font></option>
      </select></td>
</tr>
<tr>
    <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>H</U>ouse No</b></font></td>
    <td><input type="text" name="houseNo" value="" size="20"/></td>
</tr>
<tr>
    <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>S</U>treet</b></font></td>
    <td><input type="text" name="street" value="" size="20" onBlur="strValidate(this)"/></td>
</tr>
<tr>
    <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>P</U>hone Type</b></font></td>
    <td><select name="phoneType">
        <option value="select" selected="true"><font size="3" face="Verdana">Select</font></option>
        <option value="home"><font size="3" face="Verdana">Home</font></option>
        <option value="office"><font size="3" face="Verdana">Office</font></option>
        <option value="mobile"><font size="3" face="Verdana">Mobile</font></option>
    </select></td>
</tr>
<tr>
    <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><b><U>P</U>hone No</b></font></td>
    <td><input type="text" name="phoneNo" value="" size="20" onBlur="ValidateForm();abc()" /></td>
</tr>
<th colspan="5"><font size="3" face="verdana"><b>3.Account Details</b></font></th>
<tr></tr><tr></tr>
 <tr>
    <td><b>SecurityQuestion</b></td>
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
    <td><b>Security Answer</b></td>
    <td><INPUT name="sanswer" type="text"></td>
</tr>
<tr>
    <td><font size="3" face="Verdana"><center><input type="submit" name="createAccount" value="Register"/></center></font></td>
    <td><font size="3" face="Verdana"><input type="submit" name="cancel" value="Cancel"/></font></td>
</tr>
</table>
<br/><br/>
<table width="403" border="0" align="center">
  <tr rowspan="7"></tr>
  <tr></tr><tr></tr>
	  
    <tr colspan="3">
    <td><img alt="See Photo Here" id="previewField" src="images/Water lilies.jpg" height="140" width="150"></td>
  </tr>
  
</table>
<table width="350" border="0" align="center">
  <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
  <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr rowspan="2"></tr>
  <tr></tr><tr></tr><tr></tr><tr></tr> <tr></tr><tr></tr><tr></tr><tr></tr> <tr></tr><tr></tr><tr></tr><tr></tr> <tr></tr><tr></tr><tr></tr><tr></tr> <tr></tr><tr></tr><tr></tr><tr></tr> <tr></tr><tr></tr><tr></tr><tr></tr> <tr></tr><tr></tr><tr></tr><tr></tr> <tr></tr><tr></tr><tr></tr><tr></tr> <tr></tr><tr></tr><tr></tr><tr></tr>
  <tr>
    <td width="120"><font size="3" face="Verdana"><LABEL FOR="city" ACCESSKEY="C">
	<b><U>C</U>ity</b></LABEL></font></td>
    <td width="273"><font size="3" face="Verdana">
      <input type="text" id="city" name="city"  size="20"/>
    </font></td>
  </tr>
  <tr>
    <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><U></U><b>State</b></font></td>
    <td><font size="3" face="Verdana">
      <input type="text" name="state" value="" size="20"/>
    </font></td>
  </tr>
  <tr>
    <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><U></U><b>Country</b></font></td>
    <td><font size="3" face="Verdana">
      <input type="text" name="country" value="" size="20"/>
    </font></td>
  </tr>
  
  <tr>
    <td><font size="3" face="Verdana"><LABEL FOR="id_email" ACCESSKEY="F">
	</LABEL><U></U><b>Pin</b></font></td>
    <td><font size="3" face="Verdana">
      <input type="text" name="pin" value="" size="20" onChange="showStatus();abc1()"/>
    </font></td>
  </tr>
</table>  </td></tr></table>


  <input type="hidden" name="homeaddresstype"/>
<input type="hidden" name="homehouseno" />
<input type="hidden" name="homestreet"/>
<input type="hidden" name="homephonetype"/>
<input type="hidden" name="homecountry"/>
<input type="hidden" name="homepin"/>
<input type="hidden" name="homestate"/>
<input type="hidden" name="homephoneno"/>
<input type="hidden" name="homecity"/>

<input type="hidden" name="homefax"/>

 <input type="hidden" name="officeaddresstype"/>
<input type="hidden" name="officehouseno"/>
<input type="hidden" name="officestreet"/>
<input type="hidden" name="officephonetype"/>
<input type="hidden" name="officecountry"/>
<input type="hidden" name="officepin"/>
<input type="hidden" name="officestate"/>
<input type="hidden" name="officephoneno"/>
<input type="hidden" name="officecity"/>

<input type="hidden" name="officefax"/>

<input type="hidden" name="personaladdresstype" />
<input type="hidden" name="personalhouseno"/>
<input type="hidden" name="personalstreet"/>
<input type="hidden" name="personalphonetype"/>
<input type="hidden" name="personalcountry"/>
<input type="hidden" name="personalpin"/>
<input type="hidden" name="personalstate"/>
<input type="hidden" name="personalphoneno"/>
<input type="hidden" name="personalcity"/>

<input type="hidden" name="personalfax"/>
  </form>
  <script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("register");
  
 
  frmvalidator.addValidation("firstName","req","Please enter your First Name");
  frmvalidator.addValidation("firstName","maxlen=20",	"Max length for FirstName is 20");
  frmvalidator.addValidation("firstName","alpha"," First Name Alphabetic chars only");
  
  frmvalidator.addValidation("lastName","req","Please enter your Last Name");
  frmvalidator.addValidation("lastName","maxlen=20","Max length is 20");
  frmvalidator.addValidation("lastName","alpha"," Last Name Alphabetic chars only");
  
   frmvalidator.addValidation("gender","dontselect=0");
   frmvalidator.addValidation("dob","req","Please enter your DOB"); 
  
   frmvalidator.addValidation("photo","req","Please Load Your Photo"); 
  
  frmvalidator.addValidation("email","maxlen=50");
  frmvalidator.addValidation("email","req");
  frmvalidator.addValidation("email","email");
   
  
   frmvalidator.addValidation("addressType","dontselect=0");
   
   frmvalidator.addValidation("houseNo","req","Please enter your House Number");
   
   frmvalidator.addValidation("street","req","Please enter your Street Number");
     frmvalidator.addValidation("phoneType","dontselect=0");
   frmvalidator.addValidation("phoneNo","req");
  
  frmvalidator.addValidation("phoneNo","maxlen=50");
  frmvalidator.addValidation("phoneNo","numeric");
 frmvalidator.addValidation("phoneNo","Phone");
   
   frmvalidator.addValidation("city","req","Please enter your city Name");
   frmvalidator.addValidation("state","req","Please enter your State Name");
   frmvalidator.addValidation("country","req","Please enter your Country Name");
   frmvalidator.addValidation("pin","req","Please enter your pin Number");
   
   frmvalidator.addValidation("userName","req","Please enter your Username");
   frmvalidator.addValidation("password","req","Please enter your Password");
   frmvalidator.addValidation("conformpassword","req","Please enter your Confirm Password");
   frmvalidator.addValidation("secrete","req","Please enter your Answer");
   frmvalidator.addValidation("squest","dontselect=0");
   frmvalidator.addValidation("fax","req","Please enter Fax Number");
  
   frmvalidator.addValidation("fax","age");
    
 </script>
  
     
     
     
     
     </td></tr></table>
          <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
                              
     <p>&nbsp;</p></td></tr></table></div>


</body></html>