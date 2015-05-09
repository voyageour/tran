<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		

		<%@ include file="../../resources/includes/titleAndMeta.jsp" %>
		
		<!-- script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script> -->
		<script type="text/javascript" src="../resources/jQuery/jquery-1.7.2.js"></script>
		
		
		<!-- <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script> -->
		<script src="../resources/jQuery/jquery-ui-1.10.3.js"></script>
		
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	
	
		<link href="../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css" />

		<!-- MENUBAR STARTED -->
		<link rel="stylesheet" href="../../resources/SimplejQueryDropdowns/css/style.css" type="text/css" media="screen, projection"/>
		<script type="text/javascript" language="javascript" src="../../resources/SimplejQueryDropdowns/js/jquery.dropdownPlain.js"></script>
		<link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />	
		<!-- MENUBAR ENDED -->
		
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <script type="text/javascript" src="../resources/token-input/src/jquery.tokeninput.js"></script>
	    <link rel="stylesheet" href="../resources/token-input/styles/token-input.css" type="text/css" />
	    <!-- <link rel="stylesheet" href="../resources/token-input/styles/token-input-facebook.css" type="text/css" /> -->
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->
		
		<!-- STYLISH BUTTON START -->
		<style>
			.myButton {
				-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
				-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
				box-shadow: inset 0px 1px 0px 0px #ffffff;
				background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff
					), color-stop(1, #f6f6f6) );
				background: -moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',
					endColorstr='#f6f6f6', GradientType=0 );
				background-color: #ffffff;
				-moz-border-radius: 6px;
				-webkit-border-radius: 6px;
				border-radius: 6px;
				border: 1px solid #dcdcdc;
				display: inline-block;
				color: #666666;
				font-family: arial;
				font-size: 15px;
				font-weight: bold;
				padding: 6px 24px;
				text-decoration: none;
				text-shadow: 0px 1px 0px #ffffff;
			}
			
			.myButton:hover {
				background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6
					), color-stop(1, #ffffff) );
				background: -moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6',
					endColorstr='#ffffff', GradientType=0 );
				background-color: #f6f6f6;
			}
			
			.myButton:active {
				position: relative;
				top: 1px;
			}
		</style>
		<!-- STYLISH BUTTON END -->
			
		<script type="text/javascript">
	        $(document).ready(function(){
	            $(".dropdown").hover(            
	                function() {
	                    $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
	                    $(this).toggleClass('open');        
	                },
	                function() {
	                    $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
	                    $(this).toggleClass('open');       
	                }
	            );
	        });
	    </script>
    
	    <style type="text/css">
		   	.navbar-fixed-top{
		   		background-color: #f8f8f8;
				border-color: #e7e7e7;
		   	}
		</style>
	    
	    
	    <script type="text/javascript">
    $(document).ready(function(){
		if($("#appSelection").val()==0){
			$("#menuCarpool").css("display","none");
	    	$("#menuTransport").css("display","block");
	    	
	    	$("#header_right_transport").css("display","block");
	    	$("#header_right_carpool").css("display","none");
	    	
		}else{
			$("#menuCarpool").css("display","block");
	    	$("#menuTransport").css("display","none");
	    	
	    	$("#header_right_carpool").css("display","block");
	    	$("#header_right_transport").css("display","none");
	    	
		}
    });
	</script>
	
	<style type="text/css">
	.dropDownApp{	
		display: block;
		width: 100%;
		height: 34px;
		padding: 6px 12px;
		font-size: 14px;
		line-height: 1.428571429;
		color: #555;
		vertical-align: middle;
		background-color: #fff;
		background-image: none;
		border: 1px solid #ccc;
		border-radius: 4px;
		margin-top: 7px;
	}
	</style>
	    
	     <script type="text/javascript">
	    $(document).ready(function(){
			$("#appSelection").on('change', function() {
			   
			    if(this.value==0){ //TRANSPORT
			    	document.location.href = "../transport/home";		    	
			    }else{ //CARPOOL
			    	document.location.href = "../carpool/home";
			    }
			});
	    });
		</script>
	    
		<!-- FIELDSET START -->
			<link rel="stylesheet" href="../resources/fieldset/fieldset.css" type="text/css" />
		<!-- FIELDSET END -->


		<!-- ZEBRA DATEPICKER START -->
	        <link rel="stylesheet" href="../resources/datepicker/zebra_datepicker.css" type="text/css">
	
	        <script type="text/javascript" src="../resources/datepicker/zebra_datepicker.js"></script>
	        <script type="text/javascript" src="../resources/datepicker/functions.js"></script>	 
		<!-- ZEBRA DATEPICKER END -->

		<!-- DIALOG START -->
			
	        <link rel="stylesheet" href="../resources/dialogBox/zebra_dialog.css" type="text/css">
	        <script type="text/javascript" src="../resources/dialogBox/zebra_dialog.js"></script>
	        <script type="text/javascript" src="../resources/dialogBox/functions.js"></script>
		<!-- DIALOG END -->
		
		
		
	</head>
	
	
	
	
	
	
	
	
	
	
	<body id="home">
		
<sec:authorize var="loggedIn" access="isAuthenticated()" />
	<nav class="navbar-default-custom navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#"></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
			  
			  		<c:choose>
						<c:when test="${loggedIn}">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%= request.getUserPrincipal().getName() %><span class="caret"></span></a>
					 			<ul class="dropdown-menu" role="menu">
				                  <li><a href="<c:url value="/j_spring_security_logout"/>">Sign Out</a></li>
				                </ul>	
			                </li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="../login.jsp" id="login" style="color: black;"> <b>Login</b> </a>
							</li>
						</c:otherwise>
					</c:choose>
					
              
<!--               <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Transport <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Carpool</a></li>
                </ul>
              </li> -->
           	
	           	<li>
		           	<select class="dropDownApp" name="appSelection" id="appSelection">
					  <option value="0">Transport</option>
					  <option value="1" selected="selected">Carpool</option>
					</select>
	           	</li>
          </ul>
          
        </div>
      </div>
    </nav>
    
	
		<div id="templatemo_wrapper">
    		<%@ include file="../../resources/includes/header.jsp" %> 
   	 		<%@ include file="../../resources/includes/userMenu.jsp" %>
    		<div style="margin: 20px;"></div>
			<div id="templatemo_main_top"></div>
    		<div id="templatemo_main">
       			<div id="content" style="width: 90%;">        
        			
			        <form:form action="updateUserAccountData.jsp" id="updateUserAccountData" commandName="User" >    
						<div id="wrapper">
							
							<div id="page">	    
								<div id="container">
					
								<fieldset>   
								  	<legend style="height:88px;width:91px;background-image: url(../../images/dl/lock-key.jpg); margin-left:65px;"></legend>
		
										<table width="100%" style="margin: 10px 10px 10px 10px;" border="0">
											<tr>
												<td width="51%" height="40px" valign="middle">
													Email Id :  
												</td>	
												<td align="left">
													<form:label path="emailId">${User.emailId}</form:label>
												</td>
												<td width="50%" align="right"><a href="changePassword.jsp" id="exampleChangePass1" class="myButton">Change Password</a></td>
											</tr>
					
											<tr>	
												<td width="50%">
													Enter User Name *: 
												</td>
												<td align="left" id="userNameTD">
													<form:input path="userName" id="userName" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												<td width="50%" align="right"><a href="profilePictureSettings.jsp" id="exampleChangePass1" class="myButton">Change Profile Picture</a></td>
											</tr>
																				
											<tr>	
												<td width="50%">
													Enter Primary Contact Number *: 
												</td>
												<td align="left" id="primaryContactNumberTD">
													<form:input path="primaryContactNumber" id="primaryContactNumber" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												<td width="50%"></td>
											</tr>
											
											<tr>	
												<td width="50%">
													Enter Secondary Contact Number :
												</td>
												<td align="left" id="secondaryContactNumberTD">
													<form:input path="secondaryContactNumber" id="secondaryContactNumber" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												<td width="50%"></td>
											</tr>
										
								
											<tr>	
												<td width="50%">
													Gender
												</td>
												<td align="center">
														<div id="holder">
													 		<div>
																<div class="button-holder">
																	<form:radiobutton path="gender" id="genderMale" name="gender" value="1" cssClass="regular-radio" />
																	<label for="genderMale"></label>Male
																	
																	<form:radiobutton path="gender" id="genderFemale" name="gender" value="0" cssClass="regular-radio" />
																	<label for="genderFemale"></label>Female															
																</div>
															</div>
														</div>							 
												</td>
												<td width="50%"></td>
											</tr>
											
											<tr>
												<td width="50%">
													Date of Birth *:
												</td>	
												<td align="left" id="dobTD">
													<c:set var="year" value="${fn:substring(User.dob, 0, 4)}" />
													<c:set var="month" value="${fn:substring(User.dob, 5, 7)}" />
													<c:set var="day" value="${fn:substring(User.dob, 8, 10)}" />
													<c:set var="sep" value="/" />
													
													
													<input id="datepicker-example8" name="dob" style="width: 170px;" class="ui-timepicker-hour" value="${year}${sep}${month}${sep}${day}"/>
												</td>
												<td width="50%"></td>
											</tr>
											
										</table>
									</fieldset>
			
			
									<fieldset>   
									  	<legend style="height:87px;width:103px;background-image: url(../../images/dl/Home.png); margin-left:65px;"></legend>
										<table width="798" style="margin: 10px 10px 10px 10px;" border="0">
										
											<tr>
												<td valign="top">
													Enter Address :
												</td>
												<td align="left" width="470px">
													  <form:textarea path="address.singleAddress" id="singleAddress" cssStyle="width: 470px; height: 100px;" cssClass="address_textarea"/>
												</td>
																						
											</tr>
											<tr>	
												<td>
													Enter City Name *:
												</td>
												<td align="left" width="170px">
													<form:input path="address.cityName" id="cityName" value="Bangalore" readonly="true" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												
											</tr>	
											<tr>
												<td>
													Enter State Name *:
												</td>	
												<td align="left" width="170px">
													<form:input path="address.stateName" id="stateName" value="Karnataka" readonly="true" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												
											</tr>
											<tr>
												<td>
													Enter Country Name *: 
												</td>	
												<td align="left" width="170px">
													<form:input path="address.countryName" id="countryName" value="India" readonly="true"  cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												
											</tr>
											
										</table>
									</fieldset>
			
									
					   				<a href="javascript:void(0)" id="example33341" class="myButton">Submit</a>
								</div> 
								<div style="clear: both;">&nbsp;</div>
							</div>	
						 	
						</div>
						<!-- FOOTER TEXT START -->
							
						<!-- FOOTER TEXT START -->
					</form:form>
					
        		</div> <!-- END of content -->
        		<div class="cleaner"></div>
    		</div> <!-- END of main -->
    
			<%@ include file="../../resources/includes/footer.jsp" %>
		</div>

	</body>
	
</html>

