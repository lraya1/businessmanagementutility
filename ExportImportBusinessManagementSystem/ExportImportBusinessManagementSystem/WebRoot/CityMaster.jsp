<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="com.iebms.dao.CountryMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.CountryMasterForm"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html>
	<head>
		<script language="JavaScript" src="scripts/gen_validatorv31.js"
			type="text/javascript">
</script>
		<script language="JavaScript" type="text/javascript"
			src="scripts/ts_picker.js">
</script>
		<script language="JavaScript1.1" src="scripts/pass.js">

</script>
		<script type="text/javascript" src="scripts/image.js">
</script>
		<script type="text/javascript" src="scripts/general.js">
</script>
		<script type="text/javascript" src="scripts/adi.js">
</script>
		<script type="text/javascript" src="scripts/form_validation.js">
</script>

		<style>
body,td,th {
	color: white;
	;
}

.style9 {
	    color: black
}

body {
	background-color: white;
}
</style>

		<title>ImportExportBusinessManagementSystem</title>
		<script type="text/javascript" src="scripts/moveclock.js">
</script>

		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />
	</head>
	<body>
		<table width="750" align="center" bgcolor="white">
			<tr>
				<td>
					<img src="images/goods.jpg" width="780" height="230">
				</td>
			</tr>
			<tr>
				<td bgcolor="skyblue">
					<jsp:include page="Adminoptions.jsp" />
				</td>
			</tr>
			<tr>
				<td>
					<%--<div align="center">--%>
					<%--<table bgcolor="white" width="750" align="center">--%>
					<%--<tr>--%>
					<%--   <td><jsp:include page="Template.html"/></td></tr></table></div>--%>
					<div align="center">
						<table bgcolor="white" width="770" align="center" height="70">
							<tr>
								<td>
									
									<font color="skyblue"><h1>
											<br>
										</h1>
									 
										
									<p align="center">

										<center>
											<h2>
												<font color="black"> City Registeration Form</font>
											</h2>
										</center>
										<%
											if (request.getParameter("status") != null) {
										%>
										<%=request.getParameter("status")%>
										<%
											}
										%>
										<form action="cityAction.do" name="register">
											<table align="center">
												<tr>
													<td bordercolor="#666633" bgcolor="white">
														<font color="black" size="4"><b>Country Name :
														</b>
														</font>
													</td>
													<td bgcolor="white">
														<select name="countryId">
															<option value="">
																----Select Any One--
															</option>
															<%
																String storepath = request.getRealPath("/images");
																CountryMasterDao dao = new CountryMasterDao();
																CoreList cl = dao.ViewCountryMaster(storepath);
																Enumeration en = cl.elements();
																while (en.hasMoreElements()) {
																	CountryMasterForm form = (CountryMasterForm) en.nextElement();
															%>
															<option value="<%=form.getCountryId()%>"><%=form.getCountryName()%></option>
															<%
																}
															%>
														</select>
													</td>
												</tr>
												<tr>
													<td bordercolor="#666633" bgcolor="white">
														<font color="black" size="4"><b>City Name :</b>
														</font>
													</td>
													<td bgcolor="white">
														<input type=text name="cityName" />
													</td>
												</tr>
												<tr>
													<td bordercolor="#666633" bgcolor="white">
														<font color="black" size="4"><b>Zip code :</b>
														</font>
													</td>
													<td bgcolor="white">
														<input type=text name="abbr" />
													</td>
												</tr>

												<!--<tr>
													<td bordercolor="#666633" bgcolor="white">
														<font color="black" size="4"><b>City Map :</b>
														</font>
													</td>
													<td bgcolor="white">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type=file name="cityMap" />
													</td>
												</tr>
												--><tr>
													<td bordercolor="#666633" bgcolor="white">
														<font color="black" size="4"><b>State :</b>
														</font>
													</td>
													<td bgcolor="white">
														<input type=text name="description" />
													</td>
												</tr>
												<tr>
													<td bgcolor="white"></td>
													<td bgcolor="white">
														<input type=submit name="Register" value="Register" />
													</td>
												</tr>
											</table>
										</form>
										<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
var frmvalidator = new Validator("register");

frmvalidator.addValidation("countryId", "dontselect=0");
frmvalidator.addValidation("cityName", "req", "Please enter City Name");
frmvalidator.addValidation("cityMap", "req", "Please enter City Map");

frmvalidator.addValidation("abbr", "numaric", "Please enter City Abbrivation");
frmvalidator.addValidation("description", "req",
		"Please enter City Description");
</script>
								</td>
							</tr>
						</table>
						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>

						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>

						<p>
							&nbsp;
						</p>



						<p>
							&nbsp;
						</p>
					</div>
	</body>
</html>