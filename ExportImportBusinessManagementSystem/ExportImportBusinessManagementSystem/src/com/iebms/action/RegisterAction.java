package com.iebms.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iebms.dao.ProfileDAO;
import com.iebms.model.Profile;

public class RegisterAction extends HttpServlet {

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

		String target="Registerform.jsp?status=Registration Failed"; 
		try{
		 Profile rb = new Profile(); 
	    rb.setPhoto(request.getParameter("photo"));
        rb.setFirstName(request.getParameter("fname")); 
        rb.setLastName(request.getParameter("lname")); 
        rb.setBirthDate(request.getParameter("dob")); 
        rb.setEmail(request.getParameter("email"));
        rb.setFax(request.getParameter("fax"));
        //home
        String home=request.getParameter("addressType");
        if(home!=null)
        {
        rb.setHome(home);	
        rb.setHno(request.getParameter("houseNo"));
        rb.setStreet(request.getParameter("street"));
        rb.setCity(request.getParameter("city")); 
        rb.setState(request.getParameter("state")); 
        rb.setCountry(request.getParameter("country"));
        rb.setPin(request.getParameter("pin"));
        rb.setPhone(request.getParameter("phoneNo"));
        rb.setHomePhoneType(request.getParameter("homephonetype"));
        }
        //office
        String office=request.getParameter("office");
        if(office!=null)
        {
        rb.setOffice(office);	
        rb.setOhno(request.getParameter("ohno"));
        rb.setOstreet(request.getParameter("ostreet"));
        rb.setOcity(request.getParameter("ocity")); 
        rb.setOstate(request.getParameter("ostate")); 
        rb.setOcountry(request.getParameter("ocountry"));
        rb.setOpin(request.getParameter("opin"));
        rb.setOphone(request.getParameter("ophoneno"));
        rb.setOfficePhoneType(request.getParameter("officephonetype"));
        
        }
        //contact
        String contact=request.getParameter("contact");
        if(contact!=null)
        {
       	rb.setContact(contact);	
        rb.setChno(request.getParameter("chno"));
        rb.setCstreet(request.getParameter("cstreet"));
        rb.setCcity(request.getParameter("ccity")); 
        rb.setCstate(request.getParameter("cstate")); 
        rb.setCcountry(request.getParameter("ccountry"));
        rb.setCpin(request.getParameter("cpin"));
        rb.setCphone(request.getParameter("cphoneno"));
        rb.setPersonalPhoneType(request.getParameter("personalphonetype"));
        }
        
       // rb.setStatus(1); 
        //rb.setFirstLogin(0); 
        rb.setLoginID(request.getParameter("userName")); 
        rb.setLoginType("customer"); 
        rb.setPassword(request.getParameter("password")); 
        String questid=""; 
        if(request.getParameter("ch")!=null) 
        { 
           // rb.setSecretQuestionID(questid); 
            rb.setSecretQuestionID(request.getParameter("ownquest")); 
        } 
        else 
        { 
            questid=request.getParameter("squest"); 
            rb.setSecretQuestionID(questid); 
            rb.setOwnSecretQuestion("Not Mentioned"); 
        } 
        rb.setSecretAnswer(request.getParameter("sanswer")); 
        rb.setLocale(request.getLocale().toString()); 
        boolean flag=new ProfileDAO().registration(rb);
        
        if(flag) 
           target = "Registerform.jsp?status=Registration Success"; 
        else  
            target = "Registerform.jsp?status=Registration Failed"; 
            }catch(Exception e){e.printStackTrace();}
        RequestDispatcher rd = request.getRequestDispatcher(target);
        rd.forward(request,response);
	}

}
