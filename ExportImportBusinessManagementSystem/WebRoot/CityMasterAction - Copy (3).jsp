
<%@page import="com.yourcompany.struts.form.CityMasterForm"%>
<%@page import="com.iebms.dao.CityMasterDao"%>
<%
String target="CityMaster.jsp?status=Registration failed";
try
{
CityMasterForm form=new CityMasterForm();
form.setCityName(request.getParameter("cityName"));
form.setAbbr(request.getParameter("abbr"));
form.setCityMap(request.getParameter("cityMap"));
form.setDescription(request.getParameter("description"));
form.setCountryId(Integer.parseInt(request.getParameter("countryId")));
CityMasterDao dao=new CityMasterDao();
boolean flag=dao.insertCityMaster(form);
if(flag)
{
target="CityMaster.jsp?status=Registration success";
}
}
catch(Exception e)
{
e.printStackTrace();
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);
%>