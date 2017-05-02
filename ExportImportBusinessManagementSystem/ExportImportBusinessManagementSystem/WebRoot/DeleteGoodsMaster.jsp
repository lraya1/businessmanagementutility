
<%@page import="com.iebms.dao.GoodsMasterDao"%>

<%
	String target = "ViewGoodsMaster.jsp?status=Deletion failed";
	try {
		String id[] = request.getParameterValues("TypeId");
		for (int i = 0; i < id.length; i++) {
			int Id = Integer.parseInt(id[i]);
			GoodsMasterDao dao = new GoodsMasterDao();
			boolean flag = dao.deleteGoodsMaster(Id);
			if (flag) {
				target = "ViewGoodsMaster.jsp?status=Deletion success";
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	RequestDispatcher rd = request.getRequestDispatcher(target);
	rd.forward(request, response);
%>
