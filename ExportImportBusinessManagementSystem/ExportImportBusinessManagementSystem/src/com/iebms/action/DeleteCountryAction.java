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

import com.iebms.dao.CountryMasterDao;

/** 
 * MyEclipse Struts
 *  
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class DeleteCountryAction extends Action {
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
		// TODO Auto-generated method stub
	try{
		String id[]=request.getParameterValues("TypeId");
		for(int i=0;i<id.length;i++)
		{
		int country=Integer.parseInt(id[i]);
		CountryMasterDao dao=new CountryMasterDao();
		boolean flag=dao.deleteCountryMaster(country);
	if(flag)
	{
		return mapping.findForward("deleteSuccess");
	}
		}}catch (Exception e) {
			// TODO: handle exception
		}return mapping.findForward("deleteFail");
	}
}