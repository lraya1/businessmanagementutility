
<%@page import="com.iebms.dao.BillMasterDao"%><%
String target="ViewBillMaster.jsp?status=Deletion failed";
try
{
String id[]=request.getParameterValues("TypeId");
for(int i=0;i<id.length;i++)
{
int Id=Integer.parseInt(id[i]);
BillMasterDao dao=new BillMasterDao();
boolean flag=dao.deleteBillMaster(Id);
if(flag)
{
target="ViewBillMaster.jsp?status=Deletion failed";
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
