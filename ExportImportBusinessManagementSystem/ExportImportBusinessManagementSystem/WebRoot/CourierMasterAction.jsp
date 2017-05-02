
<%@page import="com.yourcompany.struts.form.CourierMasterForm"%>
 
<%@page import="com.iebms.dao.CourierMasterDao"%>
<%
String target="CourierMaster.jsp?status=Registration failed";
try
{
CourierMasterForm form=new CourierMasterForm();
form.setCourierDate(request.getParameter("courierDate"));
form.setUserId(Integer.parseInt(request.getParameter("UserId")));
//form.setEmployeId(Integer.parseInt(request.getParameter("employeId")));
form.setFromCountryId(Integer.parseInt(request.getParameter("fromCountryId")));
form.setToCountryId(Integer.parseInt(request.getParameter("toCountryId")));
form.setFromCityId(Integer.parseInt(request.getParameter("fromCityId")));
form.setToCityId(Integer.parseInt(request.getParameter("toCityId")));
form.setCourierAmt(Integer.parseInt(request.getParameter("courierAmt")));
form.setCourierDet(request.getParameter("courierDet"));
CourierMasterDao dao=new CourierMasterDao();
boolean flag=dao.insertCourierMaster(form);
if(flag)
{
target="CourierMaster.jsp?status=Registration success";
}
}catch(Exception e)
{
e.printStackTrace();
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);
%>