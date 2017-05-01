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

<title>EPost-Office</title>
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
					<img src="images/goods.jpg" width="780" height="230">
				</td>
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
  
   <p align="center">
    
    
    
    
    
   <center>
    <font color="black"><form action="adminChangePassword.do">
      
      <table width="325" height="115" align="center" bordercolor="#660000" bgcolor="#597B84">
        <tr bgcolor="#150015"><p><strong><h3><cite><center><font color="#FFFFFF">ChangePassWord Form</font></center></cite></h3></strong></p></tr>
    
			
        <tr>
          <td width="119"><div align="center"><span class="style1"><font color="#FFFFFF">Login Name</font></span></div></td>
          <td width="144"><div align="center"><p>	</p><p></p>
           	<input type="text" name="username" value="<%=session.getAttribute("user") %>" readonly />
            </div></td>
        </tr><tr></tr>
        <tr>
           <td width="119"><div align="center"><span class="style1"><font color="#FFFFFF">OldPassWord</font></span></div></td>
           <td width="144"><div align="center">
            <input type="password" name="oldpassword"/>
          </div></td>
        </tr>
         <tr>
           <td width="119"><div align="center"><span class="style1"><font color="#FFFFFF">NewPassWord</font></span></div></td>
           <td width="144"><div align="center">
            <input type="password" name="newpassword"/>
          </div></td>
        </tr>
        <tr><td><div align="center"><span class="style2"></span></div></td>
        <td><div align="center">
          <input type="submit" name="submit" value="change"/>
        </div></td>
       
	  </table> </form>

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