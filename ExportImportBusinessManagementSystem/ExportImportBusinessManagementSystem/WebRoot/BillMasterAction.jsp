
<%@page import="com.yourcompany.struts.form.BillMasterForm"%>
<%@page import="com.iebms.dao.BillMasterDao"%>
<%
String target="BillMaster.jsp?status=Registration failed";
try
{
BillMasterForm form=new BillMasterForm();
form.setBillDate(request.getParameter("billDate"));
form.setUserId(Integer.parseInt(request.getParameter("UserId")));
form.setBillNo(request.getParameter("billNo"));
form.setServiceNo(request.getParameter("serviceNo"));
form.setNoOfUnits(Integer.parseInt(request.getParameter("noOfUnits")));
form.setAmount(Integer.parseInt(request.getParameter("amount")));
form.setEmployeId(Integer.parseInt(request.getParameter("employeId")));
BillMasterDao dao=new BillMasterDao();
boolean flag=dao.insertBillMaster(form);
if(flag)
{
target="BillMaster.jsp?status=Registration Success";
}
}
catch(Exception e)
{
e.printStackTrace();
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);
%>
