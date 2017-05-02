
<%@page import="com.iebms.dao.CourierMasterDao"%> 
 <%
 String target="ViewCourierMaster.jsp?status=Deletion failed";
 try
 {
 String id[]=request.getParameterValues("TypeId");
 
 for(int i=0;i<id.length;i++)
 {
 int Id=Integer.parseInt(id[i]);
 CourierMasterDao dao=new CourierMasterDao();
 boolean flag=dao.deleteCourierMaster(Id);
 if(flag)
 {
 target="ViewCourierMaster.jsp?status=Deletion success";
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
 
 
 