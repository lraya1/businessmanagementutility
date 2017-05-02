
<%@page import="com.iebms.dao.CountryMasterDao"%>

<%
String target="Success.jsp?status=Deletion failed";
try
{
String id[]=request.getParameterValues("TypeId");
for(int i=0;i<id.length;i++)
{
int country=Integer.parseInt(id[i]);
CountryMasterDao dao=new CountryMasterDao();
boolean flag=dao.deleteCountryMaster(country);
if(flag)
{
target="Success.jsp?status=Deletion Success";
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
