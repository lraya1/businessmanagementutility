
<%@page import="com.iebms.dao.CourierDetailsDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.CourierDetailsForm"%>
<form action="DeleteCourierMaster.jsp">
	<%
		try {
			String report = "";

			CourierDetailsDao dao = new CourierDetailsDao();
			CoreList cl = dao.ViewCourierDetails();
			Enumeration en = cl.elements();
	%>
	<table align="center" border=1>
		<tr>
			<td>
				<input type=checkbox name="TypeId">
			</td>
			<td>
				CourierId
			</td>
			<td>
				ItemId
			</td>
			<td>
				AmtCharged
			</td>
		</tr>
		<%
			report += "<table align=center border=1><tr bgcolor=#666666><td><div align=center><font color=white><b>CourierDate</b></font></div></td>           <td><div align=center><font color=white><b>FromCountry</b></font></div></td>  <td><div align=center><font color=white><b>ToCoiuntry</b></font></div></td>    <td><div align=center><font color=white><b>FromCity</b></font></div></td>     <td><div align=center><font color=white><b>ToCity</b></font></div></td>       <td><div align=center><font color=white><b>CourierAmt</b></font></div></td>     <td><div align=center><font color=white><b>CourierDetails</b></font></div></td><td><div align=center><font color=white><b>Status</b></font></div></td></tr>";

				while (en.hasMoreElements()) {
					CourierDetailsForm form = (CourierDetailsForm) en
							.nextElement();
					report += "</table>";
					session.setAttribute("Report", report);
		%>
		<tr>
			<td>
				<input type=checkbox name="TypeId" value="<%=form.getCourierId()%>">
			</td>
			<td align="center"><%=form.getCourierId()%></td>
			<td align="center"><%=form.getItemId()%></td>
			<td align="center"><%=form.getAmtCharged()%></td>
		</tr>

		<%
			}
				report += "</table>";
				session.setAttribute("Report", report);
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	<center>
		<input type=submit name="Delete" value="Delete">
	</center>
</form>