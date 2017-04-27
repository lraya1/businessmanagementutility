
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%> 
 
 <%
 String target="EmployeMaster.jsp?status=Registration Failed";
 try
 {
 EmployeMasterForm form=new EmployeMasterForm();
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
 boolean flag=dao.insertEmployeMaster(form);
 if(flag)
 {
 target="EmployeMaster.jsp?status=Registration success";
 }
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 RequestDispatcher rd=request.getRequestDispatcher(target);
 rd.forward(request,response);
 %>