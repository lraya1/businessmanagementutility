<%@page import="com.iebms.dao.GoodsMasterDao"%>
<%@page import="com.yourcompany.struts.form.GoodsMasterForm"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html>
	<head>
		<style>
body,td,th {
	color: white;
	;
}

body {
	background-color: white;
}
</style>
		<title>ExportImportBusinessManagementSystem</title>
		<script type="text/javascript" src="scripts/moveclock.js">
</script>

		<script type="text/javascript">
function validate() {
	var form = document.register
	if (form.userName.value == "") {
		alert("User Name is Required");
		return false;
	} else if (form.password.value == "") {
		alert("Pass Word is Required");
		return false;
	}
	return true;
}
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
					<jsp:include page="./Header.jsp" />
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



											<table bgcolor="white">
												<tr>
													<td>

														<center>
															<h2>
																<font color="black"><b><u>Update Goods
																			Master</u> </b>
																</font>
															</h2>
															<%
																try {
																	int id = Integer.parseInt(request.getParameter("Id"));
																	GoodsMasterDao dao = new GoodsMasterDao();
																	GoodsMasterForm form = dao.ViewGoodsMasterById(id);
															%>
															<form action="updateGoodsAction.do">
																<table align="center" bordercolor="#6666FF"
																	bgcolor="white">
																	<tr>
																		<td>
																			<input type=hidden name="goodsId" value="<%=id%>" />
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<font color="black"><b>Goods Name :</b>
																			</font>
																		</td>
																		<td>
																			<input type=text name="goodsName"
																				value="<%=form.getGoodsName()%>" />
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<font color="black"><b>Goods Description :</b>
																			</font>
																		</td>
																		<td>
																			<textarea name="goodsDesc"><%=form.getGoodsDesc()%></textarea>
																		</td>
																	</tr>
																	<tr>
																		<td></td>
																		<td>
																			<input type=submit name="Update" value="Update" />
																		</td>
																	</tr>
																</table>
																<%
																	} catch (Exception e) {
																		e.printStackTrace();
																	}
																%>
															</form>
														</center>



													</td>
												</tr>
											</table>
								</td>
							</tr>
						</table>
						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>
					</div>
	</body>
</html>