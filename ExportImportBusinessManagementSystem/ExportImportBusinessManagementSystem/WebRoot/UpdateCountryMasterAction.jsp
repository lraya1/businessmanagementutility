 
 
  
<%@page import="com.yourcompany.struts.form.CountryMasterForm"%>
<%@page import="com.iebms.dao.CountryMasterDao"%> 
 
 <%
 String target="ViewCountryMaster.jsp?status=Updation failed";
 try
 {
 CountryMasterForm form=new CountryMasterForm();
 form.setCountryId(Integer.parseInt(request.getParameter("countryId")));
 form.setCountryName(request.getParameter("countryName"));
 form.setDescription(request.getParameter("description"));
 form.setCountryArea(Integer.parseInt(request.getParameter("countryArea")));
 form.setAbbr(request.getParameter("abbr"));
 form.setCountryMap(request.getParameter("countryMap"));
 CountryMasterDao dao=new CountryMasterDao();
 boolean flag=dao.UpdateCountryMaster(form);
 if(flag)
 {
 target="ViewCountryMaster.jsp?status=Updation success";
 }
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 RequestDispatcher rd=request.getRequestDispatcher(target);
 rd.forward(request,response);
 %>
 