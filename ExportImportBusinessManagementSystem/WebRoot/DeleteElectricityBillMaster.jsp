
<%@page import="com.iebms.dao.ElectricityBillMasterDao"%><%
String target="ViewElectricityBillMaster.jsp?status=Deletion failed";
try
{
String id[]=request.getParameterValues("TypeId");
for(int i=0;i<id.length;i++)
{
int Id=Integer.parseInt(id[i]);
ElectricityBillMasterDao dao=new ElectricityBillMasterDao();
boolean flag=dao.deleteElectricityBillMaster(Id);
if(flag)
{
target="ViewElectricityBillMaster.jsp?status=Deletion failed";
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
