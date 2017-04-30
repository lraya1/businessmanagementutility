
<%@page import="com.yourcompany.struts.form.GoodsMasterForm"%>
<%@page import="com.iebms.dao.GoodsMasterDao"%> 
 
 
 
 <%
     	String target="GoodsMaster.jsp?status=Registration failed";
           try
           {
           GoodsMasterForm form=new GoodsMasterForm();
           form.setGoodsName(request.getParameter("goodsName"));
           form.setGoodsDesc(request.getParameter("goodsDesc"));
           GoodsMasterDao dao=new GoodsMasterDao();
           boolean flag=dao.insertGoodsMaster(form);
           if(flag)
           {
           target="GoodsMaster.jsp?status=Registration success";
           }
           }
           catch(Exception e)
           {
           e.printStackTrace();
           }
           RequestDispatcher rd=request.getRequestDispatcher(target);
           rd.forward(request,response);
          
     %>

 