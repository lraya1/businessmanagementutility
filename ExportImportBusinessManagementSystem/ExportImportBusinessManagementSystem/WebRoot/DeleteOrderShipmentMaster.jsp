
<%@page import="com.iebms.dao.OrderShipmentMasterDao"%>
<%
String target="ViewOrderShipmentMaster.jsp?status=Deletion failed";
try
{
String id[]=request.getParameterValues("TypeId");
for(int i=0;i<id.length;i++)
{
int Id=Integer.parseInt(id[i]);
OrderShipmentMasterDao dao=new OrderShipmentMasterDao();
boolean flag=dao.deleteOrderShipmentMaster(Id);
if(flag)
{
target="ViewOrderShipmentMaster.jsp?status=Deletion success";
}
}
}
catch(Exception e)
{
e.printStackTrace();
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);
%>