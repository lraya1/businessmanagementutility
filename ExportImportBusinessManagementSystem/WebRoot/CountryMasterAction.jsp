
<%@page import="com.yourcompany.struts.form.CountryMasterForm"%>
<%@page import="com.iebms.dao.CountryMasterDao"%> 
 
 <%
 String target="CountryMaster.jsp?status=Registration failed";
 try
 {
 CountryMasterForm form=new CountryMasterForm();
 form.setCountryName(request.getParameter("countryName"));
 form.setDescription(request.getParameter("description"));
 form.setCountryArea(Integer.parseInt(request.getParameter("countryArea")));
 form.setAbbr(request.getParameter("abbr"));
 form.setCountryMap(request.getParameter("countryMap"));
 CountryMasterDao dao=new CountryMasterDao();
 boolean flag=dao.insertCountryMaster(form);
 if(flag)
 {
 target="CountryMaster.jsp?status=Registration success";
 }
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 RequestDispatcher rd=request.getRequestDispatcher(target);
 rd.forward(request,response);
 %>
 