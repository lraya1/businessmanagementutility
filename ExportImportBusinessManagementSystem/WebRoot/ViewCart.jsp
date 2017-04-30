<%@page import="com.iebms.util.CoreList"%>
<%@page import="com.iebms.util.CoreHash"%>
<%@page import="com.iebms.dao.CountryMasterDao"%>
<%@page import="com.iebms.dao.GoodsMasterDao"%>
<%@page import="com.iebms.dao.GoodsDetailsDao"%>
<%@page import="com.yourcompany.struts.form.Orders"%>
<%@page import="java.util.Enumeration"%>


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
<script type="text/javascript" src="scripts/moveclock.js"></script>

<script language="javascript" src="scripts/general.js"></script>
<script type="text/javascript">
function calculate(form)
  {
  
  var total="00.00"; 
  var count=0;
    
     for(var i=1;document.order.iprice[i]!=null;i++)
     { 
           if(document.order.quantity[i].value<=0)
            {
                alert("Quantity must be greater than Zero");
                document.order.quantity[i].value=1;
            }    
                document.order.price[i].value = (document.order.iprice[i].value)*(document.order.quantity[i].value);
                total=parseFloat(total)+parseFloat(document.order.price[i].value);
                document.order.total.value=total;
                
      }             
  

   return true;
}
</script>

</head>
<body onload="calculate(order)">
<table width="750" align="center" bgcolor="white">
<tr><td>
<img src="images/goods.jpg" width="780" height="230"></td>
</tr>
<tr>
   <td bgcolor="skyblue"><jsp:include page="./Header.jsp" />
   </td></tr>
<tr><td>
<%--<div align="center">--%>
<%--<table bgcolor="white" width="750" align="center">--%>
<%--<tr>--%>
<%--   <td><jsp:include page="Template.html"/></td></tr></table></div>--%>
<div align="center">
<table bgcolor="white" width="770" align="center" height="70">
<tr>
   <td>
   
   
     <p>&nbsp;</p>
     <p>&nbsp;</p>
     <p>&nbsp;</p>
     <p align="center">
   <center>
    
    <font color="black"><b>
      <fieldset>
					<legend><span class="style3"><font color="black"><b>View Cart Items</b></font></span></legend>

  <br />
  
 
      <form  method="post" action="PlaceOrder.jsp" name="order">
      
    <table width="634" border="0" align="center" bordercolor="#8692E3" bgcolor="green">
    
      <tr bgcolor="white">
      <%
      	CoreList inCoreList = new CoreList();
      	      CoreHash bCoreHash = new CoreHash();
      	      CoreHash cCoreHash = new CoreHash();
      	      CoreHash iCoreHash = new CoreHash();
      	      
      	     try{
                   int categoryid = 0;
                   int itemid = 0;
                   CountryMasterDao countrymasterdao = new CountryMasterDao();
                   GoodsMasterDao Goodsmasterdao = new GoodsMasterDao();
                   GoodsDetailsDao GoodsDetailsDao = new GoodsDetailsDao();
                 
                   
                   if(session.getAttribute("cart")!=null && !((CoreHash)session.getAttribute("cart")).isEmpty())
               	 {
                     //Inventory inventory = null;
                    // iCoreHash = itemdao.listItemNames(); 
                  //   cCoreHash = categorydao.listCategoryNames(); 
                     //bCoreHash = branddao.listBrandNames();
                     
                     Orders order = new Orders(); 
                     CoreHash aCoreHash = (CoreHash)session.getAttribute("cart");
                     Enumeration  enu = aCoreHash.elements();
      %>
         <td width="74"><div align="center" class="style8"><font color="black"><b>Country Name</b></font><input type="hidden" name="brandid" value="0"/></div></td>
        <td width="89"><div align="center" class="style8"><font color="black"><b>Goods Name</b></font><input type="hidden" name="categoryid" value="0"/></div></td>
        <td width="96"><div align="center" class="style8"><font color="black"><b>Item</b></font><input type="hidden" name="itemid" value="0"/></div></td>
        <td width="98"><div  class="style8"><font color="black"><b>Price/Item</b></font><input name="iprice" type="hidden" value="0"/></div></td>
	    <td width="61"><div class="style8"><font color="black"><b>Quantity</b></font><input name="quantity" type="hidden" value="0"/></div></td>
        <td width="56"><div class="style8"><font color="black"><b>Amount</b></font><input name="price" type="hidden" value="0"/></div></td>
        <td width="64"><div class="style8">Remove</div></td>
        </tr>
          <%
          	
          	int quantity = 0;
          	double price = 0;
          			//Item item;
          			int brandid = 0;
          			int i=0;
          			while (enu.hasMoreElements()) 
          			{
          				order = (Orders) enu.nextElement();
          				itemid = order.getItemid();
          				 System.out.println("this is  asdfas itemid"+itemid);
          				System.out.println("itemid"+itemid);
          				categoryid = order.getCategoryid();
          				brandid = order.getBrandid();
          		        //inventory = new InventoryDAO().getInventory(brandid, categoryid, itemid);     		
         String countryname=countrymasterdao.getCountryName(brandid);
         String Goodsname=Goodsmasterdao.getGoodsName(categoryid);
         String itemname=GoodsDetailsDao.getItemname(itemid);
         int itemprice=GoodsDetailsDao.getItemPrice(itemid);
        System.out.println("Itemname"+itemname);
          %>
      <tr bgcolor="#CEC9FA">
      
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><input type="hidden" name="brandid" value="<%=brandid%>"/><font color="black"><b><%=countryname%></b></font></div></td> 
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><input type="hidden" name="categoryid" value="<%=categoryid%>"/><font color="black"><b><%=Goodsname%></b></font></div></td> 
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><input type="hidden" name="itemid" value="<%=itemid%>"/><font color="black"><b><%=itemname%></b></font></div></td>
        <td bgcolor="#C3D7BA"><div align="center"><span class="style7">
        <input name="iprice" type="text" value="<%=itemprice %>" size="5" readonly/>
        </span></div></td>
        <td bgcolor="#C3D7BA"><div align="center"><input name="quantity" type="text" value="1" size="5"  onkeyup="calculate(order)"/>
        </div></td>
        <td bgcolor="#C3D7BA"><div align="center"><input name="price" type="text" value="<%=itemprice %>" size="5" readonly/>
        </div></td>
        <td valign="top" bgcolor="#DDEAD7"><div align="center" class="style9"><a href="RemovefromCart.jsp?id=<%=brandid%><%=categoryid%><%=itemid%>"><img src="images/delete_button.png" alt="" width="26" height="26"/></a> </div></td>
      </tr>
      <%i++;
      	}%> <input type="hidden" name="count" value="<%=i%>"/>
      	
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td bgcolor="white"><div align="center"><span class="style3"><strong><font color="black"><b>Total</b></font></strong></span></div></td>
        <td bgcolor="#C3D7BA"><input name="total" type="text" size="8" readonly="true" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="8"><div align="center">
         
         
          <input type="submit" name="button" id="button2" value="Place Order"/>  &nbsp; &nbsp;<input type="button" name="button" id="button2" value="Back" onclick="javascript:history.back(-1);"/>
         
        </div></td>
      </tr>
       <%
       	}
       else {
      %>
         <tr><td height="24" colspan="8"><div align="center" class="style3"><input type="hidden" name="iprice"/><strong><font color="black"> No Items in the Cart</font></strong></div></td>
         </tr>
      <%
      	}
      	} catch (Exception e) {
      		
      	}
      	
      %>
    </table>
   
  </form>
	</fieldset>
		
    </b></font>
    
    
    
     
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