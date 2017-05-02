
<%@page import="com.iebms.dao.BillMasterDao"%>
<%@page import="com.yourcompany.struts.form.BillMasterForm"%>
<%@page import="com.iebms.dao.ProfileDAO"%>
<%@page import="com.iebms.model.Profile"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%
int id=Integer.parseInt(request.getParameter("Id"));
BillMasterDao dao=new BillMasterDao();
BillMasterForm form=dao.ViewBillMasterById(id);
%>
<form action="UpdateBillMasterAction.jsp"><table align="center">
			<tr><td>BillId:</td><td><input type=text name="BillId" value="<%=id %>"></td>
			<tr><td>ServiceNo : </td><td><input type=text name="serviceNo" value="<%=form.getServiceNo() %>"/></td></tr> 
			<tr><td>Amount : </td><td><input type=text name="amount" value="<%=form.getAmount() %>"/> </td></tr>
			<tr><td>UserId:</td><td><select name="UserId">
			<%
			ProfileDAO dao3=new ProfileDAO();
			Profile model3=null;
			CoreList cl3=dao3.getuserdetails();
			Enumeration en3=cl3.elements();
			while(en3.hasMoreElements())
			{
			model3=(Profile)en3.nextElement();
		 
			%>
			<option value="<%=model3.getUserid() %>"><%=model3.getLoginID() %></option>
			 <%} %>
			</select></td></tr>
			 
			<tr><td>EmployeId : </td><td><select name="employeId"/> 
			<%
			String storepath=request.getRealPath("/images");
			EmployeMasterDao dao1=new EmployeMasterDao();
			CoreList cl1=dao1.ViewEmployeMaster(storepath);
			Enumeration en1=cl1.elements();
			while(en1.hasMoreElements())
			{EmployeMasterForm form1=(EmployeMasterForm)en1.nextElement(); 
			 %>
			 
			 <option value="<%=form1.getEmployeId() %>"><%=form1.getEmployeFirstName() %></option>
			 <%} %></select></td></tr>
			<tr><td>NoOfUnits : </td><td><input type=text name="noOfUnits" value="<%=form.getNoOfUnits() %>"/> </td></tr>
			<tr><td>BillDate : </td><td><input type=text name="billDate" value="<%=form.getBillDate() %>"/></td></tr>
			<tr><td>BillNo : </td><td><input type=text name="billNo" value="<%=form.getBillNo() %>"/></td></tr>
			<tr><td></td><td><input type=submit name="Update" value="Update"/> </td></tr></table>
		</form>