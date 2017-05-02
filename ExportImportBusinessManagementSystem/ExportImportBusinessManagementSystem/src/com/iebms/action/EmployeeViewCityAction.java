/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.iebms.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.iebms.dao.CityMasterDao;
import com.iebms.util.CoreList;
import com.yourcompany.struts.form.CityMasterForm;

/** 
 * MyEclipse Struts
 *  
 * 
 * XDoclet definition:
 * @struts.action path="/viewCityAction" name="CityMasterForm" scope="request"
 */
public class EmployeeViewCityAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		try{
		CityMasterForm CityMasterForm = (CityMasterForm) form;// TODO Auto-generated method stub
	String storepath=request.getRealPath("/images");
		CityMasterDao dao=new CityMasterDao();
		CoreList cl=dao.ViewCityMaster(storepath);
int n=cl.size();
if(n!=0)
{
	request.setAttribute("viewCitys",cl);
	return mapping.findForward("viewCitys");
}
	}catch (Exception e) {
		// TODO: handle exception
	}
	return mapping.findForward("norecords");
}
}