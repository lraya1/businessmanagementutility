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

import com.iebms.dao.GoodsDetailsDao;
import com.yourcompany.struts.form.GoodsDetailsForm;

/** 
 * MyEclipse Struts
 *  
 * 
 * XDoclet definition:
 * @struts.action path="/GoodsDetailsAction" name="GoodsDetailsForm" scope="request"
 */
public class GoodsDetailsAction extends Action {
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
		GoodsDetailsForm goodsDetailsForm = (GoodsDetailsForm) form;// TODO Auto-generated method stub
		GoodsDetailsDao aDao=new GoodsDetailsDao();
		boolean flag=aDao.insertGoodsDetails(goodsDetailsForm);
		if(flag)
		{
			return mapping.findForward("registerSuccess");
		}
	}catch (Exception e) {
		// TODO: handle exception
	}return mapping.findForward("registerFail");
}
}