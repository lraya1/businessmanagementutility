package com.iebms.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.iebms.dao.SecurityDAO;
import com.iebms.model.Profile;

public class CustomerChangePassword extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
try{
	
		Profile rb=new Profile(); 
    rb.setPassword(request.getParameter("oldpassword")); 
    rb.setLoginID(request.getParameter("username")); 
    rb.setNewPassword(request.getParameter("newpassword")); 
     
    boolean flag=new SecurityDAO().changePassword(rb); 
     
    if(flag) 
    {
     return mapping.findForward("changeSuccess");
}
    }catch (Exception e) {
	e.printStackTrace();
	// TODO: handle exception
} return mapping.findForward("changeFail");

}
}
