
<%@page import="com.iebms.dao.OrderShipmentMasterDao"%>
<%@page import="com.yourcompany.struts.form.OrderShipmentMasterForm"%>
<%@page import="com.iebms.dao.ProfileDAO"%>
<%@page import="com.iebms.model.Profile"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%
int id=Integer.parseInt(request.getParameter("Id"));
OrderShipmentMasterDao dao=new OrderShipmentMasterDao();
OrderShipmentMasterForm form=dao.ViewOrderShipmentMasterById(id);
%>
<form action="UpdateOrderShipmentMasterAction.jsp">
		<table align="center">
			<tr><td>ShipmentId:</td><td><input type=text name="ShipId" value="<%=id %>"></td></tr>
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
		 
			<tr><td>ShipmentInchargeEmpId : </td><td><select name="shipmentInchargeEmpId"/> 
			<%
			String storepath=request.getRealPath("/images");
			EmployeMasterDao dao2=new EmployeMasterDao();
			CoreList cl2=dao2.ViewEmployeMaster(storepath);
			Enumeration en2=cl2.elements();
			while(en2.hasMoreElements())
			{EmployeMasterForm form2=(EmployeMasterForm)en2.nextElement(); 
			 %>
			 
			 <option value="<%=form2.getEmployeId() %>"><%=form2.getEmployeFirstName() %></option>
			 <%} %></select></td></tr>
			</select></td></tr> 
			<tr><td>ShipmentDate : </td><td><input type=text name="shipmentDate" value="<%=form.getShipmentDate() %>"/></td></tr>-->
			<tr><td>ShipmentStatus : </td><td><input type=text name="shipmentStatus" value="<%=form.getShipmentStatus() %>"/></td></tr>
			 
			
			<tr><td>CustomerFeedBack : </td><td><input type=text name="customerFeedBack" value="<%=form.getCustomerFeedBack() %>"/></td></tr>
			<tr><td></td><td><input type=submit name="Update" value="Update"/></td></tr></table>
		</form>