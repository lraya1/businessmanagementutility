
<%@page import="com.iebms.dao.CityMasterDao"%> 
 
 <%
 String target="ViewCityMaster.jsp?Status=Deletion failed";
 try
 {
 String id[]=request.getParameterValues("TypeId");
 for(int i=0;i<id.length;i++)
 {
 int Id=Integer.parseInt(id[i]);
 CityMasterDao dao=new CityMasterDao();
 boolean flag=dao.deleteCityMaster(Id);
 if(flag)
 {
 target="ViewCityMaster.jsp?Status=Deletion success";
 
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