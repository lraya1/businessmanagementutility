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
<script language="JavaScript" src="scripts/gen_validatorv31.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script>
<script language="JavaScript1.1" src="scripts/pass.js">


</script> <script type="text/javascript" src="scripts/image.js"> </script>
 <script type="text/javascript" src="scripts/general.js"> </script>
 <script type="text/javascript" src="scripts/adi.js"> </script>
 <script type="text/javascript" src="scripts/form_validation.js"> </script>

<script type="text/javascript" src="scripts/moveclock.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>
<body>
<div align="justify"></div>
<table width="750" align="center" bgcolor="white">
<tr><td>
<img src="images/goods.jpg" width="780" height="230"></td>
</tr>
<tr>
   <td bgcolor="skyblue">
   
   <jsp:include page="generalOptions.jsp"/>
   
   </td></tr>
<tr><td>
<%--<div align="center">--%>
<%--<table bgcolor="white" width="750" align="center">--%>
<%--<tr>--%>
<%--   <td><jsp:include page="Template.html"/></td></tr></table></div>--%>
<div align="center">
<table bgcolor="white" width="770" align="center" height="70" align="right" >
<tbody  ><tbody  ><tr>
   <td>
     <br>
<font color="skyblue"><h4></h4>

    <p align="center">
     <%if(request.getParameter("status")!=null){ %>
    <font color="black"><b> <%=request.getParameter("status") %></b></font>
    <%} %> 
     <table  align="center" bgcolor="white" width="350"  align="right" ><tr><td>


   
    
    
    <span class="style9"><b><h2><center>Login Form </center></h2></b></span>
    
    
    <table bgcolor="white" align="center"> <tr><td>
    
    
    <form id="form1" name="register" method="post" action="./LoginAction">
    
     <table width="200" align="center" bgcolor="white" align="right">
       <tr>
         <td><span class="style9"><b>UserName</b></span></td>
         <td><label>
           <input type="text" name="username"/>
         </label></td>
       </tr>
       <tr>
         <td><span class="style9"><b>Password</b></span></td>
         <td><label>
           <input type="password" name="password"/>
         </label></td>
       </tr>
       <tr>
        <td></td>
         <td align="center">
           <label>
             <input type="submit" name="submit" value="Login" />
             </label>
                  </td>
       </tr>
     </table>
    
     </form>
     <script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("register");
  
 
  frmvalidator.addValidation("username","req","Please enter your User Name");
  
  frmvalidator.addValidation("password","req","Please enter your Password");
 
 </script>
     
     <tr><td align="center"><a href="Registerform.jsp"><font color="black"><b><u><img src="images/Signup1.png"></u></b></font></a></td></tr> 
      <tr></tr>
      <tr></tr>
      <tr><td align="center"><a href="Recoverpassword.jsp"><font color="black"><b><u>Forgot  Your Password</u></b></font></a></td></tr>
     </table>
     
     </td></tr></table>
     
       <p align="left"><font color="White" size="5">
    The e-Post Office is the shopping portal of the world renowned postal service on the internet and an additional distribution channel. It sells Stamps, PostCards, Packets, Cartons and has services like courier, registering for electricity vendors, selling mobile cards, etc. Under this website many Goods and services can be ordered , that are also available in a "normal" branch. The Goods prices are identical with the prices of their normal branches.

The e-Post Office is expanded permanently through new Goods and services in order to offer a Goods portfolio corresponding to the market. Private customer and business customers can order the selected Goods of the postal service online quickly and comfortably. Besides this, the e-Services offer new flexibility through e-Packet, the PICKUP order for packages over the internet as well as the online forwarding order and storage order. For the case of the absence or the move, one can let delegate here the after shipment of the postal service at another address or store the letter shipments. The customers can register themselves and can be served individually.
    
   </font> </p>
     
    
          <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
                              
     <p>&nbsp;</p></td></tr></table>


</body></html>