/**
* Author 					: Sumit Sundriyal
  Date Created 				: 02/12/2006
  About 					: This method is used to get the PO Name on the basis of Pincode.
  How 						: This method is based on Ajax in which xmlHttpRequest will be generated 
    						  for the action which has been passed as an parameter of this method.    						  
  @param poid               : This variable contain the id of the post office for which name to be search;
  @param textBoxTobeDisplay : Contains the name of the text box where name of the po to be shown.
  @param action				: Contains the name of the action on the basis of the that action class will 
                 		      execute the code.
  @param formName 			: Contains the name of the form in which field of post office name lying.
*/

function getPOInfo(pincode,textBoxTobeDisplay,action,formName)
{
	if(trim(pincode) != '')
	{
	var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
    var strURL=action+"?poid="+pincode;
    	//alert(""+strURL);
    var xmlReqObj;
    xmlReqObj = getXMLHttpRequest(strURL);	
    xmlReqObj.onreadystatechange = function() {	
        if (xmlReqObj.readyState == 4) {
            try{           		
				if(xmlReqObj.responseXML != null){	
				 	
				 	POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
				    POId   = (xmlReqObj.responseXML.getElementsByTagName('FPOId')[0]).firstChild.data;		    
				    if(POName != ""){		      
				      txtObj.value = POName;
				    }
				    else {
				      txtObj.value = 'Invalid Pin Code';
				    }
				 } 
				    
		    }catch( e){		 	
		      alert(' exception occurecd '+e);
		    }
        }
    }
    xmlReqObj.send(null);
    }
}
/**
  @Author : Suresh Kumar
  @Date	  : 20/07/2007
  @About  : This function work for the Delete button if record is not selected an alert will 
             pop up and also before the Delete record an alert will pop up.  
            type.
*/

function checkBoxOnListPage(frm){
			var isChecked = false;
            // skip the first (allesMarkeren) checkbox
            for (i = 0; i < frm.length; i++) {
                var element = frm.elements[i];
                if (element.type == "checkbox") {
	                if(element.checked){	                	
		        		isChecked = true;		        		
		        		break;
		        	}
	        	}
	        }
	        if(isChecked == false){
	          alert("Please select a Record first.");
	          return false;
	        }else
	        {	        
	        	return confirm('Are you sure?');
	        }
        }

/**
  @Author : Sumit Sundriyal
  @Date	  : 04/12/2006
  @About  : This function segregate the ajax function for taking the http request.
            It first check the type of implementation of httprequest on browser 
            and return the object, sets the request url in request and the content 
            type.
*/
function getXMLHttpRequest(strURL){
   var xmlRequestObj;
    // for Mozilla, Firefox, Safari
   if(window.XMLHttpRequest){
       xmlRequestObj = new XMLHttpRequest();       
    }
    // for Windows 
    else if(window.ActiveXObject){
      try{
       		xmlRequestObj = new ActiveXObject("Microsoft.XMLHTTP");
       } catch( e){         
       }
       
    }
    xmlRequestObj.open('GET', strURL, true);
	xmlRequestObj.setRequestHeader('Content-Type',"text/xml; charset=utf-8");
    return xmlRequestObj; 
}

/**

*/
function getEPostInfo(pincode,textBoxTobeDisplay,action,formName){

	if(pincode!='')
	{
	    var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
	    var strURL=action+"?poid="+pincode+"&fetchepost=true";
	    
	    var xmlReqObj;
	    xmlReqObj = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {			
			 	POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
			    POId   = (xmlReqObj.responseXML.getElementsByTagName('FPOId')[0]).firstChild.data;		    
			    if(POName != ""){		      
			      txtObj.value = POName;
			    }
			    else {
			      txtObj.value = 'Invalid Pin Code';
			    }		 	
	        }
	    }
	    xmlReqObj.send(null);
    }
  
}

/*
  This method is used to count the no of pages of for a message body.
*/

function textCounter(field,cntfield,maxlimit) 
{  
    var txtMessage 		= field.value;
    var content 		= txtMessage;
    var pageNumberCounter = 0;
    var radButton		= document.messagemasterForm.msgType[0];    
    var total 			= 0;
    var i				= 0;
    var noofwords 		= 80;
    var strspace        = "&nbsp;&nbsp;&nbsp;";
    var intLength 		= content.length;     
    var numberoflines	= 1;
    var maxfinallimit 	= 45; 
    var singleLineCharCount =0;
    var strAfterBreak = "";
    var message 		= "";  
    var noOfLinesForPageBreak = 0;     
    var firstTime = "Y";
    if(field.value==''){
      cntfield.value = '';
    }
    
    if(content == '')
    {    
        cntfield.value = '';
	  	document.messagemasterForm.msgBody.value = "";
    }
    else {
		    while (i <= intLength)
		    { 
		        if (content.substring(i,i+1) == "\n")  {            
		            numberoflines++;
		            noOfLinesForPageBreak++;
		            if(firstTime == "Y"){
			            if(noOfLinesForPageBreak == 40){
			                 firstTime = "N";
			                 // this if condition is for checking whether email radion button is checked or not
			                 // because there is no need of formatting the page for email 
			                 if(radButton != null && radButton.checked == true){
			                    message = message + strspace+content.charAt(i);			                 
			                 }
			                 else {
			                    message = message + "<br><br> <div align='center' style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px' >-- Page no "+(pageNumberCounter=pageNumberCounter + 1)+" --</div><div style='page-break-after:always'></div><br><br><br><br>"+ strspace+content.charAt(i);
			                 }
			                 noOfLinesForPageBreak = 0;                
			            }
			            else {
			                // detail written with above copy of if condition 
			            	if(radButton != null && radButton.checked == true){
			            		message = message +  "   "+content.substring(i,i+1); 	
			            	}
			            	else {
			            		message = message + "<br>"+ strspace+content.substring(i,i+1); 	
			            	}
			            }
			        }
			        else {
			          if(noOfLinesForPageBreak == maxfinallimit){
			                 if(radButton != null && radButton.checked == true){
			                 	message = message + "   "+ content.charAt(i);
			                 }
			                 else {
			                 	message = message + "<br><br><div align='center' style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px' >-- Page no "+(pageNumberCounter=pageNumberCounter + 1)+" -- </div><div style='page-break-after:always'></div><br><br><br><br>"+strspace+ content.charAt(i);
			                 }
			                 noOfLinesForPageBreak = 0;                
			            }
			            else {
			                if(radButton != null && radButton.checked == true){
			                	message = message + "   " +content.charAt(i); 	
			                }
			                else {
			            		message = message + "<br>"+ strspace+content.charAt(i); 	
			            	}
			            }
			        }
		            singleLineCharCount = 3; // because strspace spaces added before new line ;			
		        }
		        else { // if character is not a carriage return.
		        	singleLineCharCount++;
		            if(singleLineCharCount == noofwords){  
			               numberoflines++; 
			               noOfLinesForPageBreak++;  
			               //--- getting the remaining part of the word at the end of the line "start"
			               var origilen = message.length;
			               origmsg = message;
			               for(var g=message.length; g>=0; g--){
			                 if(message.charAt(g-1) == " " ){			                     
			                 	  message = message.substring(0,g);			                 	 			                 	  
			                 	  strAfterBreak = origmsg.substring(g,origmsg.length) + content.charAt(i);			                 	  
			                 	  singleLineCharCount = ((message.substring(g,message.length)).length ) + 1;			                 	  
			                 	  break;
			                 	}
			               }
			               if(firstTime == "Y"){
			                  if(noOfLinesForPageBreak == 40){
				                 firstTime = "N";
				                 if(radButton != null && radButton.checked == true){
				                 	message = message + strAfterBreak;
				                 }
				                 else {
				                 	message = message + "<br><br><div align='center' style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px' >-- Page no "+(pageNumberCounter=pageNumberCounter + 1)+" --</div><div style='page-break-after:always'></div><br><br><br><br>"+ strAfterBreak;
				                 }
				                 noOfLinesForPageBreak = 0;                
					          }
					          else {
					             if(radButton != null && radButton.checked == true){
					                message = message +  strAfterBreak; 	
					             }
					             else {
					            	message = message + "<br>"+ strAfterBreak; 	
					             }
					          }
			               }
			               else {
			               
				               if(noOfLinesForPageBreak == maxfinallimit){  
				                    if(radButton != null && radButton.checked == true){
				                      message = message + strAfterBreak;
				                    }
				                    else {                              	 
				                      message = message + "<br><br><div align='center'  style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px' >-- Page no "+(pageNumberCounter=pageNumberCounter + 1)+" -- </div><div style='page-break-after:always'></div><br><br><br><br>" + strAfterBreak;
				                    }
				                     noOfLinesForPageBreak = 0;
				               }
				               else {
				               		if(radButton != null && radButton.checked == true){
				               		   message = message + strAfterBreak;
				               		}
				               		else {
				               			message = message + "<br>" + strAfterBreak;
				               		}
				               }
			               }  
		               //--- getting the remaining part of the word at the end of the line "ends"
		            }
		            else {
		            	message = message + content.charAt(i); 
		            }
		        }
		        i++;
		    }// while end   
		    
		if(numberoflines > 40 ){			  
			  numberoflines = numberoflines - 40;
			  
			  var var1 = Math.floor(numberoflines / maxfinallimit);
			  var var2 = eval(numberoflines % maxfinallimit);
			  
			  if (var2 > 0){
		       var1= var1+1;
		       }		      
		      cntfield.value = var1+1;   
		}
		else {
		  cntfield.value = 1;
		}
	 	
	 	//document.messagemasterForm.msgBody.value = message;
	 	//message = "<pre>"+message+"</pre>";
	 	if(radButton != null && radButton.checked == true){
	 	  document.messagemasterForm.msgBody.value = message;
	 	}
	 	else {
	 	  document.messagemasterForm.msgBody.value = message+"<br><br><div align='center'  style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px' > Total Page(s) = "+cntfield.value+"  </div>";
	 	}
	 	
	}
	
		    
    
 	
}

/* 
   Date : 10/12/2006   
   What :  This method is used to check the type of extention of a file 
           which is being uploaded by user.            

*/

   var bigImage = false;
    var strImageName = "";
    var moreThanAMb = false;
    var imagesUploaded = 0;
    function checkImage(form)
    {  
      var result=false;
      var form = eval(form);      
      if(form.isUploadButtonClicked.value=="Yes" && form.theFile.value == ""){
         alert("Please select a file first and then click on Upload file button.");
         result = false;
      }
      else if(form.isUploadButtonClicked.value=="No" && form.filePresentOrNot.value == 'Yes' ){
        
         result =  true;
      }
      else if(form.isUploadButtonClicked.value=="No" && form.filePresentOrNot.value == 'No' ){
         alert("Please upload an image file using upload file button an then continue/preview. ");
         result=false;
      }
      
      else {
         var strFileName = form.theFile.value;
         strExt = strFileName.substr(strFileName.lastIndexOf("."));
	       if(strExt != ".jpg" && strExt != ".gif" && strExt != ".jpeg" && strExt!=".JPG" && strExt!=".GIF" && strExt!=".JPEG") {
		           alert("Please upload .jpg or .jpeg or .gif only");
		           result =  false;
		   }
		   else {
		    result = true;
		   }
       }
       return result; 
    }
/*
  Author : Sumit Sundriyal
  Date   : 20/12/2006
  About  : This function is used to get the information of the person whoes email id 
  		   is coming as a parameter.  		   
*/
function getEmailInfo(formName,emailId,divTobeDisplay,action,idTxtBox){     
	if(emailId != '')
	{
	    var strURL=action+"?emailid="+emailId;
	    var idTxtBox = eval('document.'+formName+'.'+idTxtBox);
	    var xmlReqObj;
	    xmlReqObj = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {	
	            userId   = (xmlReqObj.responseXML.getElementsByTagName('UserId')[0]).firstChild.data;		
			 	userName = (xmlReqObj.responseXML.getElementsByTagName('UserName')[0]).firstChild.data;		 	  		
			    userAddress   = (xmlReqObj.responseXML.getElementsByTagName('UserAddress')[0]).firstChild.data;		    
			    if(userName != "Invalid email Id"){	
			      document.getElementById(divTobeDisplay).innerHTML='Name &nbsp;&nbsp;&nbsp;&nbsp; : '+userName+ '<br>Address : '+userAddress;	      
			      idTxtBox.value=userId;
			    }
			    else {
			      document.getElementById(divTobeDisplay).innerHTML='Invalid Email Id';
			    }		 	
	        }
	    }
	    xmlReqObj.send(null);
	 }
}

/*
  Author : Mahesh Barakoti
  Date   : 
  About  : This function is used to get the list of states on the basis of country
*/
function getState(countryId,comboToBePopulate,action){
	if(countryId != '')
	{
   // var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
	    var strURL = action+"?countryId="+countryId;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);    
	   // var propObj = eval('document.prepaiduserdtlForm.'+comboToBePopulate);
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {       
	            propObj.length    = 0; 
	            propObj.options[0] = new Option("--Select--","");
	            
	        	var StateXML      = xmlReqObj.responseXML.getElementsByTagName('StateName')[0];        	
			 	stateNameAll 	  = StateXML.firstChild.data;		 	
	    		var stateName 	  = new Array();    		
				stateName 		  = stateNameAll.split(',');			
			    var StateIdXML 	  = xmlReqObj.responseXML.getElementsByTagName('StateId')[0];		    
			 	var stateIdAll    = StateIdXML.firstChild.data;
	    		var stateId       = new Array();
				stateId           = stateIdAll.split(',');
				
				
					for(var counter=1;counter<stateName.length;counter++)
					{
						propObj.options[counter] = new	Option(stateName[counter],stateId[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == "" || propObj.options[v].value == ""){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
	         }
			 	
	    }
	    xmlReqObj.send(null);
	}
  
}
function isValidPin(val)	{
       var val1 = val;
       if(val1 == ""){
         alert("Pincode can not be blank.");
         return false;
       }
       else {
           if((val1.length>0)&&(val1 .length != 6)) {
                 alert(" Please Enter a Valid Pin Code. ");
                 return false;
           }
		   for (var i = 0; i < val1.length; i++) {
			 var ch = val1.charAt(i);
			 if (ch < "0" || ch > "9") {
			  alert(" Please Enter a Valid Pin Code. ");
			  return false;
			}
		  }
	}
	return true;
}

/**
* Author 					: Sumit Sundriyal
  Date Created 				: 02/12/2006
  About 					: This method is used to get the PO Name/associated regiment List on the basis of pincode.
  How 						: If pincode is started with "9" then a popup will be open contaning all the regiment 
  							  associated with the pincode.  							
  							  This method is based on Ajax in which xmlHttpRequest will be generated 
    						  for the action which has been passed as an argument of this method.    						  
  @param poid               : This variable contain the id of the post office for which name to be search;
  @param textBoxTobeDisplay : Contains the name of the text box where name of the po to be shown.
  @param action				: Contains the name of the action on the basis of the that action class will 
                 		      execute the code.
  @param formName 			: Contains the name of the form in which field of post office name lying.
*/
function getPORegimentInfoForMessage(pincode,textBoxTobeDisplay,action,formName,receiverRegimentIdHiddenBoxName)
{
	var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
	
    var strURL=action+"?poid="+pincode;
    var xmlReqObj;
    if(isValidPin(pincode) == false){
      //alert("Please Enter Pincode.");
    }
    else if(pincode.search(/^9/) != -1){    
       var lcoat = "initfporegimentmappedlistAction.do?pincode="+pincode+"&receiverRegimentIdHiddenBoxName="+receiverRegimentIdHiddenBoxName+"&receiverPONameTxtBoxName="+textBoxTobeDisplay;
       var dimen = "top=300,left=500,height=300,width=500";       
       window.open(lcoat,"Regiments",dimen);      
    }
    else {
	    
	    xmlReqObj = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {			
			 	POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
			    POId   = (xmlReqObj.responseXML.getElementsByTagName('FPOId')[0]).firstChild.data;		    
			    if(POName != ""){		      
			      txtObj.value = POName;
			    }
			    else {
			      txtObj.value = 'Invalid Pin Code';
			    }
			    	 
	        }
	    }
	    xmlReqObj.send(null);
    }
}

/**
* Author 					: Sumit Sundriyal
  Date Created 				: 02/12/2006
  About 					: This method is used to get the PO Name/associated regiment List on the basis of pincode.
  How 						: If pincode is started with "9" then a popup will be open contaning all the regiment 
  							  associated with the pincode.  							
  							  This method is based on Ajax in which xmlHttpRequest will be generated 
    						  for the action which has been passed as an argument of this method.    						  
  @param poid               : This variable contain the id of the post office for which name to be search;
  @param textBoxTobeDisplay : Contains the name of the text box where name of the po to be shown.
  @param action				: Contains the name of the action on the basis of the that action class will 
                 		      execute the code.
  @param formName 			: Contains the name of the form in which field of post office name lying.
*/
function getPORegimentInfoForPopup(pincode,textBoxTobeDisplay,action,formName,receiverRegimentIdHiddenBoxName)
{
	var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
	
    var strURL=action+"?poid="+pincode;
    var xmlReqObj;
    if(isValidPin(pincode) == false){
      //alert("Please Enter Pincode.");
    }
    else if(pincode.search(/^9/) != -1){    
       var lcoat = "initfporegimentmappedlistActionFromPopup.do?pincode="+pincode+"&receiverRegimentIdHiddenBoxName="+receiverRegimentIdHiddenBoxName+"&receiverPONameTxtBoxName="+textBoxTobeDisplay;
       var dimen = "top=300,left=500,height=300,width=500";       
       window.open(lcoat,"Regiments",dimen);      
    }
    else {
	    
	    xmlReqObj = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {			
			 	POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
			    POId   = (xmlReqObj.responseXML.getElementsByTagName('FPOId')[0]).firstChild.data;		    
			    if(POName != ""){		      
			      txtObj.value = POName;
			    }
			    else {
			      txtObj.value = 'Invalid Pin Code';
			    }
			    	 
	        }
	    }
	    xmlReqObj.send(null);
    }
}

function getPORegimentInfoForMessageNew(pincode,textBoxTobeDisplay,action,formName,receiverRegimentIdHiddenBoxName,indx)
{
	var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
	
    var strURL=action+"?poid="+pincode;
    var xmlReqObj;
    if(pincode == ""){
      alert("Please Enter Pincode.");
    }
    else if(pincode.search(/^9/) != -1){    
       var lcoat = "initfporegimentmappedlistAction.do?pincode="+pincode+"&receiverRegimentIdHiddenBoxName="+receiverRegimentIdHiddenBoxName+"&receiverPONameTxtBoxName="+textBoxTobeDisplay+"&indx="+indx;
       var dimen = "top=300,left=500,height=300,width=500";       
       window.open(lcoat,"Regiments",dimen);      
    }
    else {
	    
	    xmlReqObj = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {			
			 	POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
			    POId   = (xmlReqObj.responseXML.getElementsByTagName('FPOId')[0]).firstChild.data;		    
			    if(POName != ""){		      
			      txtObj.value = POName;
			    }
			    else {
			      txtObj.value = 'Invalid Pin Code';
			    }
			    var v2 = eval(indx);			    
			    var objNextName = document.getElementById("receiverName_"+(v2+1));
			    
			    if(objNextName != null){
			      objNextName.focus();
			    }
			    	 
	        }
	    }
	    xmlReqObj.send(null);
    }
}
function getQuestionName(userLogin,divIdTobeDisplay,action,formName,txthiddenQuestionId)
{
    var txtObj = eval('document.'+formName+'.'+txthiddenQuestionId);	
    
	var divObj = document.getElementById(divIdTobeDisplay);	
    var strURL=action+"?userLoginName="+userLogin.value+"&option=Q";
    var xmlReqObj;    
    if(userLogin.value == ""){
      alert("Please Enter User Login.");
	  userLogin.focus();
    }    
    else {
	    
	    xmlReqObj = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {			
			 	Question = (xmlReqObj.responseXML.getElementsByTagName('QuestionName')[0]).firstChild.data;				 	
			    QuestionId   = (xmlReqObj.responseXML.getElementsByTagName('QuestionID')[0]).firstChild.data;		    			   
			    divObj.innerHTML = Question;
			    txtObj.value = QuestionId;
		 		if(trim(Question) == 'Question not found')
		 			userLogin.focus();
		 		else
		 			document.forgetpasswordForm.userAns.focus();
	        }
	    }
	    xmlReqObj.send(null);
    }
}

function getPassword(userLogin,divIdTobeDisplay,QuestionId,userAns,action)
{    	
	var divObj = document.getElementById(divIdTobeDisplay);
    var strURL=action+"?userLoginName="+userLogin.value+"&questionID="+QuestionId +"&Ans="+userAns.value+"&option=P";   
    var xmlReqObj;    
    if(trim(userLogin.value) == ""){
      alert("Please Enter User Login.");
      userLogin.focus();
    } else if(trim(QuestionId) == "0" || trim(QuestionId) == "" ) {
      alert("Question not found");
      userLogin.focus();
    } else if(userAns.value==""){
      alert("Please Enter Answer.");
	  userAns.focus();
    } 
    else {
	    
	    xmlReqObj = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {         	
			 	userPassword = (xmlReqObj.responseXML.getElementsByTagName('UserPassword')[0]).firstChild.data;				 				    
			    divObj.innerHTML = userPassword;	
		 		
		 		if(trim(userPassword) == 'Password not found')
		 		{
		 			userAns.value = '';
	  				userAns.focus();
	  			}
			    		   	    
	        }
	    }
	    xmlReqObj.send(null);
    }
}

function openImageWindow(sendloginid,msgid,copyid,poname)
	{
	   newWin = window.open("ShowImagePreview.jsp?SendLoginID="+sendloginid+"&MsgID="+msgid+"&CopyID="+copyid+"&POName="+poname+"&mode=before","newWin","scrollbars=yes,height=300,width=600");
	}
function subScanMsg()
	{ 
	   checkBoxCount = "";
	   frmObject = (eval("document.frmPOScanned"));
	   checkBoxCount = isMoreThanOneCheckBox(frmObject);
	   if(checkBoxCount == "0"){
		  alert("There is no scanned message for printing.");
	   }
	   else {		
		  isChecked="No";
          
          if(!document.frmPOScanned.msgInfo){
             alert("There is no message for printing  ");
	      }
	      else if(document.frmPOScanned.msgInfo[1]){
	
	         for(var v=0; v<document.frmPOScanned.msgInfo.length;v++){
	           if(document.frmPOScanned.msgInfo[v].checked == true){
	             isChecked = "Yes";
	             break;
	           }
	         }
	      }
	      else {
	         if(document.frmPOScanned.msgInfo.checked == true){
	           isChecked = "Yes";
	         }
	      }
	      
	      //if user have not selected any checkbox then give appropriate message else open popup. 	      
		  if(isChecked =="No" ){
		        alert("Please select atleast one scanned message for printing.");
		  }
		  else {
		       strMsgInfoParameter = "";
               isFirstTime = "Yes";
		       if(document.frmPOScanned.msgInfo[1]){
		
			         for(var v=0; v<document.frmPOScanned.msgInfo.length;v++){
			           if(document.frmPOScanned.msgInfo[v].checked == true){
			             if(isFirstTime == "Yes"){
			               strMsgInfoParameter = "?msgInfo="+document.frmPOScanned.msgInfo[v].value;
			               isFirstTime = "No";
			             }
			             else {
			             strMsgInfoParameter = strMsgInfoParameter + "&msgInfo="+document.frmPOScanned.msgInfo[v].value;
			             }
			           }
			         }
			         //alert("ShowImagePreview.jsp "+strMsgInfoParameter);
			         var url = "printScanMessageAction.do"+strMsgInfoParameter+"&forScanMsg=forConfirmation";
		         	 var conf = "scrollbars=yes,height=300,width=600";		        		         	 
			         window.open(url,"newWin",conf);
		         
		      }
		      else {
		         if(document.frmPOScanned.msgInfo.checked == true){
		           //alert("ShowImagePreview.jsp?msgInfo="+document.frmTxtMsg.msgInfo.value);
		           var url = "printScanMessageAction.do?msgInfo="+document.frmPOScanned.msgInfo.value+"&forScanMsg=forConfirmation";
		           var conf = "scrollbars=yes,height=300,width=600";		        		         	 
			       window.open(url,"newWin",conf);
		           //window.open("ShowImagePreview.jsp?msgInfo="+document.frmScanMsg.msgInfo.value+'&mode=before',"newWin","scrollbars=yes,height=300,width=600");
		         }
		      }				
		  }		
	}
}
/*

*/
function subPrePaidUserScanMsg()
	{ 
	   checkBoxCount = "";
	   frmObject = (eval("document.frmPaidScanned"));
	   checkBoxCount = isMoreThanOneCheckBox(frmObject);	   
	   if(checkBoxCount == "0"){
		  alert("There is no scanned message for printing.");
	   }
	   else {		
		  isChecked="No";
          if(!document.frmPaidScanned.msgInfo){
             alert("There is no message for printing ");
	      }
	      else if(document.frmPaidScanned.msgInfo[1]){
	
	         for(var v=0; v<document.frmPaidScanned.msgInfo.length;v++){
	           if(document.frmPaidScanned.msgInfo[v].checked == true){
	             isChecked = "Yes";
	             break;
	           }
	         }
	      }
	      else {
	         if(document.frmPaidScanned.msgInfo.checked == true){
	           isChecked = "Yes";
	         }
	      }
	      //if user have not selected any checkbox then give appropriate message else open popup. 	      
		  if(isChecked =="No" ){
		        alert("Please select atleast one scanned message for printing.");
		  }
		  else {
		       strMsgInfoParameter = "";
               isFirstTime = "Yes";
		       if(document.frmPaidScanned.msgInfo[1]){
		
			         for(var v=0; v<document.frmPaidScanned.msgInfo.length;v++){
			           if(document.frmPaidScanned.msgInfo[v].checked == true){
			             if(isFirstTime == "Yes"){
			               strMsgInfoParameter = "?msgInfo="+document.frmPaidScanned.msgInfo[v].value;
			               isFirstTime = "No";
			             }
			             else {
			             strMsgInfoParameter = strMsgInfoParameter + "&msgInfo="+document.frmPaidScanned.msgInfo[v].value;
			             }
			           }
			         }
			       
			         var url = "printScanMessageAction.do"+strMsgInfoParameter+"&forScanMsg=forConfirmation";
		         	 var conf = "scrollbars=yes,height=300,width=600";		        		         	 
			         window.open(url,"newWin",conf);
			         //window.open("ShowPaidImagePreview.jsp"+strMsgInfoParameter+'&mode=before',"newWin","scrollbars=yes,height=300,width=600");
		         
		      }
		      else {			         //alert(""+strMsgInfoParameter);
		         if(document.frmPaidScanned.msgInfo.checked == true){
		           
		           var url = "printScanMessageAction.do?msgInfo="+document.frmPaidScanned.msgInfo.value+"&forScanMsg=forConfirmation";
		           var conf = "scrollbars=yes,height=300,width=600";		        		         	 
			       window.open(url,"newWin",conf);
		           //window.open("ShowPaidImagePreview.jsp?msgInfo="+document.frmScanMsgFromPrePaidUsr.msgInfo.value+'&mode=before',"newWin","scrollbars=yes,height=300,width=600");
		         }
		      }
				
		  }
		//newWin = window.open("ShowImagePreview.jsp?SendLoginID="+sendloginid+"&MsgID="+msgid+"&CopyID="+copyid+"&POName="+poname+"&mode=before","newWin","scrollbars=yes,height=300,width=600");
		//newWin = window.open("ShowImagePreview.jsp?SendLoginID="+sendloginid+"&MsgID="+msgid+"&CopyID="+copyid+"&POName="+poname+"&mode=before","newWin","scrollbars=yes,height=300,width=600");
	}
}
function isMoreThanOneCheckBox(frmObj){ 
  result = "";  
  if(frmObj.msgInfo != null){
     if(frmObj.msgInfo[1]){      
       result = "2";
     }
     else {
       result =  "1"
     }     
  }
  else {
    result =  "0";
  }
  return result;
}

function selectDeselectCheckBoxes(frmObj){  
	  checkBoxCount = "";
	  frmObject = (eval("document."+frmObj));
	  checkBoxCount = isMoreThanOneCheckBox(frmObject);	   
	  if(checkBoxCount=="0"){
	     alert("There is no message to select.");
	  }
	  else if(checkBoxCount=="1"){
	  
	     if(frmObject.chkSelectDeselecAll.checked==true){
	         frmObject.msgInfo.checked=true;
	         frmObject.btnSelectDeselect.value="Deselect All";
	         frmObject.btnSelectDeselectL.value="Deselect All";	         
	         
	      }
	      else {
	         frmObject.msgInfo.checked=false;
	        
	         frmObject.btnSelectDeselect.value="Select All";
	         frmObject.btnSelectDeselectL.value="Select All";
	        
	      }
	  }
	  else {
	  //alert("2 '"+frmObject.btnSelectDeselect.value+"'"+frmObject.msgInfo.length+"  "+frmObject.msgInfo[0].checked);
	     if(frmObject.chkSelectDeselecAll.checked==true){
	         for(var i=0; i<frmObject.msgInfo.length; i++){
	           frmObject.msgInfo[i].checked = true;
	         }
	         
	        frmObject.btnSelectDeselect.value="Deselect All" 	        
	        frmObject.btnSelectDeselectL.value="Deselect All";
	       
	      }
	      else {
	         for(var i=0; i<frmObject.msgInfo.length; i++){
	           frmObject.msgInfo[i].checked = false;
	         }
	         
	         frmObject.btnSelectDeselect.value="Select All";
	         frmObject.btnSelectDeselectL.value="Select All";
	         
	      }	  
	  
	  }
}
/**
* Author 					: Harshendra Singh Sagar
  Date Created 				: 23/10/2007
  About 					: This method is to limit the number of messages to be printed to 99
*/

function checkPrintable(frmObj){
	checkBoxCount = "";
	frmObject = (eval("document."+frmObj)); 
	checkBoxCount = isMoreThanOneCheckBox(frmObject);
	
	if(checkBoxCount=="0"){
	     alert("There is no message to select.");
	  }
	  else if(checkBoxCount=="1"){	  
	  	if(frmObject.msgInfo.checked==false){
	  		alert("Please select a message to print.");
	  		return false;
	  	}
	  	
	  }
	  else if(checkBoxCount == "2")	{	  
	  var count = 0;
	  var countUnchecked = 0;	
	  for(var i=0; i<frmObject.msgInfo.length; i++ ){
	  if(frmObject.msgInfo[i].checked){
		count=count+1;
		}
		else{
		countUnchecked= countUnchecked+1;
		}
	  }
	  if(countUnchecked==frmObject.msgInfo.length){
	  alert("Please select a message to print.");
	  		return false;
	  }
	  else if(count>99){
	  alert("You can select only 99 messages at a time to print.")
	  		return false;
	  }else {
	  	return true;
	  }
	}
}

 
function selectDeselectCheckBoxesBtn(frmObj){  
	   checkBoxCount = "";
	   frmObject = (eval("document."+frmObj)); 
	   checkBoxCount = isMoreThanOneCheckBox(frmObject);
	  if(checkBoxCount=="0"){
	     alert("There is no message to select.");
	  }
	  else if(checkBoxCount=="1"){
	 
	     if(frmObject.btnSelectDeselect.value=="Select All"){
	         frmObject.msgInfo.checked=true;	         
	         frmObject.btnSelectDeselect.value="Deselect All";
	         
	         if(frmObject.btnSelectDeselectL != null)
		         frmObject.btnSelectDeselectL.value="Deselect All";

	         if(frmObject.chkSelectDeselecAll != null)
		         frmObject.chkSelectDeselecAll.checked=true;
	      }
	      else {
	         frmObject.msgInfo.checked=false;
	         frmObject.btnSelectDeselect.value="Select All";

	         if(frmObject.btnSelectDeselectL != null)
		         frmObject.btnSelectDeselectL.value="Select All";

	         if(frmObject.chkSelectDeselecAll != null)
		         frmObject.chkSelectDeselecAll.checked=false;
	      }
	  }
	  else {
	  //alert("2 '"+frmObject.btnSelectDeselect.value+"'"+frmObject.msgInfo.length+"  "+frmObject.msgInfo[0].checked);
	     if(frmObject.btnSelectDeselect.value=="Select All"){
	         for(var i=0; i<frmObject.msgInfo.length; i++){
	           frmObject.msgInfo[i].checked = true;
	         }
	        frmObject.btnSelectDeselect.value="Deselect All"; 

	         if(frmObject.btnSelectDeselectL != null)
		         frmObject.btnSelectDeselectL.value="Deselect All";

	         if(frmObject.chkSelectDeselecAll != null)
		         frmObject.chkSelectDeselecAll.checked=true;
	      }
	      else {
	         for(var i=0; i<frmObject.msgInfo.length; i++){
	           frmObject.msgInfo[i].checked = false;
	         }
	         frmObject.btnSelectDeselect.value="Select All";
	         
	         if(frmObject.btnSelectDeselectL != null)
		         frmObject.btnSelectDeselectL.value="Select All";

	         if(frmObject.chkSelectDeselecAll != null)
		         frmObject.chkSelectDeselecAll.checked=false;
	         
	      }	  
	  
	  }
}

    //prepaid user text message 
    function subPrePaidTextMsg(){
      isChecked="No";
      if(!document.frmPaidText.msgInfo){
        alert("There is no message for printing ");
      }
      else if(document.frmPaidText.msgInfo[1]){

         for(var v=0; v<document.frmPaidText.msgInfo.length;v++){
           if(document.frmPaidText.msgInfo[v].checked == true){
             isChecked = "Yes";
             break;
           }
         }
      }
      else {
         if(document.frmPaidText.msgInfo.checked == true){
           isChecked = "Yes";
         }
      }
      //if user have not selected any checkbox then give appropriate message else open popup. 
      
      if(isChecked =="No"){
        alert("Please select a Text Message for Printing.");
      }
      else {
        strMsgInfoParameter = "";
        isFirstTime = "Yes";
		  if(document.frmPaidText.msgInfo[1]){
		
		         for(var v=0; v<document.frmPaidText.msgInfo.length;v++){
		           if(document.frmPaidText.msgInfo[v].checked == true){
		             if(isFirstTime == "Yes"){
		               strMsgInfoParameter = "?msgInfo="+document.frmPaidText.msgInfo[v].value;
		               isFirstTime = "No";
		             }
		             else {
		             strMsgInfoParameter = strMsgInfoParameter + "&msgInfo="+document.frmPaidText.msgInfo[v].value;
		             }
		           }
		         }
		         //alert("ShowTextPreview.jsp"+strMsgInfoParameter);
		         var url = "printMessageAction.do"+strMsgInfoParameter+"&forConfimation=Yes";
		         var conf = "scrollbars=yes,height=300,width=600";		        
		         window.open(url,"newWin",conf);
		         
		      }
		      else {
		         if(document.frmPaidText.msgInfo.checked == true){
		          var url = "printMessageAction.do?msgInfo="+document.frmPaidText.msgInfo.value+"&forConfimation=Yes";
		          var conf = "scrollbars=yes,height=300,width=600";
		           //alert("ShowTextPreview.jsp?msgInfo="+document.frmTxtMsg.msgInfo.value);
		           window.open(url,"newWin",conf);
		           //window.open("printMessageAction?msgInfo="+document.frmTextMsgPrePaidUsr.msgInfo.value,"newWin","scrollbars=yes,height=300,width=600");
		         }
		      }
      }
    }
    
    function subTextMsg(){
      isChecked="No";
      if(!document.frmTxtMsg.msgInfo){
        alert("There is no message for printing ");
      }
      else if(document.frmTxtMsg.msgInfo[1]){

         for(var v=0; v<document.frmTxtMsg.msgInfo.length;v++){
           if(document.frmTxtMsg.msgInfo[v].checked == true){
             isChecked = "Yes";
             break;
           }
         }
      }
      else {
         if(document.frmTxtMsg.msgInfo.checked == true){
           isChecked = "Yes";
         }
      }
      //if user have not selected any checkbox then give appropriate message else open popup. 
      
      if(isChecked =="No"){
        alert("Please select a Text Message for Printing.");
      }
      else {
        strMsgInfoParameter = "";
        isFirstTime = "Yes";
		  if(document.frmTxtMsg.msgInfo[1]){
		
		         for(var v=0; v<document.frmTxtMsg.msgInfo.length;v++){
		           if(document.frmTxtMsg.msgInfo[v].checked == true){
		             if(isFirstTime == "Yes"){
		               strMsgInfoParameter = "?msgInfo="+document.frmTxtMsg.msgInfo[v].value;
		               isFirstTime = "No";
		             }
		             else {
		             strMsgInfoParameter = strMsgInfoParameter + "&msgInfo="+document.frmTxtMsg.msgInfo[v].value;
		             }
		           }
		         }
		         //alert("ShowTextPreview.jsp"+strMsgInfoParameter);
		         //window.open("ShowTextPreview.jsp"+strMsgInfoParameter,"newWin","scrollbars=yes,height=300,width=600");
		         var url = "printMessageAction.do"+strMsgInfoParameter+"&forConfimation=Yes";
		         var conf = "scrollbars=yes,height=300,width=600";		        
		         window.open(url,"newWin",conf);
		         
		      }
		      else {
		         if(document.frmTxtMsg.msgInfo.checked == true){
		           //alert("ShowTextPreview.jsp?msgInfo="+document.frmTxtMsg.msgInfo.value);
		           //window.open("ShowTextPreview.jsp?msgInfo="+document.frmTxtMsg.msgInfo.value,"newWin","scrollbars=yes,height=300,width=600");
		            var url = "printMessageAction.do?msgInfo="+document.frmTxtMsg.msgInfo.value+"&forConfimation=Yes";
		           var conf = "scrollbars=yes,height=300,width=600";
		           //alert("ShowTextPreview.jsp?msgInfo="+document.frmTxtMsg.msgInfo.value);
		           window.open(url,"newWin",conf);
		         }
		      }
      }
    }
	function openWindow(sendloginid,msgid,poname,copyid,languageid)
	{
		newWin = window.open("ShowPreview.jsp?SendLoginID="+sendloginid+"&MsgID="+msgid+"&CopyID="+copyid+"&POName="+poname+"&LanguageID="+languageid,"newWin","scrollbars=yes,height=300,width=600");
	}
	
  
  function openPaidImageWindow(sendloginid,msgid,copyid,poname)
	{
		newWin = window.open("ShowPaidImagePreview.jsp?SendLoginID="+sendloginid+"&MsgID="+msgid+"&CopyID="+copyid+"&POName="+poname+"&mode=before","newWin","scrollbars=yes,height=300,width=600");
	}
  
  function submitFrmTxtMsg(){
	document.frmTxtMsg.submit();
  }
  
  function openTextWindow(sendloginid,msgid,poname,copyid)
	{
	 // SendLoginID , MsgID , copyID, POName, mode
		newWin = window.open("ShowTextPreview.jsp?SendLoginID="+sendloginid+"&MsgID="+msgid+"&CopyID="+copyid+"&POName="+poname+"&mode=before","newWin","scrollbars=yes,height=300,width=600");
	}
/**
Created By	: Vineet Kumar
Created On	: 09/01/2006
Decription	: Used to get regions based on circle ids.
*/
function getRegion(circleId,comboToBePopulate,action)
{	
	if( circleId != '' )
	{
	    var strURL = action+"?circleId="+circleId;
	    var xmlReqObj;    
	    var propObj = document.getElementById(comboToBePopulate);        
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() 
	    {	
	        if (xmlReqObj.readyState == 4) 
	        {        
	        	var RegionXML      = xmlReqObj.responseXML.getElementsByTagName('RegionName')[0];        	
			 	regionNameAll 	   = RegionXML.firstChild.data;	 	
	    		var regionName 	   = new Array();    		
				regionName 		   = regionNameAll.split(',');			
			    var RegionIdXML    = xmlReqObj.responseXML.getElementsByTagName('RegionId')[0];		    
			 	var regionIdAll    = RegionIdXML.firstChild.data;
	    		var regionId       = new Array();
				regionId           = regionIdAll.split(',');
				
				propObj.length      = 0;
	            propObj.options[0] = new	Option("--Select--","");
					for(var counter=1;counter<regionName.length;counter++)
					{
						propObj.options[counter] = new	Option(regionName[counter],regionId[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					if(propObj.length <= 1 )
					{
					 propObj.options[0].selected = true;
					 
					}
					else 
					{
						for(var v=0;v<propObj.length;v++)
						{
						   if(propObj.options[v].value == "" || propObj.options[v].value == "")
						   {
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
					if(regionName.length<=0)
					{
						alert('No Region found for the selected Circle.');
					}
					
	
	        }
			 	/*POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
			    POId   = (xmlReqObj.responseXML.getElementsByTagName('FPOId')[0]).firstChild.data;		    
			    if(POName != ""){		      
			      txtObj.value = POName;
			    }
			    else {
			      txtObj.value = 'Invalid Pin Code';
			    }*/		 	
	        //}
	    }
	    xmlReqObj.send(null);
	}
}
/**
Created By	: Vineet Kumar
Created On	: 09/01/2006
Decription	: Used to get divisions based on region ids.
*/
function getDivision(regionId,comboToBePopulate,action){

	if( regionId != '' )
	{
	   // var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
	    var strURL = action+"?regionId="+regionId;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);    
	   // var propObj = eval('document.prepaiduserdtlForm.'+comboToBePopulate);
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange	= function() {	
	        if (xmlReqObj.readyState == 4) {        
	        	var DivisionXML		= xmlReqObj.responseXML.getElementsByTagName('DivisionName')[0];        	
			 	divisionNameAll		= DivisionXML.firstChild.data;	 	
	    		var divisionName	= new Array();    		
				divisionName		= divisionNameAll.split(',');			
			    var DivisionIdXML	= xmlReqObj.responseXML.getElementsByTagName('DivisionId')[0];		    
			 	var divisionIdAll	= DivisionIdXML.firstChild.data;
	    		var divisionId		= new Array();
				divisionId			= divisionIdAll.split(',');
				
				propObj.length      = 0;
	            propObj.options[0] = new	Option("--Select--","");
					for(var counter=1;counter<divisionName.length;counter++)
					{
						propObj.options[counter] = new	Option(divisionName[counter],divisionId[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					if(propObj.length <= 1 ){
						 propObj.options[0].selected = true;
						
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == "" || propObj.options[v].value == ""){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
					if(divisionName.length<=0)
					{
						alert('No Division found for the selected Region.');
					}
					
	
	        }
			 	/*POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
			    POId   = (xmlReqObj.responseXML.getElementsByTagName('FPOId')[0]).firstChild.data;		    
			    if(POName != ""){		      
			      txtObj.value = POName;
			    }
			    else {
			      txtObj.value = 'Invalid Pin Code';
			    }*/		 	
	        //}
	    }
	    xmlReqObj.send(null);
	}  
}
/**
Created By	: Vineet Kumar
Created On	: 09/01/2006
Decription	: Used to get post offices based on division id.
*/
function getPostoffice(userType,comboToBePopulate,action){

	if(userType != '')
	{
	   // var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);
	    var strURL = action+"?userType="+userType;
				alert(strURL);
	    var xmlReqObj;
	    var propObj = eval("document.forms[0]."+comboToBePopulate);   
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange	= function() {	
				alert(xmlReqObj.readyState);
	        if (xmlReqObj.readyState == 4) {        
	        	var PostofficeXML		= xmlReqObj.responseXML.getElementsByTagName('PostofficeName')[0];        	
			 	var postOfficeNameAll	= PostofficeXML.firstChild.data;	 	
	    		var postOfficeName		= new Array();    		
				postOfficeName			= postOfficeNameAll.split(',');			
			    var PostofficeIdXML		= xmlReqObj.responseXML.getElementsByTagName('PostofficeId')[0];		    
			 	var postOfficeIdAll		= PostofficeIdXML.firstChild.data;
			 	
	    		var postOfficeId		= new Array();
				postOfficeId			= postOfficeIdAll.split(',');
				
				alert(propObj.length);
				propObj.length      = 0;
					for(var counter=0;counter<postOfficeName.length;counter++)
					{
						propObj.options[counter] = new	Option(postOfficeName[counter],postOfficeId[counter]);
					    if(postOfficeName[counter] == "" )
					    	propObj.options[counter].selected = true;
					}
					// Following if condition will select the option which have the value ""(blank)
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
	
					if(postOfficeName.length<=0)
					{
						alert('No Post office found for the selected Division.');
					}
					
				alert(propObj.length);
	
	        }
			 	/*POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
			    POId   = (xmlReqObj.responseXML.getElementsByTagName('FPOId')[0]).firstChild.data;		    
			    if(POName != ""){		      
			      txtObj.value = POName;
			    }
			    else {
			      txtObj.value = 'Invalid Pin Code';
			    }*/		 	
	        //}
	    }
	    xmlReqObj.send(null);
	}
}
/**
Created By	: Vineet Kumar
Created On	: 09/01/2006
Decription	: Used to get pin code based on postofficeid.
*/
function getAssociationCode(postOfficeId,displayTextBox,action,userType){

	if( (postOfficeId != '') && (userType != '') )
	{
	    var strURL = action+"?postOfficeId="+postOfficeId+"&userType="+userType;
	    var xmlReqObj;
	    var propObj = eval("document.forms[0]."+displayTextBox);    
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange	= function() {	
	        if (xmlReqObj.readyState == 4) {        
	        	var PostofficeXML		= xmlReqObj.responseXML.getElementsByTagName('PinCode')[0];        	
			 	var postOfficeNameAll	= PostofficeXML.firstChild.data;	 	
	    		var postOfficePinCode		= new Array();    		
				postOfficePinCode			= postOfficeNameAll.split(',');			
				propObj.value = postOfficePinCode;
	        }
	    }
	    xmlReqObj.send(null);
    }
}

/*
  Author : Mahesh Barakoti
  Date   : 
  About  : This function is used to get the list of District combo on the basis of state combo
*/

function getDistrict(stateId,comboToBePopulate,action){
   	
   	if( stateId != '' )
   	{
	    var strURL = action+"?stateId="+stateId;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);    
	  
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {       
	            propObj.length    = 0; 
	            propObj.options[0] = new	Option("--- Select ---","");
	            
	        	var DistrictXML      = xmlReqObj.responseXML.getElementsByTagName('DistrictName')[0];        	
			 	districtNameAll 	  = DistrictXML.firstChild.data;		 	
	    		var districtName 	  = new Array();    		
				districtName 		  = districtNameAll.split(',');			
			    var DistrictIdXML 	  = xmlReqObj.responseXML.getElementsByTagName('DistrictId')[0];		    
			 	var districtIdAll    = DistrictIdXML.firstChild.data;
	    		var districtId       = new Array();
				districtId           = districtIdAll.split(',');
				
				
					for(var counter=1;counter<districtName.length;counter++)
					{
						propObj.options[counter] = new	Option(districtName[counter],districtId[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == "" || propObj.options[v].value == ""){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
	
	        }
			 	
	    }
	    xmlReqObj.send(null);
  	}
}
//Ends of district combo

/*
  Author : Mahesh Barakoti
  Date   : 
  About  : This function is used to get the Pincode on the basis  district
*/

function getPincode(districtId,comboToBePopulate,action){
   	
	if( districtId != '' )
	{
	    var strURL = action+"?districtId="+districtId;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);    
	  
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {       
	            propObj.length    = 0; 
	            propObj.options[0] = new	Option("--Select--","");
	            
	        	var PostofficeXML      = xmlReqObj.responseXML.getElementsByTagName('Pincode')[0];        	
			 	pincodeAll 	  = PostofficeXML.firstChild.data;		 	
	    		var pincodeArr 	  = new Array();    		
				pincodeArr 		  = pincodeAll.split(',');			  
				
					for(var counter=1;counter<pincodeArr.length;counter++)
					{
						propObj.options[counter] = new	Option(pincodeArr[counter],pincodeArr[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					
					if(propObj.length <= 1 ){
						propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == "" || propObj.options[v].value == ""){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
	
	        }
			 	
	    }
	    xmlReqObj.send(null);
	}  
}

/*
  Author : Mahesh Barakoti
  Date   : 
  About  : This function is used to confirm the password entered by the user


function checkPassword(objLoginPwd,objLoginConfirmPwd){

    var pwd1,pwd2;
    pwd1 = objLoginPwd.value; 
    pwd2 = objLoginConfirmPwd.value;
    
    if( objLoginPwd.value.length < 8){
            alert("Password  should contain minimum 8 and maximum 10 characters");
            objLoginPwd.focus();
            return false;
     }
    
    if (pwd1 != pwd2){
            alert("Password does not match with confirm password. Please try again.");
            objLoginConfirmPwd.focus();
            return false;
    }
   
    return true;
        
}
*/
/*
  Author : Mahesh Barakoti
  Date   : 
  About  : This function is used to accept or deny agreement for
  registering the user. 
*/

function showAgreement(objLoginPwd,objLoginConfirmPwd){

        window.open("PaidAgreement.jsp","newWin","location=no,menubar=no,height=500,width=600,resizable=no,scrollbars=yes,left=0,top=0");
        return true;
		
}

/*
  Author : Mahesh Barakoti
  Date   : 
  About  : This function is used to accept or deny agreement for
  registering the user. 
*/

 function varifyAgreement(val)
 {
        if(val=="yes")
        {    
            self.opener.document.prepaiduserdtlForm.submit.disabled=false;
            window.close();
        }
        else
        {
            self.opener.document.prepaiduserdtlForm.submit.disabled=true;
            window.close();
         }
    }        

/*
  Author : Mahesh Barakoti
  Date   : 
  About  : This function is used to enter card code four at a times
*/   
    
    
 function checkCardCode1(){
	while(document.prepaidcardForm.cardCode1.value.length==4){		
		document.prepaidcardForm.cardCode2.focus();
		return false;
	}
}
function checkCardCode2(){
	while(document.prepaidcardForm.cardCode2.value.length==4){		
		document.prepaidcardForm.cardCode3.focus();
		return false;
	}
}
function checkCardCode3(){
	while(document.prepaidcardForm.cardCode3.value.length==4){		
		document.prepaidcardForm.cardCode4.focus();
		return false;
	}
}

function checkCardCode4(){
	while(document.prepaidcardForm.cardCode4.value.length==4){		
		document.prepaidcardForm.submit.focus();
		return false;
	}
}

function checkBoth(frm){
	
	if(getIndex(frm)){
		if(checkFiveDigit()){
			
			return true;
		}
				
	}
	return false;
}
function checkFiveDigit(){
	var v1="";
	var v2="";
	var v3="";
	var v4="";
	
	var d1="";
	var d2="";
	var d3="";
	var d4="";

	v1=document.prepaidcardForm.cardCode1.value;
	v2=document.prepaidcardForm.cardCode2.value;
	v3=document.prepaidcardForm.cardCode3.value;
	v4=document.prepaidcardForm.cardCode4.value;

	d1=v1.length;
	d2=v2.length;
	d3=v3.length;
	d4=v4.length;

	

	if(d1==4){
		if(d2==4){
			if(d3==4){
				if(d4==4){
						
					return true;
				}
			}
		}
	}
return false;
}

	
function onCancel(frm){
	
	if(confirm("The registration information entered will be lost.\n Click OK to continue."))
	{
		location.href = "login/login.jsp";
	}
}
function checkCountry(objPostofficeId){
			
	var intPinCode;
	

    if(intCountryId == 1){
    
      intStateId=objStateId.value;
      intDistrictId=objDistrictId.value;
      
     }
			
		if(intCountryId != 0){
           if(intCountryId == 1){
	            if(intStateId != 0){
	            
		               if(intDistrictId !=0){
		                  if(intPinCode==0){
		                     alert("Pin Code is not selected.");
		                     return false;
		                  }
		                  else{
		                       return true;
		                  }     
		               } 
	               
		                else{
		                     alert("District is not selected.");
		                     return false;
		                }
	                
	                    
	             }
	             else{
						alert("State is not selected.");
					    return false;
                 }
           }
          }
          else{
                  alert("Country is not selected.");
                  return false;
          }
            return true;
}
  
  /*
  Author : Mahesh Barakoti
  Date   : 
  About  : This function validates card no. and card code entered.
*/   
   
  function checkCardNoandCardCode(){
			
	var intcardNo;
	var intcardCode;
    intcardNo=document.prepaidcardForm.cardNo.value;
    intcardCode1=document.prepaidcardForm.cardCode1.value;
    intcardCode2=document.prepaidcardForm.cardCode2.value;
    intcardCode3=document.prepaidcardForm.cardCode3.value;
    intcardCode4=document.prepaidcardForm.cardCode4.value;
    
    if(intcardNo!=0){
	    if((intcardCode1==0) || (intcardCode2==0) || (intcardCode3==0) || (intcardCode4==0)){
	       alert("Please enter complete Card Code.");
            document.prepaidcardForm.cardCode1.focus();
	       return false;
	    }
	    else{
			  return true;
			} 
	}		 
	 else{
            alert("Please enter Card No.");
            document.prepaidcardForm.cardNo.focus();
            return false;
        } 
   
    return true;
     
		              
              
  }    
  
  
  /**
Author 			: Vineet Kumar
Date Created	: 09/01/2006
About 			: This function is used to get all the Post Office based upon the divisionid 	
				  received as an argument.
*/
function getPostofficeByDivision(divId,comboToBePopulate,action){

   if( divId != '' )
   {
	   // var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);
	    var strURL = action+"?divIdForPoList="+divId;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);   
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange	= function() {	
	        if (xmlReqObj.readyState == 4) {        
	        	var PostofficeXML		= xmlReqObj.responseXML.getElementsByTagName('PostofficeName')[0];        	
			 	var postOfficeNameAll	= PostofficeXML.firstChild.data;	 	
	    		var postOfficeName		= new Array();    		
				postOfficeName			= postOfficeNameAll.split(',');			
			    var PostofficeIdXML		= xmlReqObj.responseXML.getElementsByTagName('PostofficeId')[0];		    
			 	var postOfficeIdAll		= PostofficeIdXML.firstChild.data;
			 	
	    		var postOfficeId		= new Array();
				postOfficeId			= postOfficeIdAll.split(',');
				
				propObj.length      = 0;
					propObj.options[0] = new	Option('--Select--','');
					for(var counter=1;counter<postOfficeName.length;counter++)
					{
						propObj.options[counter] = new	Option(postOfficeName[counter],postOfficeId[counter]);
					}
					// Following if condition will select the option which have the value ""(blank)
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == "" || propObj.options[v].value == ""){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
					if(postOfficeName.length<=0)
					{
						alert('No Post office found for the selected Division.');
					}
					
	
	        }
			 	/*POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
			    POId   = (xmlReqObj.responseXML.getElementsByTagName('FPOId')[0]).firstChild.data;		    
			    if(POName != ""){		      
			      txtObj.value = POName;
			    }
			    else {
			      txtObj.value = 'Invalid Pin Code';
			    }*/		 	
	        //}
	    }
	    xmlReqObj.send(null);
	}
}
/**
  Author 		: Sumit Sundriyal
  Date Created 	: 14/02/2007
  About 		: This function is used to get the status of stock and card type and enable the div.  
*/

 function enableSaleDivAndGetCardStock(divId,action,circId,regiId,diviId,pofId){ 
   
    var strURL = action+"?isForStockReport=4&ciden="+circId+"&riden="+regiId+"&diden="+diviId+"&piden="+pofId+"&noAvailable=no";
    var xmlReqObj;   
    xmlReqObj   = getXMLHttpRequest(strURL);	
    xmlReqObj.onreadystatechange	= function() {	
        if (xmlReqObj.readyState == 4) { 
		    var consumedStockXML      		= 	xmlReqObj.responseXML.getElementsByTagName('ConsumedStock')[0];        	
		    var consumedStockData  	  		= 	consumedStockXML.firstChild.data;			   
		    var consumedStockTableObj  		= 	document.getElementById("consumedStockTable");
		    consumedStockTableObj.innerHTML	=	consumedStockData;
		    var cardSaleXML      			= 	xmlReqObj.responseXML.getElementsByTagName('CardStockForSale')[0];   
		    var cardSaleData  	  			= 	cardSaleXML.firstChild.data;			   
		    var cardSaleTableObj  			= 	document.getElementById("cardSale");
		    cardSaleTableObj.innerHTML		=	cardSaleData;
        }		 	
    }
    xmlReqObj.send(null);    
  }
  
 /*
   input : This method take two date input for comparision
   output : returns 1 if first date > second date.
            returns 2 if first date = second date.
            returns 3 if first date is < second date.
   condition : format of the date should be dd-mm-yyyy or dd/mm/yyyy
 */
 function compareDates(first,second)
 {
   firstDate = first;
   secondDate = second;
   reverseFirstDate = "";
   reverseSecondDate = "";
   returnResult = "";
   
   firstDateYr = firstDate.substr(6,4);
   firstDateMo = firstDate.substr(3,2);
   firstDateDa = firstDate.substr(0,2);
   reverseFirstDate = firstDateYr+firstDateMo+firstDateDa;
   secondDateYr = secondDate.substr(6,4);
   secondDateMo = secondDate.substr(3,2);
   secondDateDa = secondDate.substr(0,2);
   reverseSecondDate = secondDateYr+secondDateMo+secondDateDa;
      if(reverseFirstDate > reverseSecondDate)
       {
         returnResult =  '1';
       }
      else if(reverseFirstDate == reverseSecondDate)
       {
         returnResult = '2';
       }
      else if(reverseFirstDate < reverseSecondDate )
       {
        returnResult = '3';
       }
   return returnResult;
 }
 

 /*
 	Shantanu
 	Method to check availability of User name
 */
 function getUserAvailability(objLoginName,messageId,action)
{
	var txtObj = document.getElementById(messageId);	
    var strURL=action+"?availability=check&loginName="+objLoginName.value;
    var xmlReqObj;
    var strPattern = '^[a-zA-Z0-9-_]*$';
   	var reg1 = new RegExp(strPattern);
    
    if(objLoginName.value == ""){
      alert("Please Enter User Name.");
      objLoginName.focus();
    }
    else {
	    if (!reg1.test(objLoginName.value))
	    {
		     alert("User Name can contain only alphanumeric,'-' and '_'.");
		     objLoginName.focus();
		     return true;
	    }
	    
	    xmlReqObj = getXMLHttpRequest(strURL);
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {			
			 	CHKavl = (xmlReqObj.responseXML.getElementsByTagName('CHKavl')[0]).firstChild.data;		 	  		

			    if(trim(CHKavl) == "is available."){		      
			      txtObj.innerHTML = '\''+objLoginName.value + '\' is available.Please proceed.';
			    }
			    else {
			      txtObj.innerHTML =  '\''+objLoginName.value + '\' already exists.Try Another.';
			      objLoginName.value = '';
			    }		 	
	        }
	    }
	    xmlReqObj.send(null);
    }
}
 
 /*
 	Shantanu
 	Method to check whether User name exists or not
 */
 function getUserExist(objLoginName,userType,objUserStatus,action)
{
    var strURL=action+"?userExists=check&loginName="+objLoginName.value+"&type="+userType;
 	var objDivHintQuestion = document.getElementById('divHintQuestion');
 	var objDivPassword = document.getElementById('divPassword');
 	var objQuestionId = document.getElementById('questionId');

    var xmlReqObj;
    if(trim(objLoginName.value) == ""){
      alert("Please Enter User Name.");
      objLoginName.focus();
    }
    else {
	    
	    xmlReqObj = getXMLHttpRequest(strURL);
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {			
			 	CHKavl = (xmlReqObj.responseXML.getElementsByTagName('CHKavl')[0]).firstChild.data;		 	  		
 
			    if(trim(CHKavl) == "exist"){	
			 		getQuestionName(objLoginName,'divHintQuestion',action,'forgetpasswordForm','questionId');
			 			
			 		return true;
			    }
			    else {
					objDivHintQuestion.innerHTML =  'Invalid User Name - ' + objLoginName.value;
					objDivPassword.innerHTML = '';
					objLoginName.value = '';
					document.forgetpasswordForm.userAns.value = '';
					objLoginName.focus();
			    }		 	
	        }
	    }
	    xmlReqObj.send(null);
    }


 	
 	if( objUserStatus.value == 'true' )
 	{
 	}
 	else
 	{
	}


}
 
 /*
  Author : shantanu bansal
  About  : This function is used to get the Postoffice on the basis  district
*/

function getPostOfficeByDistrictandUserType(districtId,userType,comboToBePopulate,action){
   	
    if ( (trim(districtId)!='') && (trim(userType)!='') )
    {
	    var strURL = action+"?districtId="+districtId+"&post=true&userType="+userType;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);    
	  
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {       
	            propObj.length    = 0; 
	            propObj.options[0] = new	Option("-- Select --","");
	            
	        	var PostofficeXML = xmlReqObj.responseXML.getElementsByTagName('Pincode')[0];        	
			 	postOfficeAll 	  = PostofficeXML.firstChild.data;		 	
	    		var postOfficeArr 	  = new Array();    		
				postOfficeArr 		  = postOfficeAll.split(',');	
						  
	        	var pincodeXML = xmlReqObj.responseXML.getElementsByTagName('PostofficeId')[0];        	
			 	pincodeAll 	  = pincodeXML.firstChild.data;		 	
	    		var pincodeArr 	  = new Array();    		
				pincodeArr 		  = pincodeAll.split(',');	
				
					for(var counter=1;counter<pincodeArr.length;counter++)
					{
						propObj.options[counter] = new	Option(postOfficeArr[counter],pincodeArr[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == "" || propObj.options[v].value == ""){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
	
	        }
			 	
	    }
	    xmlReqObj.send(null);
    }
  
}
  /*
  Author : shantanu bansal
  About  : This function is used to get the Postoffice on the basis  district
*/
    // Trim whitespace from left and right sides of s.
    function trim(s) {
        return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
    }

	function convertStrToDate(strDate,dtCh)
	{
		
		var pos1=strDate.split(dtCh);
		
		var date =  new Date(pos1[2],parseInt(pos1[1])-1,pos1[0]);
	
		return date;
	}

	function convertDateToStr(comDate,dtCh)
	{
		
		var strDate = '';
		var date = new Date(comDate);
		
		var day = date.getDate()+'';
		day = (day.length == 1?'0'+day:day);

		var month = eval(date.getMonth()+1)+'';
		month = (month.length == 1?'0'+month:month)+'';

		var year = date.getFullYear();

		strDate = day+dtCh+month+dtCh+year;
		
		return strDate;
	}
			
	function getSystemDate()
	{
		
		var currentDate = new Date();

		return convertDateToStr(currentDate,"/");
	}
 
	function setSystemDate(frmName,dateBox)
	{
		dateBoxObj = (eval("document."+frmName+"."+dateBox)); 
		
		dateBoxObj.value = getSystemDate();
	}
	
	
/*
  Author : SHantanu Bansal
  Date   : 
  About  : This function is used to get the list of Postal Units
*/
function getPostalUnit(comboToBePopulate,action){
   // var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
    var strURL = action+"?postalUnit=yes";
    var xmlReqObj;
    var propObj = document.getElementById(comboToBePopulate);    
   // var propObj = eval('document.prepaiduserdtlForm.'+comboToBePopulate);
    xmlReqObj   = getXMLHttpRequest(strURL);	
   
    xmlReqObj.onreadystatechange = function() {	
        if (xmlReqObj.readyState == 4) {       
            propObj.length    = 0; 
            propObj.options[0] = new Option("--Select--","");
            
        	var DivisionXML      = xmlReqObj.responseXML.getElementsByTagName('DivisionName')[0];        	
		 	divisionNameAll 	  = DivisionXML.firstChild.data;		 	
    		var divisionName 	  = new Array();    		
			divisionName 		  = divisionNameAll.split(',');			
		    var DivisionIdXML 	  = xmlReqObj.responseXML.getElementsByTagName('DivisionId')[0];		    
		 	var divisionIdAll    = DivisionIdXML.firstChild.data;
    		var divisionId       = new Array();
			divisionId           = divisionIdAll.split(',');
			
			
				for(var counter=1;counter<divisionName.length;counter++)
				{
					propObj.options[counter] = new	Option(divisionName[counter],divisionId[counter]);
				}
				
				// Following if condition will select the option which have the value ""(blank)
				
				if(propObj.length <= 1 ){
				 propObj.options[0].selected = true;
				}
				else {
					for(var v=0;v<propObj.length;v++){
					   if(propObj.options[v].value == "" || propObj.options[v].value == ""){
					      propObj.options[v].selected = true;
					      break;
					   }
					}
				}
         }
		 	
    }
    xmlReqObj.send(null);
  
}
	
/*
  Author : Shantanu Bansal
  Date   : 
  About  : This function is used to get the list of countries
*/
function getCountry(comboToBePopulate,action){
   // var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
    var strURL = action+"?countryList=yes";
    var xmlReqObj;
    var propObj = document.getElementById(comboToBePopulate);    
   // var propObj = eval('document.prepaiduserdtlForm.'+comboToBePopulate);
    xmlReqObj   = getXMLHttpRequest(strURL);	
   
    xmlReqObj.onreadystatechange = function() {	
        if (xmlReqObj.readyState == 4) {       
            propObj.length    = 0; 
            propObj.options[0] = new Option("--Select--","");
            
        	var CountryXML      = xmlReqObj.responseXML.getElementsByTagName('CountryName')[0];        	
		 	countryNameAll 	  = CountryXML.firstChild.data;		 	
    		var countryName 	  = new Array();    		
			countryName 		  = countryNameAll.split(',');			
		    var CountryIdXML 	  = xmlReqObj.responseXML.getElementsByTagName('CountryId')[0];		    
		 	var countryIdAll    = CountryIdXML.firstChild.data;
    		var countryId       = new Array();
			countryId           = countryIdAll.split(',');
			
			
				for(var counter=1;counter<countryName.length;counter++)
				{
					propObj.options[counter] = new	Option(countryName[counter],countryId[counter]);
				}
				
				// Following if condition will select the option which have the value ""(blank)
				
				if(propObj.length <= 1 ){
				 propObj.options[0].selected = true;
				}
				else {
					for(var v=0;v<propObj.length;v++){
					   if(propObj.options[v].value == "" || propObj.options[v].value == ""){
					      propObj.options[v].selected = true;
					      break;
					   }
					}
				}
         }
		 	
    }
    xmlReqObj.send(null);
  
}	


/**
Created By	: Shantanu Bansal
Created On	: 13/04/2007
Decription	: Used to get post offices based on post office id.
*/
function getPostofficePin(postOfficeId,displayName,displayPin,action){

   // var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);
   
   if(postOfficeId!='')
   {
	    var strURL = action+"?postOffPin=yes&postOfficeId="+postOfficeId;
	    var xmlReqObj;
	    var nameObj = eval("document.getElementById('"+displayName+"')");   
	    var pinObj = eval("document.getElementById('"+displayPin+"')");   
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange	= function() {	
	
	        if (xmlReqObj.readyState == 4) {        
	        	var PostofficeXML		= xmlReqObj.responseXML.getElementsByTagName('POName')[0];        	
			 	var postOfficeNameAll	= PostofficeXML.firstChild.data;
			 	 	
				nameObj.value = postOfficeNameAll;
	
	        	var pinXML		= xmlReqObj.responseXML.getElementsByTagName('PinCode')[0];        	
			 	var pinAll		= pinXML.firstChild.data;	 	
	
				pinObj.value = pinAll;
	
	        }
	    }
	    xmlReqObj.send(null);
    }
}


function getPostOffNamePin(pincode,displayName,displayId,action,formName)
{
	if(trim(pincode) != '')
	{
		var txtObj = eval('document.'+formName+'.'+displayName);	
		var idObj = eval('document.'+formName+'.'+displayId);	
	    var strURL=action+"?poid="+pincode;
	    	//alert(""+strURL);
	    var xmlReqObj;
	    xmlReqObj = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {
	            try{           		
					if(xmlReqObj.responseXML != null){	
					 	
					 	POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
					    POId   = (xmlReqObj.responseXML.getElementsByTagName('Id')[0]).firstChild.data;		    
					    if(POName != ""){		      
					      txtObj.value = POName;
					      idObj.value = POId;
					    }
					    else {
					      txtObj.value = 'Invalid Pin Code';
					    }
					 } 
					    
			    }catch( e){		 	
			      alert(' exception occurecd '+e);
			    }
	        }
	    }
	    xmlReqObj.send(null);
    }
}


/*
  Author : Shantanu Bansal
  Date   : 
  About  : This function is used to get the list of circles
*/
function getCircle(userType,comboToBePopulate,action){

	if(userType!='')
	{
	   // var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
	    var strURL = action+"?circleList=yes&ut="+userType;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);    
	   // var propObj = eval('document.prepaiduserdtlForm.'+comboToBePopulate);
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {       
	            propObj.length    = 0; 
	            propObj.options[0] = new Option("--Select--","");
	            
	        	var CircleXML      = xmlReqObj.responseXML.getElementsByTagName('CircleName')[0];        	
			 	circleNameAll 	  = CircleXML.firstChild.data;		 	
	    		var circleName 	  = new Array();    		
				circleName 		  = circleNameAll.split(',');			
			    var CircleIdXML 	  = xmlReqObj.responseXML.getElementsByTagName('CircleId')[0];		    
			 	var circleIdAll    = CircleIdXML.firstChild.data;
	    		var circleId       = new Array();
				circleId           = circleIdAll.split(',');
				
				
					for(var counter=1;counter<circleName.length;counter++)
					{
						propObj.options[counter] = new	Option(circleName[counter],circleId[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == "" || propObj.options[v].value == ""){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
	         }
			 	
	    }
	    xmlReqObj.send(null);
	}
}	


	function validateConfirmPass(frmObj)
	{
		if( trim(frmObj.confirmPwd.value) == '' )
		{
			alert('Confirm Password is required.');
			frmObj.confirmPwd.focus();
			return false;
		}
		return true;
		
	}
	
	
	
/**
* Author 					: Shantan Bansal
  Date Created 				: 27/04/2007
  About 					: This method is used to check Pincode already exists or not.

  @param objPincode         : This variable contain the object of the box containing pincode;
  @param successTextObj 	: Contains the object of the element which will display text on success.
  @param failureTextObj 	: Contains the object of the element which will display text on failure.
  @param action				: Contains the name of the action on the basis of the that action class will 
                 		      execute the code.
*/
function checkPincodeGetState(objPincode,successTextObj,failureTextObj,displayBlockObj,districtFieldName,action)
{
	
    var strURL=action+"?checkPincode="+objPincode.value;
    
	var xmlReqObj;
	
    if(objPincode.value == ""){
      alert("Please Enter Pincode.");
    }
    else {
	    
	    if( (objPincode.value.length != 6) || ( !isAllDigits(objPincode.value) ) )
	    {
	      alert("Invalid Pincode.");
	    }
	    else
	    {

	    xmlReqObj = getXMLHttpRequest(strURL);	
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {	
			 	StateName = (xmlReqObj.responseXML.getElementsByTagName('StateName')[0]).firstChild.data;		 	  		
			    StateId   = (xmlReqObj.responseXML.getElementsByTagName('StateId')[0]).firstChild.data;		    
			    Message   = (xmlReqObj.responseXML.getElementsByTagName('Message')[0]).firstChild.data;		    

				if(Message == ""){		      
					successTextObj.innerHTML = StateName;
			      	failureTextObj.innerHTML = Message;

					objPincode.readOnly = "true";
					getDistrict(StateId,districtFieldName,action);
					displayBlockObj.style.display = "block";
			    }
			    else {
			      	failureTextObj.innerHTML = Message;
			      	successTextObj.innerHTML = StateName;

					displayBlockObj.style.display = "none";
					objPincode.readonly = "false";
				}
			    	 
	        }
	    }
	    xmlReqObj.send(null);
	    }
    }
}
	
	
	
/*
  Author : Shantanu Bansal
  About  : This function is used to get the list of circles and corresponding heirarchy. This function will also display selected
  			value depending upon the values passed.
  @param userType {'E','A'}
  @param circleCombo - name of the field which is used for circle combo
  @param regionCombo - name of the field which is used for region combo
  @param divisionCombo - name of the field which is used for division combo
  @param action - action which will be used to fetch mentioned details
  @param circleValue - value of circle to be populated
  @param regionValue - value of region to be populated
  @param divisionValue - value of division to be populated
  
*/
function getCircleAndMaintainValue(userType,circleCombo,regionCombo,divisionCombo,action,circleValue,regionValue,divisionValue){

	if(userType!='')
	{
	    var strURL = action+"?circleList=yes&ut="+userType;
	    var xmlReqObj;
	    var propObj = document.getElementById(circleCombo);    

	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {       
	            propObj.length    = 0; 
	            propObj.options[0] = new Option("--Select--","");
	            
	        	var CircleXML      = xmlReqObj.responseXML.getElementsByTagName('CircleName')[0];        	
			 	circleNameAll 	  = CircleXML.firstChild.data;		 	
	    		var circleName 	  = new Array();    		
				circleName 		  = circleNameAll.split(',');			
			    var CircleIdXML 	  = xmlReqObj.responseXML.getElementsByTagName('CircleId')[0];		    
			 	var circleIdAll    = CircleIdXML.firstChild.data;
	    		var circleId       = new Array();
				circleId           = circleIdAll.split(',');
				
				
					for(var counter=1;counter<circleName.length;counter++)
					{
						propObj.options[counter] = new	Option(circleName[counter],circleId[counter]);
					}
					
					// Following if condition will select the option depending upon the value passed to it.
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   
							if(propObj.options[v].value == circleValue )
						   	{
						    	propObj.options[v].selected = true;
								break;
						   	}
						}
					}
					
					propObj.value = circleValue;
					
					//To fill region combo and maintain region value and further heirarchy if not circleValue null
					if ( circleValue != '' )
					{
						getRegionAndMaintainValue(circleValue,regionCombo,divisionCombo,action,regionValue,divisionValue);
					}
					
	         }
			 	
	    }
	    xmlReqObj.send(null);
	}
}


/*
  Author : Shantanu Bansal
  About  : This function is used to get the list of regions and corresponding heirarchy depending upon the circle Id passed. This function will also display selected
  			value depending upon the values passed.
  @param circleId primary key value of the circle on the basis of which regions will populate
  @param regionCombo - name of the field which is used for region combo
  @param divisionCombo - name of the field which is used for division combo
  @param action - action which will be used to fetch mentioned details
  @param regionValue - value of region to be populated
  @param divisionValue - value of division to be populated
  
*/
function getRegionAndMaintainValue(circleId,regionCombo,divisionCombo,action,regionValue,divisionValue)
{	
	if( circleId != '' )
	{
	    var strURL = action+"?circleId="+circleId;
	    var xmlReqObj;    
	    var propObj = document.getElementById(regionCombo);        
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() 
	    {	
	        if (xmlReqObj.readyState == 4) 
	        {        
	        	var RegionXML      = xmlReqObj.responseXML.getElementsByTagName('RegionName')[0];        	
			 	regionNameAll 	   = RegionXML.firstChild.data;	 	
	    		var regionName 	   = new Array();    		
				regionName 		   = regionNameAll.split(',');			
			    var RegionIdXML    = xmlReqObj.responseXML.getElementsByTagName('RegionId')[0];		    
			 	var regionIdAll    = RegionIdXML.firstChild.data;
	    		var regionId       = new Array();
				regionId           = regionIdAll.split(',');
				
				propObj.length      = 0;
	            propObj.options[0] = new	Option("--Select--","");
					for(var counter=1;counter<regionName.length;counter++)
					{
						propObj.options[counter] = new	Option(regionName[counter],regionId[counter]);
					}
					
					// Following if condition will select the option depending upon the value passed to it.
					if(propObj.length <= 1 )
					{
					 propObj.options[0].selected = true;
					 
					}
					else 
					{
						for(var v=0;v<propObj.length;v++)
						{
						   if( propObj.options[v].value == regionValue )
						   {
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
					if(regionName.length<=0)
					{
						alert('No Region found for the selected Circle.');
					}
					
					//To fill division combo and division value if not regionValue null
					if ( regionValue != '' )
					{
						getDivision(regionValue,divisionCombo,action,divisionValue);
					}
					
	
	        }
	    }
	    xmlReqObj.send(null);
	}
}
	

/*
  Author : Shantanu Bansal
  About  : This function is used to get the list of divisions depending upon the region Id passed. This function will also display selected
  			value depending upon the values passed.
  @param regionId primary key value of the region on the basis of which divisions will populate
  @param divisionCombo - name of the field which is used for division combo
  @param action - action which will be used to fetch mentioned details
  @param divisionValue - value of division to be populated
*/
function getDivision(regionId,divisionCombo,action,divisionValue){

	if( regionId != '' )
	{
	    var strURL = action+"?regionId="+regionId;
	    var xmlReqObj;
	    var propObj = document.getElementById(divisionCombo);    

	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange	= function() {	
	        if (xmlReqObj.readyState == 4) {        
	        	var DivisionXML		= xmlReqObj.responseXML.getElementsByTagName('DivisionName')[0];        	
			 	divisionNameAll		= DivisionXML.firstChild.data;	 	
	    		var divisionName	= new Array();    		
				divisionName		= divisionNameAll.split(',');			
			    var DivisionIdXML	= xmlReqObj.responseXML.getElementsByTagName('DivisionId')[0];		    
			 	var divisionIdAll	= DivisionIdXML.firstChild.data;
	    		var divisionId		= new Array();
				divisionId			= divisionIdAll.split(',');
				
				propObj.length      = 0;
	            propObj.options[0] = new	Option("--Select--","");
					for(var counter=1;counter<divisionName.length;counter++)
					{
						propObj.options[counter] = new	Option(divisionName[counter],divisionId[counter]);
					}
					
					// Following if condition will select the option depending upon the value passed to it.
					if(propObj.length <= 1 ){
						 propObj.options[0].selected = true;
						
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == divisionValue){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
					if(divisionName.length<=0)
					{
						alert('No Division found for the selected Region.');
					}
					
	
	        }
	    }
	    xmlReqObj.send(null);
	}  
}


/*
  Author : Shantanu Bansal
  About  : This function is used to get the selected label of the combo name passed
  
 @param comboName - name of the combo
*/
function getSelectedLabel(comboName)
{
	var comboObj = document.getElementById(comboName);
	
	var selectedIndex = comboObj.selectedIndex;
	var label = ''
	label = comboObj.options[selectedIndex].text;
	return label;
}

/**
  Author: Sumit Sundriyal
  Date Created : 09/05/2007
  About : This function disable the current event. This is used in 
  		  manually writing of file in file input field. 
*/
function restrictCopyingIntoInputField(e){
   //e.which is for netscape 2.0
   var key = window.event ? e.keyCode : e.which;
   
	if (key == 13)
	StartClick();
	e.cancelBubble = true;
	e.returnValue = false;
	return false;
}
	
	

/**
* Author 					: Shantanu Bansal
  Date Created 				: 10/05/2007
  About 					: This method is used to get font url for download.
  @param OS               	: This variable contains the OS.
  @param language 			: Contains the language.
  @param action				: Contains the name of the action on the basis of the that action class will 
                 		      execute the code.
  @param fontUrl 			: Contains the font URL from which font will download.
*/
function getFontURL(OS,language,action,fontUrl)
{	
	
	if( trim(OS) == '' )
	{
		alert('Operating System is required.');
		return false;
		
	}

	if( trim(language) == '' )
	{
		alert('Language is required.');
		return false;
	}

	if( (trim(OS) != '') && (trim(language) != '') )
	{
	var txtObj = fontUrl;	
    var strURL=action+"?OS="+OS+"&language="+language;
    
    var xmlReqObj;
    xmlReqObj = getXMLHttpRequest(strURL);	
    xmlReqObj.onreadystatechange = function() {	
        if (xmlReqObj.readyState == 4) {
            try{           		
				if(xmlReqObj.responseXML != null){	
				 	
				 	fontUrl = (xmlReqObj.responseXML.getElementsByTagName('fontUrl')[0]).firstChild.data;		 	  		

				    if(fontUrl != ""){		      
				      txtObj.value = fontUrl;
				      location.href = fontUrl;
				    }
				    else {
				      txtObj.value = '';
				    }
				 } 
				    
		    }catch( e){		 	
		      alert(' exception occurecd '+e);
		    }
        }
    }
    xmlReqObj.send(null);
    }
}


/**
* Author 					: Shantanu Bansal
  Date Created 				: 10/05/2007
  About 					: This method is used to get font family and size.
  @param language 			: Contains the language id.
  @param action				: Contains the name of the action on the basis of the that action class will 
                 		      execute the code.
  @param fontfamily 		: Contains the font family object.
  @param fontSize 			: Contains the font size.
*/
function getFontFamilySize(languageId,action,fontfamily,fontSize)
{	if( trim(languageId) != '' )
	{
    var strURL=action+"?languageId="+languageId;
    	
    var xmlReqObj;
    xmlReqObj = getXMLHttpRequest(strURL);	
    xmlReqObj.onreadystatechange = function() {	
        if (xmlReqObj.readyState == 4) {
            try{           		
				if(xmlReqObj.responseXML != null){	
				 	
				 	ff = (xmlReqObj.responseXML.getElementsByTagName('fontfamily')[0]).firstChild.data;		 	  		
				 	fs = (xmlReqObj.responseXML.getElementsByTagName('fontSize')[0]).firstChild.data;		 	  		
				    if(ff != ""){		      
				      fontfamily.value = ff;
				      fontSize.value = fs;
				    }
				    else {
				      fontfamily.value = ff;
				      fontSize.value = fs;
				    }
				    changeState(fontfamily.form);
				 } 
				    
		    }catch( e){		 	
		      alert(' exception occurecd '+e);
		    }
        }
    }
    xmlReqObj.send(null);
    }
}


/**
* Author 					: Shantanu Bansal
  Date Created 				: 10/05/2007
  About 					: This method is used to get font family and size.
  @param language 			: Contains the language id.
  @param action				: Contains the name of the action on the basis of the that action class will 
                 		      execute the code.
  @param fontfamily 		: Contains the font family object.
  @param fontSize 			: Contains the font size.
*/
function getFontFamilySizePreview(languageId,action,message,subject)
{

	if( languageId != '' )
	{
    var strURL=action+"?languageId="+languageId;
    	
    var xmlReqObj;
    xmlReqObj = getXMLHttpRequest(strURL);	
    xmlReqObj.onreadystatechange = function() {	
        if (xmlReqObj.readyState == 4) {
            try{           		
				if(xmlReqObj.responseXML != null){	
				 	
				 	ff = (xmlReqObj.responseXML.getElementsByTagName('fontfamily')[0]).firstChild.data;		 	  		
				 	fs = (xmlReqObj.responseXML.getElementsByTagName('fontSize')[0]).firstChild.data;		 	  		
				    if(ff != ""){		    
				    
				 	message.style.fontFamily = ff;
				 	subject.style.fontFamily = ff;
				
				 	message.style.fontSize = fs;
				 	subject.style.fontSize = fs;
				      
				    }
				    else {
				 	message.style.fontFamily = ff;
				 	subject.style.fontFamily = ff;
				
				 	message.style.fontSize = fs;
				 	subject.style.fontSize = fs;
				    }
				 } 
				    
		    }catch( e){		 	
		      alert(' exception occurecd '+e);
		    }
        }
    }
    xmlReqObj.send(null);
    }
}
	


/*
  Author : Shantanu Bansal
  Date   : 16/05/2007
  About  : This function is used to get the list of states on the basis of country 
  			and sets value passed as selected value for state combo
*/
function getState(countryId,comboToBePopulate,action,selectedValue){
	if(countryId != '')
	{
   // var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
	    var strURL = action+"?countryId="+countryId;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);    
	   // var propObj = eval('document.prepaiduserdtlForm.'+comboToBePopulate);
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {       
	            propObj.length    = 0; 
	            propObj.options[0] = new Option("--Select--","");
	            
	        	var StateXML      = xmlReqObj.responseXML.getElementsByTagName('StateName')[0];        	
			 	stateNameAll 	  = StateXML.firstChild.data;		 	
	    		var stateName 	  = new Array();    		
				stateName 		  = stateNameAll.split(',');			
			    var StateIdXML 	  = xmlReqObj.responseXML.getElementsByTagName('StateId')[0];		    
			 	var stateIdAll    = StateIdXML.firstChild.data;
	    		var stateId       = new Array();
				stateId           = stateIdAll.split(',');
				
				
					for(var counter=1;counter<stateName.length;counter++)
					{
						propObj.options[counter] = new	Option(stateName[counter],stateId[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == selectedValue){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
	         }
			 	
	    }
	    xmlReqObj.send(null);
	}
  
}
/*
	Author : Suresh Narula
	Date   :  08/06/2007
	About  : This function is used to get Rtrim and Ltrim.
*/

 function Trim(s)
	 {
	 
		return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
    }

/*
	Author : Shantanu Bansal
	Date   : 16/05/2007
	About  : This function is used to get the list of circles
			and sets value passed as selected value for circle combo
*/
function getCircle(userType,comboToBePopulate,action,selectedValue){

	if(userType!='')
	{
	   // var txtObj = eval('document.'+formName+'.'+textBoxTobeDisplay);	
	    var strURL = action+"?circleList=yes&ut="+userType;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);    
	   // var propObj = eval('document.prepaiduserdtlForm.'+comboToBePopulate);
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {       
	            propObj.length    = 0; 
	            propObj.options[0] = new Option("--Select--","");
	            
	        	var CircleXML      = xmlReqObj.responseXML.getElementsByTagName('CircleName')[0];        	
			 	circleNameAll 	  = CircleXML.firstChild.data;		 	
	    		var circleName 	  = new Array();    		
				circleName 		  = circleNameAll.split(',');			
			    var CircleIdXML 	  = xmlReqObj.responseXML.getElementsByTagName('CircleId')[0];		    
			 	var circleIdAll    = CircleIdXML.firstChild.data;
	    		var circleId       = new Array();
				circleId           = circleIdAll.split(',');
				
					for(var counter=1;counter<circleName.length;counter++)
					{
						propObj.options[counter] = new	Option(circleName[counter],circleId[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == selectedValue){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
	         }
			 	
	    }
	    xmlReqObj.send(null);
	}
}	

/*
	Author : Shantanu Bansal
	Date   : 16/05/2007
Decription	: Used to get regions based on circle ids
		and sets value passed as selected value for region combo
*/
function getRegion(circleId,comboToBePopulate,action,selectedValue)
{	
	if( circleId != '' )
	{
	    var strURL = action+"?circleId="+circleId;
	    var xmlReqObj;    
	    var propObj = document.getElementById(comboToBePopulate);        
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() 
	    {	
	        if (xmlReqObj.readyState == 4) 
	        {        
	        	var RegionXML      = xmlReqObj.responseXML.getElementsByTagName('RegionName')[0];        	
			 	regionNameAll 	   = RegionXML.firstChild.data;	 	
	    		var regionName 	   = new Array();    		
				regionName 		   = regionNameAll.split(',');			
			    var RegionIdXML    = xmlReqObj.responseXML.getElementsByTagName('RegionId')[0];		    
			 	var regionIdAll    = RegionIdXML.firstChild.data;
	    		var regionId       = new Array();
				regionId           = regionIdAll.split(',');
				
				propObj.length      = 0;
	            propObj.options[0] = new	Option("--Select--","");
					for(var counter=1;counter<regionName.length;counter++)
					{
						propObj.options[counter] = new	Option(regionName[counter],regionId[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					if(propObj.length <= 1 )
					{
					 propObj.options[0].selected = true;
					 
					}
					else 
					{
						for(var v=0;v<propObj.length;v++)
						{
						   if(propObj.options[v].value == selectedValue)
						   {
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
					if(regionName.length<=0)
					{
						alert('No Region found for the selected Circle.');
					}
					
	
	        }
			 	/*POName = (xmlReqObj.responseXML.getElementsByTagName('FPOName')[0]).firstChild.data;		 	  		
			    POId   = (xmlReqObj.responseXML.getElementsByTagName('FPOId')[0]).firstChild.data;		    
			    if(POName != ""){		      
			      txtObj.value = POName;
			    }
			    else {
			      txtObj.value = 'Invalid Pin Code';
			    }*/		 	
	        //}
	    }
	    xmlReqObj.send(null);
	}
}

/*
	Author : Shantanu Bansal
	Date   : 16/05/2007
	  About  : This function is used to get the list of District combo on the basis of state combo
		and sets value passed as selected value for district combo
*/

function getDistrict(stateId,comboToBePopulate,action,selectedValue){
   	
   	if( stateId != '' )
   	{
	    var strURL = action+"?stateId="+stateId;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);    
	  
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {       
	            propObj.length    = 0; 
	            propObj.options[0] = new	Option("--- Select ---","");
	            
	        	var DistrictXML      = xmlReqObj.responseXML.getElementsByTagName('DistrictName')[0];        	
			 	districtNameAll 	  = DistrictXML.firstChild.data;		 	
	    		var districtName 	  = new Array();    		
				districtName 		  = districtNameAll.split(',');			
			    var DistrictIdXML 	  = xmlReqObj.responseXML.getElementsByTagName('DistrictId')[0];		    
			 	var districtIdAll    = DistrictIdXML.firstChild.data;
	    		var districtId       = new Array();
				districtId           = districtIdAll.split(',');
				
				
					for(var counter=1;counter<districtName.length;counter++)
					{
						propObj.options[counter] = new	Option(districtName[counter],districtId[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == selectedValue){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
	
	        }
			 	
	    }
	    xmlReqObj.send(null);
  	}
}

 /*
	Author : Shantanu Bansal
	Date   : 16/05/2007
 	About  : This function is used to get the Postoffice on the basis  district
		and sets value passed as selected value for Postoffice combo
*/




function getPostOfficeByDistrictandUserType(districtId,userType,comboToBePopulate,action,selectedValue){
   	
    if ( (trim(districtId)!='') && (trim(userType)!='') )
    {
	    var strURL = action+"?districtId="+districtId+"&post=true&userType="+userType;
	    var xmlReqObj;
	    var propObj = document.getElementById(comboToBePopulate);    
	  
	    xmlReqObj   = getXMLHttpRequest(strURL);	
	   
	    xmlReqObj.onreadystatechange = function() {	
	        if (xmlReqObj.readyState == 4) {       
	            propObj.length    = 0; 
	            propObj.options[0] = new	Option("-- Select --","");
	            
	        	var PostofficeXML = xmlReqObj.responseXML.getElementsByTagName('Pincode')[0];        	
			 	postOfficeAll 	  = PostofficeXML.firstChild.data;		 	
	    		var postOfficeArr 	  = new Array();    		
				postOfficeArr 		  = postOfficeAll.split(',');	
						  
	        	var pincodeXML = xmlReqObj.responseXML.getElementsByTagName('PostofficeId')[0];        	
			 	pincodeAll 	  = pincodeXML.firstChild.data;		 	
	    		var pincodeArr 	  = new Array();    		
				pincodeArr 		  = pincodeAll.split(',');	
				
					for(var counter=1;counter<pincodeArr.length;counter++)
					{
						propObj.options[counter] = new	Option(postOfficeArr[counter],pincodeArr[counter]);
					}
					
					// Following if condition will select the option which have the value ""(blank)
					
					if(propObj.length <= 1 ){
					 propObj.options[0].selected = true;
					}
					else {
						for(var v=0;v<propObj.length;v++){
						   if(propObj.options[v].value == selectedValue){
						      propObj.options[v].selected = true;
						      break;
						   }
						}
					}
	
	        }
			 	
	    }
	    xmlReqObj.send(null);
    }
  
}
var textAreaOldValue = "";

function checkMaxRow (textarea, textarealabel, maxrow, maxCharInARow,evt) {
    var keyCode = evt.keyCode;
    //alert(keyCode);
    if(keyCode == 35 || keyCode == 36 || keyCode == 37 || keyCode == 38 || keyCode == 39 || keyCode == 40 || keyCode == 8 || keyCode == 46){
      return true;
    }
    else {
		var arr = textarea.value.match(new RegExp("\n","g"));
		var lengthOfArr = 0; 
		if(arr == null){
		  // if there is no carriage return that means there is only sigle line printed on textarea yet.	  		
			if(textarea.value.length < (maxCharInARow+1)){		    
			    return true;
			}
			else {		 		 
				if(keyCode == 13 ||  keyCode == 35 || keyCode == 36 || keyCode == 37 || keyCode == 38 || keyCode == 39 || keyCode == 40 || keyCode == 8 || keyCode == 46){
					return true;
				}
				else {
					alert("You can not enter more than "+maxCharInARow+" in a row.");
		 		    return false;
	 		    }
	 		}
		}
		/*else if(arr.length > (maxrow-1)){
			var keyCode = evt.keyCode;			 		 
			if( keyCode == 37 || keyCode == 38 || keyCode == 39 || keyCode == 40 || keyCode == 8){
				return true;
			}
			else {
		   		alert("You can not enter more than "+maxrow+" lines in "+textarealabel );
		   		return false;
		    }
		}*/
		else {
			return checkLenOfCharInEachLineOfTextAreaContent(textarea, textarealabel, maxrow, arr, maxCharInARow, evt);
		}	
	}
}
function checkLenOfCharInEachLineOfTextAreaContent(textarea, textarealabel, maxrow, arrOfCarrReturn, maxCharInARow, evt){
	var flag = true;
	var keyCode = evt.keyCode;
  	if(textarea.value != null){
		var tempArr = textarea.value.split('\n');
		if(tempArr != null){
			if(tempArr.length == maxrow && evt.keyCode == 13){
				alert("You can not enter more than "+maxrow+" lines in "+textarealabel);
				flag = false;
			}
			else{
				for(var i=0; i<tempArr.length; i++){	
				//alert(tempArr[i].length +" > "+maxCharInARow)	
					if(i==0){
						if((tempArr[i].length) > (maxCharInARow+1)){
							if(keyCode == 13 || keyCode == 35 || keyCode == 36 || keyCode == 37 || keyCode == 38 || keyCode == 39 || keyCode == 40 || keyCode == 8 || keyCode == 46 ) {
								return true;
							}
							else {			   		
						   			alert("1 Max character limit exceeded in "+textarealabel+" at line no. "+(i+1)+".");
						   		flag = false;
						   		break;
					   		}
				   		}
					}
					else {
				   		if((tempArr[i].length) > (maxCharInARow)){	
				   			if(keyCode == 13 || keyCode == 35 || keyCode == 36 || keyCode == 37 || keyCode == 38 || keyCode == 39 || keyCode == 40 || keyCode == 8 || keyCode == 46 ) {
								return true;
							}
							else {		   		
					   			alert("2 Max character limit exceeded in "+textarealabel+" at line no. "+(i+1)+".");
					   			return false;
					   			//flag = false;
					   			//break;
					   		}
				   		}
				   		else {
				   		    return true;
				   		}
					}
				}
				//flag = true;
			}
			
			
			return flag;
		}
	}
}



