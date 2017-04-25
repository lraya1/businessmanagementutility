package com.iebms.control;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iebms.util.LoggerManager;

public class DispatchController extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	{
		String page = req.getParameter("page");
		try
		{
			res.sendRedirect(page);
		}
		catch (IOException ioe)
		{
			LoggerManager.writeLogInfo(ioe);
		}
	}
}
