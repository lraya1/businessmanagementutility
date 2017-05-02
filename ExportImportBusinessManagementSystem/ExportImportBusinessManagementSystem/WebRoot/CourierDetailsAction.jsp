<%@page import="com.yourcompany.struts.form.CourierDetailsForm"%>
<%@page import="com.iebms.dao.CourierDetailsDao"%> 
 <%
 String target="CourierDetails.jsp?status=Registration failed";
 try
 {
 CourierDetailsForm form=new CourierDetailsForm();
 form.setCourierId(Integer.parseInt(request.getParameter("courierId")));
 form.setItemId(Integer.parseInt(request.getParameter("itemId")));
 form.setAmtCharged(request.getParameter("amtCharged"));
 CourierDetailsDao dao=new CourierDetailsDao();
 boolean flag=dao.insertCourierDetails(form);
 if(flag)
 {
 target="CourierDetails.jsp?status=ReGistration Success";
 }
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 RequestDispatcher rd=request.getRequestDispatcher(target);
 rd.forward(request,response);
 %>
 