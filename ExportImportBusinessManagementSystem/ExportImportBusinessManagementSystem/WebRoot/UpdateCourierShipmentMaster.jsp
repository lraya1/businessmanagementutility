
<%@page import="com.iebms.dao.CourierMasterDao"%><%
String target="Success2.jsp?status=Courier Status Accept Failed";
int courierid=Integer.parseInt(request.getParameter("courierid"));
CourierMasterDao adao=new CourierMasterDao();
boolean flag=adao.updateCourierStatus(courierid);
if(flag)
{
target="Success2.jsp?status=Courier Status Accept Successfully";
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);
%>