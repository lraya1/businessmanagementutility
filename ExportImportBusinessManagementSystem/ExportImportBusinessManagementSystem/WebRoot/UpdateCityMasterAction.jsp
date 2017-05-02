
<%@page import="com.yourcompany.struts.form.CityMasterForm"%>
<%@page import="com.iebms.dao.CityMasterDao"%>
<%
String target="ViewCityMaster.jsp?status=Updation failed";
try
{
CityMasterForm form=new CityMasterForm();
form.setCityId(Integer.parseInt(request.getParameter("cityId")));
form.setCityName(request.getParameter("cityName"));
form.setAbbr(request.getParameter("abbr"));
form.setCityMap(request.getParameter("cityMap"));
form.setDescription(request.getParameter("description"));
form.setCountryId(Integer.parseInt(request.getParameter("countryId")));
CityMasterDao dao=new CityMasterDao();
boolean flag=dao.UpdateCityMaster(form);
if(flag)
{
target="ViewCityMaster.jsp?status=Updation success";
}
}
catch(Exception e)
{
e.printStackTrace();
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);
%>