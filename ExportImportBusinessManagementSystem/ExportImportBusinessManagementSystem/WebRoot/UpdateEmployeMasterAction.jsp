
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%> 
 
 <%
 String target="ViewEmployeMaster.jsp?status=Updation Failed";
 try
 {
 EmployeMasterForm form=new EmployeMasterForm();
 form.setEmployeId(Integer.parseInt(request.getParameter("employeId")));
 form.setEmployeFirstName(request.getParameter("employeFirstName"));
 form.setEmployeMiddleName(request.getParameter("employeMiddleName"));
 form.setEmployeLastName(request.getParameter("employeLastName"));
 form.setDateOfBirth(request.getParameter("dateOfBirth"));
 form.setDateOfJoin(request.getParameter("dateOfJoin"));
 form.setAddress(request.getParameter("address"));
 form.setPhone(request.getParameter("phone"));
 form.setEmail(request.getParameter("email"));
 form.setImage(request.getParameter("image"));
 form.setUserId(Integer.parseInt(request.getParameter("UserId")));
 EmployeMasterDao dao=new EmployeMasterDao();
 boolean flag=dao.UpdateEmployeMaster(form);
 if(flag)
 {
 target="ViewEmployeMaster.jsp?status=Updation success";
 }
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 RequestDispatcher rd=request.getRequestDispatcher(target);
 rd.forward(request,response);
 %>