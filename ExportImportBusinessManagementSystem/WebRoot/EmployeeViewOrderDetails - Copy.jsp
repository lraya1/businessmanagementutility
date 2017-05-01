
<%@page import="com.iebms.util.CoreHash"%>
<%@page import="com.iebms.dao.OrdersDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.Orders"%>
<%@page import="com.iebms.dao.GoodsMasterDao"%>
<%@page import="com.iebms.dao.GoodsDetailsDao"%>

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
   
   <font color="skyblue"><h1><br></h1>
  

     <p align="center">
    
    
    
    
    
   <center>
     <h2><font color="black"> <p align="center"> <fieldset>
					<legend><span class="style3">Order Details</span></legend>
                    <div align="center"><form id="form2" method="post" action="UserSearch.jsp" name="search" onSubmit="javascript:if(document.search.brandid.value=='' && document.search.categoryid.value==''&& document.search.itemid.value==''){alert('select Any Search Criteria');}">
                    </form>
                             
              </div>
                    <form name="f" method="post" action="DeleteBrandAction.jsp">
                      <div align="center" class="style21"></div>
                      <div align="left">
                      <br/>
		        <table width="510" border="0" align="center">
                     <tr>
                    
                    <td width="127" bgcolor="#39552D"><div align="center" class="style19"><span class="style4">Category</span></div></td>
                    <td width="150" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Item</strong></div></td>
                    <td width="102" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Quantity</strong></div></td>
                    <td width="109" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Price</strong></div></td>
                  </tr>
                    <%
                    	try
                           {
                          		CoreHash aCoreHash = new OrdersDAO().listOrderDetails(Integer.parseInt(request.getParameter("orderid")));
                          		if(!aCoreHash.isEmpty())
                          		{
                          		     Enumeration enu = aCoreHash.elements();
                          		     Orders aOrder = null;
                          		     //CoreHash bCoreHash = new BrandDAO().listBrandNames();
                          		     CoreHash cCoreHash = new GoodsMasterDao().listCategoryNames();
                          		     CoreHash iCoreHash = new GoodsDetailsDao().listItems();

                                     while(enu.hasMoreElements())
                          		     {
                          		           aOrder = (Orders)enu.nextElement();
                    %>     
                  <tr>
                    
                    <td bgcolor="#DDEAD7"><div align="center"><span class="style14"><%=cCoreHash.get(new Integer(aOrder.getCategoryid()))%></span></div></td>
                    <td bgcolor="#DDEAD7"><div align="center"><span class="style14"><%=iCoreHash.get(new Integer(aOrder.getItemid()))%></span></div></td>
                    <td bgcolor="#DDEAD7"><div align="center" class="style14">
                      <div align="center"><%=(aOrder.getQuantity())%></div>
                    </div></td>
                    <td bgcolor="#DDEAD7"><div align="center" class="style14">
                      <div align="center"><%=new GoodsDetailsDao().getBalance(aOrder.getItemid())%></div>
                    </div></td>
                  </tr>
                  <%} }}
      	catch(Exception e)
      	{
      	   e.printStackTrace();
      	} %>
          </table>
                <p align="center">
                  <label>
                  <input type="button" name="button" id="button" value="Back" onclick="javascript:history.back(-1);"/>
                  </label>
                </p>
                      </div>
               </form></font></h2>
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