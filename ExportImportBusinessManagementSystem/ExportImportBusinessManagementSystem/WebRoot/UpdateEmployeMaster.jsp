
<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%@page import="com.iebms.dao.ProfileDAO"%>
<%@page import="com.iebms.model.Profile"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%
String storepath=request.getRealPath("/images");
int id=Integer.parseInt(request.getParameter("Id"));
EmployeMasterDao dao=new EmployeMasterDao();
EmployeMasterForm form=dao.ViewEmployeMasterById(storepath,id);
%>
<form action="UpdateEmployeMasterAction.jsp"><table align="center">
			<tr><td>EmployeId:</td><td><input type=text name="employeId" value="<%=id %>"></td></tr>
			<tr><td>EmployeFirstName : </td><td><input type=text name="employeFirstName" value="<%=form.getEmployeFirstName() %>"/></td></tr>  
			<tr><td>EmployeMiddleName : </td><td><input type=text name="employeMiddleName" value="<%=form.getEmployeMiddleName() %>"/></td></tr> 
			<tr><td>EmployeLastName : </td><td><input type=text name="employeLastName" value="<%=form.getEmployeLastName() %>"/></td></tr> 
			<tr><td>DateOfBirth : </td><td><input type=text name="dateOfBirth" value="<%=form.getDateOfBirth() %>"/></td></tr>
			<tr><td>Phone : </td><td><input type=text name="phone" value="<%=form.getPhone() %>"/></td></tr> 
			<tr><td>UserId : </td><td><select name="UserId">
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
			
			<tr><td>DateOfJoin : </td><td><input type=text name="dateOfJoin" value="<%=form.getDateOfJoin()%>"/></td></tr>
			<tr><td>Address : </td><td><input type=text name="address" value="<%=form.getAddress()%>"/></td></tr>
			 <tr><td>Email : </td><td><input type=text name="email" value="<%=form.getEmail()%>"/></td></tr>
			<tr><td>Image : </td><td><input type=file name="image"/></td></tr>
			<tr><td></td><td><input type=submit name="Update" value="Update"/></td></tr></table>
		</form>