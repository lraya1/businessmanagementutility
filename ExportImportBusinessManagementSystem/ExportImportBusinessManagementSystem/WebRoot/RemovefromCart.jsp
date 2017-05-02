<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.iebms.util.*,java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'RemovefromCart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
   String status = "status=Item Remove failed";
   try
   {
       CoreHash aCoreHash = (CoreHash)session.getAttribute("cart");
       Integer key = new Integer(request.getParameter("id"));
       int nic = ((Integer)session.getAttribute("nci")).intValue();
       
       if(aCoreHash.remove(key)!=null)
       {
          status = "status=Item Removed From Cart";
          nic--;
          session.setAttribute("cart",aCoreHash);
          session.setAttribute("nci",new Integer(nic));
       }
       
   }
   catch(Exception e)
   {
      LoggerManager.writeLogWarning(e);
   }
   response.sendRedirect("ViewCart.jsp?"+status);
  %>
  </body>
</html>
