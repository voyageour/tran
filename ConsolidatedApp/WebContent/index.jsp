<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
	
		<!-- TITLE Start -->
		<%@ include file="resources/includes/titleAndMeta.jsp" %>	
		<!-- TITLE End -->
	
		<!-- FAVICO Start -->
			<link href="images/favicon/favicon.ico" rel="shortcut icon" type="image/x-icon" />
		<!-- FAVICO END -->
	
		<link rel="stylesheet" type="text/css" href="resources/css/a.css">
		<link rel="stylesheet" type="text/css" href="resources/css/logins.css">
		<link rel="stylesheet" href="resources/dialogBox/zebra_dialog.css" type="text/css">
		
		<script type="text/javascript" src="resources/dialogBox/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="resources/dialogBox/zebra_dialog.js"></script>
		<script type="text/javascript" src="resources/dialogBox/functions.js"></script>
		<script type="text/javascript" src="resources/js/dojo.js" data-dojo-config="parseOnLoad: true, usePlainJson: true"></script>
		<script type="text/javascript" src="resources/js/mccommon.js"></script>

	
		<script type='text/javascript'>
			function validateForm() {
								
				var emailId1 = document.getElementById("emailId");
				var password = document.getElementById("password");
						
				if (emailId1.value.trim() == "") {
				
					 $.Zebra_Dialog('Please enter your Email id.', {
					  		'type':  'information',
					    	'title': 'Login Status'
					 });
				
					document.getElementById("emailId").value = "";
					emailId1.setAttribute("style","outline: none; border-color: #9ecaed; box-shadow:0 0 5px red");
					
					return false;
				}else{
					emailId1.setAttribute("style","background-color: #fbfbfb; border: 1px solid #ccc");
				}
		
				var emailVal = emailId.value;
				var re = new RegExp(
						/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i);
				if (!emailVal.match(re)) {
					$.Zebra_Dialog('Email Id provided is not valid.', {
				  		'type':  'information',
				    	'title': 'Password Updation Status'
				 	});
				
					document.getElementById("emailId").value = "";
					emailId1.setAttribute("style","outline: none; border-color: #9ecaed; box-shadow:0 0 5px red");
					
					return false;
				}else{
					emailId1.setAttribute("style","background-color: #fbfbfb; border: 1px solid #ccc");
				}
				
				if (password.value.trim() == "") {
					$.Zebra_Dialog('Please enter your password.', {
				  		'type':  'information',
				    	'title': 'Login Status'
				 	});
				 	
					document.getElementById("password").value = "";
					password.setAttribute("style","outline: none; border-color: #9ecaed; box-shadow:0 0 5px red");
					
					return false;
				}else{
					password.setAttribute("style","background-color: #fbfbfb; border: 1px solid #ccc");
				}
				
				document.getElementById("submitButton").value = "Please wait...";
				return true;
			}
		</script>		


	</head>

	<body id="login" class="new_teal">
	
		<div id="fb-root"></div>
		<script>
		  // Additional JS functions here
		  window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '281775285199536', // App ID
		      channelUrl : 'http://localhost:8080/Carpool', // Channel File
		      status     : true, // check login status
		      cookie     : true, // enable cookies to allow the server to access the session
		      xfbml      : true  // parse XFBML
		    });
		    
		    FB.getLoginStatus(function(response) {
		    	  if (response.status === 'connected') {
		    		  console.log('NA 0');
		    	    
		    	  } else if (response.status === 'not_authorized') {
		    		  console.log('NA 1');
		    	  } else {
		    		  console.log('NA 2');
		    	  }
		     });
		    
		
		    // Additional init code here
		
		  };
		
		  function login() {
			    FB.login(function(response) {
			        if (response.authResponse) {
			        	 console.log('NA 3');
			        	testAPI();
			        } else {
			        	 console.log('NA 4');
			        }
			    });
			}
		  
		  function testAPI() {
			    console.log('Welcome!  Fetching your information.... ');
			    FB.api('/me', function(response) {
			        console.log('Good to see you, ' + response.name + '.' + response.email);
			   
			        var mypostrequest=new ajaxRequest();
			        
			        mypostrequest.onreadystatechange=function(){
			         if (mypostrequest.readyState==4){
			          if (mypostrequest.status==200 || window.location.href.indexOf("http")==-1){
			        	  console.log('Success....');
			          }
			          else{
			           alert("An error has occured making the request");
			          }
			         }
			        };
			        
			        console.log('Sending.... '+response.email);
			        			        
			        //var parameters="j_username="+ response.email;
			        var parameters="j_username="+ "jayesh.patel";
			        var parameters="j_password="+ "umiyaOM@1234";
			        
			      	mypostrequest.open("POST", "<%=request.getContextPath()%>/j_spring_facebook_security_check", true); 
			        
			        mypostrequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			        mypostrequest.send(parameters);
			        mypostrequest.send(); 
			      
			        
			    });
			}
		  
		  
		  
		  function ajaxRequest(){
			  var activexmodes=["Msxml2.XMLHTTP", "Microsoft.XMLHTTP"]; //activeX versions to check for in IE
			  if (window.ActiveXObject){ //Test for support for ActiveXObject in IE first (as XMLHttpRequest in IE7 is broken)
			   for (var i=0; i<activexmodes.length; i++){
			    try{
			     return new ActiveXObject(activexmodes[i]);
			    }
			    catch(e){
			     //suppress error
			    }
			   }
			  }
			  else if (window.XMLHttpRequest) // if Mozilla, Safari etc
			   return new XMLHttpRequest();
			  else
			   return false;
			 }
		  
		  
		  // Load the SDK Asynchronously
		  (function(d){
		     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
		     if (d.getElementById(id)) {return;}
		     js = d.createElement('script'); js.id = id; js.async = true;
		     js.src = "//connect.facebook.net/en_US/all.js";
		     ref.parentNode.insertBefore(js, ref);
		   }(document));
		</script>
 		<script src="//connect.facebook.net/en_US/all.js"></script>
		
 
		<div id="login-box">
			<div id="outer-content">
				<div id="inner-content">
					<div id="av-flash-block"></div>
						<div id="content">
							<div id="login-image"></div>
								<center><span style="font-family: cursive; font: small-caps; font-weight: normal; font-size: 20px"> -- We can't help everyone but Everyone can help someone. -- </span></center>
								<center><span style="font-family: cursive; font: small-caps; font-weight: normal; font-size: 14px"> -- Together We Can. -- </span></center>
								<center><span style="font-weight: normal; font-size: 24px;"> <img alt="" src="images/onmobile/fin.gif" style="padding-left: 60%;"> </span></center>
								
								<center><span style="font-weight: normal; font-size: 24px; padding-left: 30%;" > Green Footprints  </span></center>
							
							<div id="login-form-wrap">
									
								<div id="page-heading" class="page-heading"></div>
								<div id="av-content">

								
									<form action="<%=request.getContextPath()%>/j_spring_security_check" method='POST' id="login-form" onsubmit="return validateForm()">
									<input type="hidden" value="<%=request.getContextPath()%>" id="contextPath">

										<fieldset>
											<legend>Secure Login</legend>
											<div class="login-field above-below15 above30 clear">
												<label for="username" class="placeholder " >Email Id</label> 
												<input type="text" name="j_username" tabindex="1" class=" av-text" value="" id="emailId">
												<a href="/login/forgot-username/" class="login-forgot-toggle show-forgot-user"></a>
											</div>
							
											<div class="login-field above-below15">
												<label for="password" class="placeholder" >Password</label> 
												<input type="password" name="j_password" tabindex="2" class=" av-text" value="" id="password">
												<a href="jsp/resetPasswordPageRequest.jsp" class="login-forgot-toggle show-forgot-pass">I forgot</a>
											</div>
							
											<table border="1" style="background-color: inherit; border: none;">
												<tr>
													<td><input type="submit" value="log in" class="button float-left" id="submitButton" tabindex="3"></td>
												    <!-- <td align="left" valign="center" width="350px">  <a href="javascript:login();"><img src="images/fb/facebook_login_button.png" height="30px" width="200px"></img> </a></td>  -->
				  							        <td align="left" valign="center" width="350px"> 	<a href="javascript:void(0)" id="example12340" class="classname1"> <img alt="" height="45px" width="220px" src="images/fb/onm.png" /> </a> </td> 
												</tr>
											</table>	

											<p class="above30 clear">
												
											</p>
										</fieldset>
									</form>
			
		
									<script type="text/javascript">								        document.getElementsByTagName('html')[0].className += " new_teal";								    </script>
	   							</div>
								<br class="clear">
							</div>
						<br class="clear">
					</div>
				</div>
			</div>
		</div>



		<% if(request.getParameter("status")!=null){ %>	
			<script type="text/javascript">
			var status = "<%=request.getParameter("status")%>";
			
			var message = "";
			if(status=='1'){
				message = "Invalid Email Id or Password.";
			}
			
			if(status=='4'){
				message = "Your account is inactive, Please activate it by clicking on link provided on your Email id registered with us.<br><br>";
				message = message + "If you like us to resend the activation link then <a href='jsp/resendActivationLinkPage.jsp'> click here </a> ";
				
			}
			
			if(status=='5'){
				message = "There is some error connecting with OnMobile Active Directory which handles authentication.<br><br>";
			}
			
			$(document).ready(function() {
			 	 $.Zebra_Dialog(''+message, {
			  		'type':  'information',
			    	'title': 'Account Status.'
				  });
			});
			
			</script>  	
		<% } %>


		<% if(request.getParameter("userActivationStatus")!=null){ %>	
			<script type="text/javascript">
			var userActivationStatusMessage = "<%=request.getParameter("userActivationStatus")%>";
			$(document).ready(function() {
			 	 $.Zebra_Dialog(''+userActivationStatusMessage, {
			  		'type':  'information',
			    	'title': 'Password Updation Status'
				  });
			});
			</script>  	
		<% } %>



		<% if(request.getParameter("logout")!=null){ %>	
			<script type="text/javascript">
			var logout = "<%=request.getParameter("logout")%>";
			var message = "";
			if(logout=='success'){
				message="You are successfully logged out.";
			}else{
				message="There is some problem while destroying your session, Please delete your browser cookies.";
			}
			$(document).ready(function() {
			 	 $.Zebra_Dialog(''+message, {
			  		'type':  'information',
			    	'title': 'Logout Status'
				  });
			});
			</script>  	
		<% } %>


		<% if(request.getParameter("emailSendNotificationMessage")==null){ %>
		
		
			<% if(request.getParameter("userAddStatus")!=null){ %>	
				<script type="text/javascript">
				var userAddStatus = "<%=request.getParameter("userAddStatus")%>";
				$(document).ready(function() {
				 	 $.Zebra_Dialog(''+userAddStatus, {
				  		'type':  'information',
				    	'title': 'User Registration Status.'
					  });
				});
				</script>  	
			<% } %>
			
		
		
			<% if(request.getParameter("resetActivationLinkStatus")!=null){ %>	
				<script type="text/javascript">
				var resetActivationLinkStatus = "<%=request.getParameter("resetActivationLinkStatus")%>";
				$(document).ready(function() {
				 	 $.Zebra_Dialog(''+resetActivationLinkStatus, {
				  		'type':  'information',
				    	'title': 'Activation Link Status'
					  });
				});
				</script>  	
			<% } %>
				
				
			<% if(request.getParameter("passwordUpdationstatus")!=null){ %>	
				<script type="text/javascript">
				var passwordUpdationstatus = "<%=request.getParameter("passwordUpdationstatus")%>";
				$(document).ready(function() {
				 	 $.Zebra_Dialog(''+passwordUpdationstatus, {
				  		'type':  'information',
				    	'title': 'Password Updation Status'
					  });
				});
				</script>  	
			<% } %>
			
			
		
		<% }else{ %>
		
			<script type="text/javascript">
				var emailSendNotificationMessage = "<%=request.getParameter("emailSendNotificationMessage")%>";
				$(document).ready(function() {
				 	 $.Zebra_Dialog(''+emailSendNotificationMessage, {
				  		'type':  'information',
				    	'title': 'User Registration Status.'
					  });
				});
			</script>
		
		
		<% }  %>
		

			
	</body>
</html>
