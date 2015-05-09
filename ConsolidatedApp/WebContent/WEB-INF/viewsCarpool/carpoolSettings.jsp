<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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


		<!-- FIELDSET START -->
			<link rel="stylesheet" href="../resources/fieldset/fieldset.css" type="text/css" />
		<!-- FIELDSET END -->

		<!-- TIMEPICKER START -->
		    <link rel="stylesheet" href="../resources/timepicker/jquery.ui.timepicker.css?v=0.3.1" type="text/css" />
		    <link rel="stylesheet" href="../resources/timepicker/custom.css" type="text/css" />
		    
		    
		    <script type="text/javascript" src="../resources/timepicker/jquery.ui.timepicker.js?v=0.3.1"></script>
		<!-- TIMEPICKER END -->


		<!-- DIALOG START -->
	        <link rel="stylesheet" href="../resources/dialogBox/zebra_dialog.css" type="text/css">
	        <script type="text/javascript" src="../resources/dialogBox/zebra_dialog.js"></script>
	        <script type="text/javascript" src="../resources/dialogBox/functions.js"></script>
		<!-- DIALOG END -->
	
	
	
	<!-- MULTISELECT DAYS START -->
			<!-- <link rel="stylesheet" type="text/css" href="../resources/multiselectDaysSelection/jquery.multiselect.css" />
			<script type="text/javascript" src="../resources/multiselectDaysSelection/jquery.multiselect.js"></script>			
			<script type="text/javascript">
			$(function(){
			
				$("select").multiselect({
					selectedList: 7
				});
				
			});
			</script> -->
		<!-- MULTISELECT DAYS END -->
		
		
		<!-- ZEBRA DATEPICKER START -->
	        <link rel="stylesheet" href="../resources/datepicker/zebra_datepicker.css" type="text/css">
	  		<link rel="stylesheet" href="../resources/datepicker/style.css" type="text/css">
	        <script type="text/javascript" src="../resources/datepicker/zebra_datepicker_for_letspool.js"></script>
	        <script type="text/javascript" src="../resources/datepicker/functions.js"></script>	

		<!-- ZEBRA DATEPICKER END -->
		
	   	<!-- FEEDBACK PLUGIN START -->
			<script src="../resources/feedbackAtHomePage/jquery.quick-feedback.js" type="text/javascript" charset="utf-8"></script>
			<script>
			$(document).ready(function() {
				 $('body').feedbackTab({tab2: true, tab3: true, tab4: true, feedbackAction: 'general.jsp', tab2Action: 'suggestion.jsp', tab3Action: 'problem.jsp', tab4Action: 'praise.jsp' });
			});
			</script>
			<link rel="stylesheet" href="../resources/feedbackAtHomePage/jquery.quick-feedback.css" type="text/css" charset="utf-8" />
		<!-- FEEDBACK PLUGIN END -->
		

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
	
	#vertical-ticker{	
	height:310px;
	width: 350px;
	overflow:hidden;
	margin-right: 0px;
	}
	
	insidelabel{
	font-family: 'Alegreya', serif;
	font-size: 12px;
	color: #787878;
	line-height: 10px;
	font-style: italic;
	}


	#vertical-ticker li{
		padding:10px 10px;
		display:block;
		color:#787878;
		border-bottom:1px solid #ddd;
		border-top:1px solid #ddd;
		text-align:left;
		font-size:12px;
		font-family:'Alegreya', serif;
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
    
		<!-- CUSTOM FORM VALIDATION FUNCTIONS START -->
		<SCRIPT LANGUAGE="JavaScript">
			function setShemp() {
				var inputElements1 = document.getElementById("carpoolOneWayTwoOptionYes");
				if (inputElements1.checked) {
					var mydiv = document.getElementById("returnRouteSameOptionDiv");
					mydiv.style.display = 'block';
					mydiv.style.visibility = 'visible';
					var leavingDestinationPlaceDiv = document.getElementById("leavingDestinationPlaceDiv");
					leavingDestinationPlaceDiv.style.display = 'block';
					leavingDestinationPlaceDiv.style.visibility = 'visible';
					
					var wantToBeHiddenFromRouteReturnTableDIV = document.getElementById("wantToBeHiddenFromRouteReturnTableDIV");
					wantToBeHiddenFromRouteReturnTableDIV.style.display = 'block';
					wantToBeHiddenFromRouteReturnTableDIV.style.visibility = 'visible';
					
					
					var inputElements2 = document.getElementById("returnRouteSameOptionNo");
					if (inputElements2.checked) {
						var mydiv2 = document.getElementById("officeToHomeRouteDiv");
						mydiv2.style.display = 'block';
						mydiv2.style.visibility = 'visible';
					}else{
						var mydiv1 = document.getElementById("officeToHomeRouteDiv");
						mydiv1.style.display = 'none';			
					}				
					var carpoolOnSpecificDates = document.getElementById("carpoolOnSpecificDates");					
					if(carpoolOnSpecificDates.checked){
						var returningDateTR = document.getElementById("returningDateTR");
						returningDateTR.style.display = 'block';
						returningDateTR.style.visibility = 'visible';
					}
				}else{
					var mydiv = document.getElementById("returnRouteSameOptionDiv");
					mydiv.style.display = 'none';
					var mydiv2 = document.getElementById("officeToHomeRouteDiv");
					mydiv2.style.display = 'none';
					var leavingDestinationPlaceDiv = document.getElementById("leavingDestinationPlaceDiv");
					leavingDestinationPlaceDiv.style.display = 'none';	
					var returningDateTR = document.getElementById("returningDateTR");
					returningDateTR.style.display = 'none';	
					
					var wantToBeHiddenFromRouteReturnTableDIV = document.getElementById("wantToBeHiddenFromRouteReturnTableDIV");
					wantToBeHiddenFromRouteReturnTableDIV.style.display = 'none';	
					
				}
			}
			
			
				
	
		</SCRIPT>

		<SCRIPT LANGUAGE="JavaScript">
			function compensate() {
				var inputElements2 = document.getElementById("compensationPrice");
				if (inputElements2.checked) {
					var mydiv = document.getElementById("compensationPriceDiv");
					mydiv.style.display = 'block';
					mydiv.style.visibility = 'visible';
				}else{
					var mydiv = document.getElementById("compensationPriceDiv");
					mydiv.style.display = 'none';
				}
			}
		</SCRIPT>
		
		<SCRIPT LANGUAGE="JavaScript">
			function returnRouteChoice() {
				var inputElements1 = document.getElementById("returnRouteSameOptionYes");
					
				if (!inputElements1.checked) {
					var mydiv1 = document.getElementById("officeToHomeRouteDiv");
					mydiv1.style.display = 'block';
					mydiv1.style.visibility = 'visible';
				}else{
					var mydiv1 = document.getElementById("officeToHomeRouteDiv");
					mydiv1.style.display = 'none';
				}
			}
		</SCRIPT>
		
		<SCRIPT LANGUAGE="JavaScript">
			function carpoolProvidingOnCheck() {
				var carpoolOnSpecificDays = document.getElementById("carpoolOnSpecificDays");
				if (carpoolOnSpecificDays.checked) {
					
					var daysSelectionDiv = document.getElementById("daysSelectionDiv");
					daysSelectionDiv.style.display = 'block';
					daysSelectionDiv.style.visibility = 'visible';
					
					var specificDateSelectionDiv = document.getElementById("specificDateSelectionDiv");
					specificDateSelectionDiv.style.display = 'none';	
					
					var returningDateTR = document.getElementById("returningDateTR");
					returningDateTR.style.display = 'none';	
					
									
				}else{
					
					var specificDateSelectionDiv = document.getElementById("specificDateSelectionDiv");
					specificDateSelectionDiv.style.display = 'block';
					specificDateSelectionDiv.style.visibility = 'visible';
					
					var carpoolOneWayTwoOptionYesByUser = document.getElementById("carpoolOneWayTwoOptionYes");
					if (carpoolOneWayTwoOptionYesByUser.checked) {
					var returningDateTR = document.getElementById("returningDateTR");
					returningDateTR.style.display = 'block';
					returningDateTR.style.visibility = 'visible';
					}
					
					var daysSelectionDiv = document.getElementById("daysSelectionDiv");
					daysSelectionDiv.style.display = 'none';			
					
				}
			}
		</SCRIPT>
		
		<SCRIPT LANGUAGE="JavaScript">
			function carpoolContactCheck() {
				var emailCheck = document.getElementById("checkbox-1-3");
				if (emailCheck.checked) {

					var emailIdDifferent = document.getElementById("emailIdDifferent");
					emailIdDifferent.style.display = 'none';

				}else{
					var emailIdDifferent = document.getElementById("emailIdDifferent");
					emailIdDifferent.style.display = 'block';
					emailIdDifferent.style.visibility = 'visible';

				}
			}
		</SCRIPT>
		
		
		<!-- CUSTOM FORM VALIDATION FUNCTIONS END -->

	</head>
	<body>
	
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

					<form:form action="updateCarpoolSettings.jsp" id="testconfirmJQUpdate" commandName="Carpooler">    
	  <div id="wrapper">


		<div id="page">	    
			<c:choose>
				<c:when test="${Carpooler ne null}">
					<div id="container">


						<!-- CARPOOLER START AND END DATE START -->
							<%@include file="../../resources/includes/carpool/carpoolSettings/carpoolerDateSelectionOptionsUpdate.jsp" %>
						<!-- CARPOOLER START AND END DATE END -->
	
						<!-- CARPOOLER START AND END TIMING DETAILS START -->
							<%@include file="../../resources/includes/carpool/carpoolSettings/carpoolerSourceToDestinationRouteOptionUpdate.jsp" %>
						<!-- CARPOOLER START AND END TIMING DETAILS END -->
	   
	
						<!-- CARPOOLER RETURN ROUTE DETAILS START -->
							<%@include file="../../resources/includes/carpool/carpoolSettings/carpoolerReturnRouteOptionUpdate.jsp" %>
						<!-- CARPOOLER RETURN ROUTE DETAILS END -->
	
		
		    			<!-- CARPOOLER PREFERENCE START -->
							<%@include file="../../resources/includes/carpool/carpoolSettings/carpoolerPreferenceUpdate.jsp" %>
						<!-- CARPOOLER PREFERENCE END -->
	
		    
	   					<a href="javascript:void(0)" id="example311" class="classname1">Submit</a>

					 </div> 
					</c:when>
						<c:otherwise>
							<center><strong>You have not Carpooled yet, Let's carpool!!!!</strong></center>
						</c:otherwise>
					</c:choose>
					
				  	 <div style="clear: both;">&nbsp;</div>
				  </div>
				
				</div>
		


		</form:form>
					
					
        		</div> <!-- END of content -->
        		<div class="cleaner"></div>
    		</div> <!-- END of main -->
    
			<%@ include file="../../resources/includes/footer.jsp" %>
		</div>
    
    
    
    
    
    
    
    
    
    
    
		</body>
</html>

