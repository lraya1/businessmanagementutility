
<%@page import="com.iebms.dao.EmployeMasterDao"%><%
String target="ViewEmployeMaster.jsp?status=Deletion failed";
try
{
String id[]=request.getParameterValues("TypeId");
for(int i=0;i<id.length;i++)
{
int Id=Integer.parseInt(id[i]);
EmployeMasterDao dao=new EmployeMasterDao();
boolean flag=dao.deleteEmployeMaster(Id);
if(flag)
{
target="ViewEmployeMaster.jsp?status=Deletion success";
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