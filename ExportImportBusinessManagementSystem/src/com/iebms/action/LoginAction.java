package com.iebms.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iebms.dao.SecurityDAO;
import com.iebms.model.Profile;

public class LoginAction extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "index.jsp?status=Invalid username and password";
		try
		{HttpSession session=request.getSession();
			Profile rb = new Profile();
			String username = request.getParameter("username");
			rb.setLoginID(username);
			rb.setPassword(request.getParameter("password"));
             
			String role = new SecurityDAO().loginCheck(rb);
int userid=new SecurityDAO().getUserid(username);
			if (role.equals("Admin"))
			{
				target = "adminhome.jsp?status=Welcome " + username;
				session.setAttribute("user", username);
				session.setAttribute("role", role);
			}
			else if (role.equals("user"))
			{
				
					target = "userhome.jsp?status=Welcome " + username;
				
					target = "userhome.jsp?status=Welcome " + username;
				session.setAttribute("user", new Integer(userid));
				session.setAttribute("username", username);
				session.setAttribute("role", role);
			}
			else
				target = "index.jsp?status=Invalid username and password";
		}
		catch (Exception e)
		{
		}
		RequestDispatcher rd = request.getRequestDispatcher(target);
		rd.forward(request, response);
	}

}
