 
<%@page import="com.yourcompany.struts.form.BillMasterForm"%>
<%@page import="com.iebms.dao.BillMasterDao"%>

<%
String target="ViewBillMaster.jsp?status=Updation failed";
try
{
BillMasterForm form=new BillMasterForm();
form.setBillId(Integer.parseInt(request.getParameter("BillId")));
form.setBillDate(request.getParameter("billDate"));
form.setUserId(Integer.parseInt(request.getParameter("UserId")));
form.setBillNo(request.getParameter("billNo"));
form.setServiceNo(request.getParameter("serviceNo"));
form.setNoOfUnits(Integer.parseInt(request.getParameter("noOfUnits")));
form.setAmount(Integer.parseInt(request.getParameter("amount")));
form.setEmployeId(Integer.parseInt(request.getParameter("employeId")));
BillMasterDao dao=new BillMasterDao();
boolean flag=dao.UpdateBillMaster(form);
if(flag)
{
target="ViewBillMaster.jsp?status=Updation Success";
}
}
catch(Exception e)
{
e.printStackTrace();
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);
%>
 