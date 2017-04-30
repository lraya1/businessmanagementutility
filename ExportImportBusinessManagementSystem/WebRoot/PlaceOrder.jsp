<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.iebms.util.CoreHash,java.util.*"%>
<%@ page import="com.iebms.util.*,java.util.*" %>
<%@page import="com.yourcompany.struts.form.Orders"%>
<%@page import="com.iebms.dao.OrdersDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'PlaceOrder.jsp' starting page</title>
    
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
    String status = "status=Order Not Placed";
     try
     {
         String brandid[] = request.getParameterValues("brandid");
         String categoryid[] = request.getParameterValues("categoryid");
         String itemid[] = request.getParameterValues("itemid");
         
         String quantity[] = request.getParameterValues("quantity");
         String price[] = request.getParameterValues("price");
         
         Orders singleOrders = null;
         Orders totalOrders = new Orders();
         CoreHash aCoreHash = new CoreHash();
         int userid=((Integer)session.getAttribute("user")).intValue();
     
         System.out.println("brand"+brandid.length);
             System.out.println("category"+categoryid.length);
                 System.out.println("item"+itemid.length);
                     System.out.println("quantity"+quantity.length);
                         System.out.println("price"+price.length);
         try
         {
         	for(int i=0; i<brandid.length;i++)
         	{
            	singleOrders = new Orders();
            	singleOrders.setBrandid(Integer.parseInt(brandid[i]));
            	singleOrders.setCategoryid(Integer.parseInt(categoryid[i]));
            	singleOrders.setItemid(Integer.parseInt(itemid[i]));
            	singleOrders.setQuantity(Integer.parseInt(quantity[i]));
            	singleOrders.setPrice(Float.parseFloat(price[i]));
            
          	    aCoreHash.put(new Integer(i),singleOrders);
         	}
         }
         catch(Exception aiob)
         {
         aiob.printStackTrace();
             LoggerManager.writeLogWarning(aiob);
         }
         
         double total = Double.parseDouble(request.getParameter("total"));
         
         
         
         totalOrders.setTotalamount(total);
     //    totalOrders.setLoginname((String)session.getAttribute("user"));
         totalOrders.setOrderDate(DateWrapper.parseDate(new Date()));
         totalOrders.setStatus("Pending");
         totalOrders.setUserid(userid);
         boolean flag = new OrdersDAO().placeTotalOrder(totalOrders, aCoreHash);
         
         if(flag)
         {
             status = "status=Order Placed";
             session.removeAttribute("cart");
             session.removeAttribute("nci");
         }
     }
     catch(Exception e)
     {
     e.printStackTrace();
        LoggerManager.writeLogWarning(e);
     }
     response.sendRedirect("Success1.jsp?"+status);
     %>
  </body>
</html>
