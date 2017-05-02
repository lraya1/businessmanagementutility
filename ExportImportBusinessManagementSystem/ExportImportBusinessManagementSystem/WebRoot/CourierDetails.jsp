<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="com.iebms.dao.CourierMasterDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="com.iebms.dao.GoodsDetailsDao"%>
<%@page import="com.yourcompany.struts.form.GoodsDetailsForm"%>
<%@page import="com.yourcompany.struts.form.CourierMasterForm"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>

<html>
	<head>
		<title>JSP for CourierDetailsForm form</title>
	</head>
	<%
		if(request.getParameter("status")!=null){
	%>
	<%=request.getParameter("status")%>
	<%
		}
	%>
	<body>
		<form action="CourierDetailsAction.jsp">
			<table align="center">
				<tr>
					<td>
						AmtCharged:
					</td>
					<td>
						<input type=text name="amtCharged" />
					</td>
				</tr>
				<tr>
					<td>
						itemId :
					</td>
					<td>
						<select name="itemId" />
							<%
				String storepath=request.getRealPath("/images");
				GoodsDetailsDao dao2=new GoodsDetailsDao();
				CoreList cl2=dao2.ViewGoodsDetails(storepath);
				Enumeration en2=cl2.elements();
				while(en2.hasMoreElements())
				{
				GoodsDetailsForm form2=(GoodsDetailsForm)en2.nextElement();
			 
			%><option value="<%=form2.getItemId()%>"><%=form2.getItemName()%></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						CourierId:
					</td>
					<td>
						<select name="courierId" />
							<%CourierMasterDao dao=new CourierMasterDao();
			CoreList cl=dao.ViewAllCourierDetails();
			Enumeration en=cl.elements(); 
			while(en.hasMoreElements())
			{
			CourierMasterForm form=(CourierMasterForm)en.nextElement();
			%><option value="<%=form.getCourierId() %>"><%=form.getUserId() %></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type=submit name="Register" value="Register" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

