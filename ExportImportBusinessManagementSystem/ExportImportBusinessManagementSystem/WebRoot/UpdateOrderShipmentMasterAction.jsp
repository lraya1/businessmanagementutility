
<%@page import="com.yourcompany.struts.form.OrderShipmentMasterForm"%>
<%@page import="com.iebms.dao.OrderShipmentMasterDao"%>
<%
String target="ViewOrderShipmentMaster.jsp?status=Updation failed";
try
{
OrderShipmentMasterForm form=new OrderShipmentMasterForm();
form.setShipmentId(Integer.parseInt(request.getParameter("ShipId")));
form.setShipmentDate(request.getParameter("shipmentDate"));
form.setOrderId(Integer.parseInt(request.getParameter("orderId")));
form.setShipmentInchargeEmpId(Integer.parseInt(request.getParameter("shipmentInchargeEmpId")));
form.setShipmentStatus(request.getParameter("shipmentStatus"));
form.setUserId(Integer.parseInt(request.getParameter("UserId")));
form.setCustomerFeedBack(request.getParameter("customerFeedBack"));
OrderShipmentMasterDao dao=new OrderShipmentMasterDao();
boolean flag=dao.UpdateOrderShipmentMaster(form);
if(flag)
{
target="ViewOrderShipmentMaster.jsp?status=Updation success";
}
}
catch(Exception e)
{
e.printStackTrace();
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);
%>