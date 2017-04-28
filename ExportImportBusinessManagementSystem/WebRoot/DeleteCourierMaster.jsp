
<%@page import="com.iebms.dao.CourierDetailsDao"%> 
 <%
 String target="ViewCourierDetails.jsp?status=Deletion failed";
 try
 {
 String id[]=request.getParameterValues("TypeId");
 for(int i=0;i<id.length;i++)
 {
 int Id=Integer.parseInt(id[i]);
 CourierDetailsDao dao=new CourierDetailsDao();
 boolean flag=dao.deleteCourierDetails(Id);
 if(flag)
 {
 target="ViewCourierDetails.jsp?status=Deletion success";
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
  
 