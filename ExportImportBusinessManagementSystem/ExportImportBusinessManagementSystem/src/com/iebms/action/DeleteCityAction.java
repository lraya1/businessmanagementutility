/*
w * Generated by MyEclipse Struts
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

/** 
 * MyEclipse Struts
 *  
 * 
 * XDoclet definition:
 * @struts.action
 */
public class DeleteCityAction extends Action {
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
		try
		 {
		 String id[]=request.getParameterValues("TypeId");
		 for(int i=0;i<id.length;i++)
		 {
		 int Id=Integer.parseInt(id[i]);
		 CityMasterDao dao=new CityMasterDao();
		 boolean flag=dao.deleteCityMaster(Id);
		 if(flag)
		 {
		return mapping.findForward("deleteSuccess");
		 
		 }
		 }
		 }
		 
		 catch(Exception e)
		 {
		 e.printStackTrace();
		 }
		 return mapping.findForward("deleteFail");
	}
}