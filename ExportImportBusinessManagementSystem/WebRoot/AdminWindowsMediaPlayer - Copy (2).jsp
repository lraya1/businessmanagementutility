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
     <h2><font color="black"> <OBJECT
ID="WinMedia"
classid="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95"
 width=450 height=250 >
 <%String samplevideo=request.getParameter("videofile");
 System.out.println("samplevideofile"+samplevideo); %>
<PARAM NAME="Filename" VALUE="images/<%=samplevideo%>"/>
<PARAM NAME="ShowStatusBar" VALUE="-1"/>
</OBJECT>
</font></h2>
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