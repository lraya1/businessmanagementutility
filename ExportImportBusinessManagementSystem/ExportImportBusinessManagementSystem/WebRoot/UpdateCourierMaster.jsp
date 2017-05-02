
<%@page import="com.iebms.dao.CourierMasterDao"%>
<%@page import="com.yourcompany.struts.form.CourierMasterForm"%>
<%@page import="com.iebms.dao.CityMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.CityMasterForm"%>
<%@page import="com.iebms.dao.ProfileDAO"%>
<%@page import="com.iebms.model.Profile"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%@page import="com.iebms.dao.CountryMasterDao"%>
<%@page import="com.yourcompany.struts.form.CountryMasterForm"%>
<%
int id=Integer.parseInt(request.getParameter("Id"));
CourierMasterDao dao=new CourierMasterDao();
CourierMasterForm form=dao.ViewCourierMasterById(id);
%>
<form action="UpdateCourierMasterAction.jsp"><table align="center">
			<tr><td>CourierId:</td><td><input type=text name="courierId" value="<%=id %>"></td>
			<tr><td>FromCityId : </td><td><select name="fromCityId"/>  
			<%String storepath=request.getRealPath("/images");
			CityMasterDao dao2=new CityMasterDao();
			CoreList cl2=dao2.ViewCityMaster(storepath);
			Enumeration en2=cl2.elements();
			while(en2.hasMoreElements())
			{
			CityMasterForm form1=(CityMasterForm)en2.nextElement();
			%>
			<option value="<%=form1.getCityId() %>"><%=form1.getCityName() %></option>
			<%}%></select></td></tr>
			
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
			<tr><td>EmployeId : </td><td><select name="employeId"/> 
			<%EmployeMasterDao dao7=new EmployeMasterDao();
			CoreList cl7=dao7.ViewEmployeMaster(storepath);
			Enumeration en7=cl7.elements();
			while(en7.hasMoreElements())
			{
			EmployeMasterForm form7=(EmployeMasterForm)en7.nextElement(); 
			 %>
			 
			 <option value="<%=form7.getEmployeId()%>"><%=form7.getEmployeFirstName()%></option>
			 <%} %></select></td></tr>
			<tr><td>CourierDet : </td><td><input type=text name="courierDet" value="<%=form.getCourierDet() %>"/> </td></tr>
			<tr><td>ToCityId : </td><td><select name="toCityId"/> 
			<%CityMasterDao dao4=new CityMasterDao();
			CoreList cl4=dao4.ViewCityMaster(storepath);
			Enumeration en4=cl4.elements();
			while(en4.hasMoreElements())
			{
			CityMasterForm form3=(CityMasterForm)en4.nextElement();
			%>
			<option value="<%=form3.getCityId() %>"><%=form3.getCityName() %></option>
			<%} %></select></td></tr>
			<tr><td>FromCountryId : </td><td><select name="fromCountryId"/> 
			<%CountryMasterDao dao5=new CountryMasterDao();
			CoreList cl5=dao5.ViewCountryMaster(storepath);
			Enumeration en5=cl5.elements();
			while(en5.hasMoreElements())
			{
			CountryMasterForm form5=(CountryMasterForm)en5.nextElement();
			%>
			<option value="<%=form5.getCountryId() %>"><%=form5.getCountryName() %></option>
			<%} %></select></td></tr>
			<tr><td>CourierAmt : </td><td><input type=text name="courierAmt" value="<%=form.getCourierAmt() %>"/> </td></tr>
			<tr><td>ToCountryId : </td><td><select name="toCountryId"/>  
			<%CountryMasterDao dao6=new CountryMasterDao();
			CoreList cl6=dao6.ViewCountryMaster(storepath);
			Enumeration en6=cl6.elements();
			while(en6.hasMoreElements())
			{
			CountryMasterForm form6=(CountryMasterForm)en6.nextElement();
			%>
			<option value="<%=form6.getCountryId() %>"><%=form6.getCountryName() %></option>
			<%} %></select></td></tr>
		 	<tr><td>courierDate : </td><td><input type=text name="courierDate" value="<%=form.getCourierDate() %>"/> </td></tr>
			<tr><td></td><td><input type=submit name="Register" value="Register"/> </td></tr></table>
		</form>
