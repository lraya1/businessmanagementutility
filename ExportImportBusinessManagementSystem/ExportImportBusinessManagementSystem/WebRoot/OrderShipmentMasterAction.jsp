
<%@page import="com.yourcompany.struts.form.OrderShipmentMasterForm"%>
<%@page import="com.iebms.dao.OrderShipmentMasterDao"%>
<%
String target="OrderShipmentMaster.jsp?status=Registration failed";
try
{
OrderShipmentMasterForm form=new OrderShipmentMasterForm();
 
form.setShipmentDate(request.getParameter("shipmentDate"));
form.setOrderId(Integer.parseInt(request.getParameter("orderId")));
form.setShipmentInchargeEmpId(Integer.parseInt(request.getParameter("shipmentInchargeEmpId")));
form.setShipmentStatus(request.getParameter("shipmentStatus"));
form.setUserId(Integer.parseInt(request.getParameter("UserId")));
form.setCustomerFeedBack(request.getParameter("customerFeedBack"));
OrderShipmentMasterDao dao=new OrderShipmentMasterDao();
boolean flag=dao.insertOrderShipmentMaster(form);
if(flag)
{
target="OrderShipmentMaster.jsp?status=Registration success";
}
}
catch(Exception e)
{
e.printStackTrace();
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);
%>