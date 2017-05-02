
<%@page import="com.iebms.dao.OrderShipmentMasterDao"%>
<%@page import="com.iebms.dao.OrdersDAO"%><%
String target="Success2.jsp?status=Orders are Not Deliverd";
int shipmenttid=Integer.parseInt(request.getParameter("shipmentid"));
int orderid=Integer.parseInt(request.getParameter("orderid"));
OrderShipmentMasterDao adao=new OrderShipmentMasterDao();
boolean flag=adao.updateOrderShipmentStatus(shipmenttid);
if(flag)
{
boolean flag1=new OrdersDAO().orderCompleteStatus(orderid);
if(flag1)
{
target="Success2.jsp?status=Orders are  Deliverd";
}
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);


%>