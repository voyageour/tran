<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


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
	
	
	<!-- SCROLLING EVENTS STARTED -->	 
	<link rel="stylesheet" href="../resources/scrollingNews/style.css" type="text/css" media="screen" />
	<script src="../resources/scrollingNews/jcarousellite_1.0.1c4.js" type="text/javascript"></script>
	<script src="../resources/scrollingNews/action.js" type="text/javascript"></script>	
	<!-- SCROLLING EVENTS ENDED -->
	
	
	<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
    <script type="text/javascript" src="../resources/token-input/src/jquery.tokeninput.js"></script>
    <link rel="stylesheet" href="../resources/token-input/styles/token-input.css" type="text/css" />
    <!-- <link rel="stylesheet" href="../resources/token-input/styles/token-input-facebook.css" type="text/css" /> -->
	<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->


	<!-- FEEDBACK PLUGIN START -->
	<script src="../resources/feedbackAtHomePage/jquery.quick-feedback.js" type="text/javascript" charset="utf-8"></script>
	<script>
		$(document).ready(function() {
		      $('body').feedbackTab({tab2: true, tab3: true, tab4: true, feedbackAction: 'general.jsp', tab2Action: 'suggestion.jsp', tab3Action: 'problem.jsp', tab4Action: 'praise.jsp' });
		});
	</script>
	<link rel="stylesheet" href="../resources/feedbackAtHomePage/jquery.quick-feedback.css" type="text/css" charset="utf-8" />
	<!-- FEEDBACK PLUGIN END -->
	
	<!-- BUS FARE DIALOG START -->
	<script type="text/javascript">
	$(function(){			
		$("#dialog").dialog({ autoOpen: false });
		$("#busFare").click(function(){
			 $("#dialog").dialog('open');
                return false;
		});		    
	});
	</script>
	<!-- BUS FARE DIALOG END -->
	
		
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
    
        <style> 
        .captionOrange, .captionBlack
        {
            color: #fff;
            font-size: 20px;
            line-height: 30px;
            text-align: center;
            border-radius: 4px;
        }
        .captionOrange
        {
            background: #EB5100;
            background-color: rgba(235, 81, 0, 0.6);
        }
        .captionBlack
        {
        	font-size:16px;
            background: #000;
            background-color: rgba(0, 0, 0, 0.4);
        }
        a.captionOrange, A.captionOrange:active, A.captionOrange:visited
        {
        	color: #ffffff;
        	text-decoration: none;
        }
        a.captionOrange:hover
        {
            color: #eb5100;
            text-decoration: underline;
            background-color: #eeeeee;
            background-color: rgba(238, 238, 238, 0.7);
        }
        .bricon
        {
            background: url(../img/browser-icons.png);
        }
    </style>
    
    <script type="text/javascript" src="../resources/slider/slider-master/js/jssor.js"></script>
    <script type="text/javascript" src="../resources/slider/slider-master/js/jssor.slider.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            //Reference http://www.jssor.com/development/slider-with-slideshow-jquery.html
            //Reference http://www.jssor.com/development/tool-slideshow-transition-viewer.html

            var _SlideshowTransitions = [
            //Fade in R
            {$Duration: 1200, x: -0.3, $During: { $Left: [0.3, 0.7] }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade out L
            , { $Duration: 1200, x: 0.3, $SlideOut: true, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            ];

            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideDuration: 500,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $SlideshowOptions: {                                //[Optional] Options to specify and enable slideshow or not
                    $Class: $JssorSlideshowRunner$,                 //[Required] Class to create instance of slideshow
                    $Transitions: _SlideshowTransitions,            //[Required] An array of slideshow transitions to play slideshow
                    $TransitionsOrder: 1,                           //[Optional] The way to choose transition to play slide, 1 Sequence, 0 Random
                    $ShowLink: true                                    //[Optional] Whether to bring slide link on top of the slider when slideshow is running, default value is false
                },

                $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 10,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 10                                    //[Optional] Vertical space between each item in pixel, default value is 0
                },

                $ArrowNavigatorOptions: {
                    $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 2,                                //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                },

                $ThumbnailNavigatorOptions: {
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $ActionMode: 0,                                 //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
                    $DisableDrag: true                              //[Optional] Disable drag or not, default value is false
                }
            };

            var jssor_sliderb = new $JssorSlider$("sliderb_container", options);
            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var parentWidth = jssor_sliderb.$Elmt.parentNode.clientWidth;
                if (parentWidth)
                    jssor_sliderb.$ScaleWidth(Math.min(parentWidth, 600));
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>
    
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
    
    
    <!-- TESTIMONIAL SLIDER START -->	
	<style type="text/css">

			#quotes
			{
				margin:0;
				padding:70px 380px 190px 10px;
				font-size:20px;
				position:relative;
			}
			.textItem
			{
				position:absolute;
				display:none;
			}
			a
			{
				color:#000;
			}
			
/* 			.numberCircle {
			    -webkit-border-radius: 999px;
			    -moz-border-radius: 999px;
			    border-radius: 999px;
			    behavior: url(PIE.htc);
			
			    width: 36px;
			    height: 36px;
			    padding: 8px;
			    
			    background: #fff;
			    border: 2px solid #666;
			    color: #666;
			    text-align: center;
			    
			    font: 32px Arial, sans-serif
			}
 */			
			.circular-label { overflow: hidden; z-index: 100; vertical-align: middle; 
                   font-size: 11px; -webkit-box-shadow:0 3px 3px rgba(0,0,0,0.2); 
                  -moz-box-shadow:0 3px 3px rgba(0,0,0,0.2); 
                   box-shadow: 3px 3px 3px rgba(0,0,0,0.2); }
 .label-inner { width: 95%; height: 105%; -moz-border-radius: 50%; 
                 -webkit-border-radius: 50%; border-radius: 50%; 
                  border: 2px dotted white; vertical-align: middle; 
                  margin: auto; top: -10%; position: relative; overflow: hidden; }
 .label-inner > span {display: table; text-align: center; vertical-align: middle; 
                      font-weight: bold; text-transform: uppercase;  width: 100%;                                        
                      position: absolute; margin: auto; margin-top: 38%; 
                      font-family: 'ProximaNovaLtSemibold'; font-size: 13px;  
                      line-height: 1.0em; }
 .circular-label.label-size-large { width: 120px; height: 120px; 
          -moz-border-radius: 55px; -webkit-border-radius: 55px; 
           border-radius: 75px; margin-top:-55px;} 
 .circular-label.label-size-med { width: 76px; height: 76px; 
          -moz-border-radius: 38px; -webkit-border-radius: 38px; 
           border-radius: 38px; margin-top:-38px;} 
 .circular-label.label-size-med .label-inner > span {margin-top: 33%; }
 .circular-label.label-size-small { width: 66px; height: 66px; 
          -moz-border-radius: 33px; -webkit-border-radius: 33px;
           border-radius: 33px; margin-top:-33px; }
		
label {
font-family: 'Alegreya', serif;
font-size: 15px;
color: #787878;
font-weight: 0;
line-height: 20px;
font-style: italic;
}

		</style>
		
		
		<script type="text/javascript">
			$(document).ready(function()
			{
				setupRotator();
			});	
			function setupRotator()
			{
				if($('.textItem').length > 1)
				{
					$('.textItem:first').addClass('current').fadeIn(1000);
					setInterval('textRotate()', 3000);
				}
			}
			function textRotate()
			{
				var current = $('#quotes > .current');
				if(current.next().length == 0)
				{
					current.removeClass('current').fadeOut(1000);
					$('.textItem:first').addClass('current').fadeIn(1000);
				}
				else
				{
					current.removeClass('current').fadeOut(1000);
					current.next().addClass('current').fadeIn(1000);
				}
			}
		</script>
		
		<!-- TESTIMONIAL SLIDER END -->
    
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
			$("#appSelection").on('change', function() {
			   
			    if(this.value==0){ //TRANSPORT
			    	document.location.href = "../transport/home";		    	
			    }else{ //CARPOOL
			    	document.location.href = "../carpool/home";
			    }
			});
	    });
		</script>
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
	
	    	<%@ include file="../../resources/includes/busFareDialog.jsp" %>
		
    		<%@ include file="../../resources/includes/header.jsp" %> 
    		<%@ include file="../../resources/includes/userMenu.jsp" %>
    
    
		    <div style="margin: 20px;"></div>
		    
		    <div id="templatemo_main_top"></div>
		    <div id="templatemo_main">
		        







		        <div id="sidebar" style="float: right;">
		        	<h3>News</h3>        						
						<div id="newsticker-demo">    
		   					<div class="newsticker-jcarousellite">
								<ul>
							  		    <c:choose>
					 			  		  <c:when test="${listOfAllCarpooler ne null and fn:length(listOfAllCarpooler) > 0}">
										  	<c:forEach var="carpooler" items="${listOfAllCarpooler}">
										  	   <c:forEach var="sourceToDestinationDetails" items="${carpooler.listOfSourceToDestinationDetails}">
																	
													<li>													
														 <table width="338" height="80px" border="0">
															  <tr>
															    <td width="65" rowspan="4" valign="top">
															    	<a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"><img class="image2" height="50px" width="50px" src="${carpooler.user.userProfilePic}" /></a>
															    </td>
															    <td width="48" height="15px" colspan="2" valign="top">
															    	<a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"><insidelabel valign="top" style="font-weight: bold;">${carpooler.user.userName}</insidelabel></a>
															    </td>					    
															  </tr>
															  <tr>
															    <td width="10px" valign="top"><a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"><insidelabel style="font-weight: bold;"></insidelabel></a></td>
															    <td valign="top" height="40px"><a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"><insidelabel>${sourceToDestinationDetails.sourcePlace}  <img style="padding-left: 3px; padding-right: 3px;" height="10px" width="15px" src="../../images/arrow/arrow12.png" />  ${sourceToDestinationDetails.destinationPlace}</insidelabel></a></td>
															  </tr>
														</table>				
													</li>
																	
												</c:forEach>
									 	    </c:forEach>
									 	  </c:when>
								 	   	  <c:otherwise>
											<center>
											<br><br>
											No Rides Found yet, Let's start from you.
					 						<br><br>
											<img alt="" width="200px" height="200px" src="../images/car/carpool1.jpg">
											</center>	
									  	  </c:otherwise>
										</c:choose>
		       					</ul>
		   					</div>
		   					<div class="title"><a href="allEvents">View all Events</a></div>
						</div>
		        </div> <!-- END of sidebar -->
		        










<%-- 	<div id="sidebar" style="float: right;">
				
					<h2><center>Latest Ride</center></h2>
					 <ul id="vertical-ticker">
				  	<c:choose>
 			  		  <c:when test="${listOfAllCarpooler ne null and fn:length(listOfAllCarpooler) > 0}">
					  	<c:forEach var="carpooler" items="${listOfAllCarpooler}">
					  	   <c:forEach var="sourceToDestinationDetails" items="${carpooler.listOfSourceToDestinationDetails}">
						  	 	<li>
									<table width="338" height="80px" border="1">
										  <tr>
										    <td width="65" rowspan="4" valign="top">
										    	<a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}">
										    		<img class="image2" height="50px" width="50px" src="${carpooler.user.userProfilePic}" />
										    	</a>
										    </td>
										    <td width="48" height="15px" colspan="2" valign="top">
										    	<a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}">
										    		<insidelabel valign="top" style="font-weight: bold;">${carpooler.user.userName}</insidelabel>
										    	</a>
										    </td>					    
										  </tr>
										  <tr>
										    <td width="10px" valign="top"><a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"><insidelabel style="font-weight: bold;"></insidelabel></a></td>
										    <td valign="top" height="40px"><a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"><insidelabel>${sourceToDestinationDetails.sourcePlace}  <img style="padding-left: 3px; padding-right: 3px;" height="10px" width="15px" src="../../images/arrow/arrow12.png" />  ${sourceToDestinationDetails.destinationPlace}</insidelabel></a></td>
										  </tr>
									</table>							
								</li>
					 	  </c:forEach>
				 	    </c:forEach>
				 	  </c:when>
			 	   	  <c:otherwise>
						<center>
						<br><br>
						No Rides Found yet, Let's start from you.
 						<br><br>
						<img alt="" width="200px" height="200px" src="../images/car/carpool1.jpg">
						</center>	
				  	  </c:otherwise>
				  </c:choose>
				 </ul>

		</div> --%>
		


		        
		        <div id="content" style="width: 550px;">
		        
								
								
								
			
												
								
								
								    <!-- Jssor Slider Begin -->
    <!-- You can move inline styles to css file or css block. -->
    <div id="sliderb_container" style="position: relative; width: 600px;
        height: 300px; overflow: hidden;">

        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>

        <!-- Slides Container -->
  		<div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 600px; height: 300px;
            overflow: hidden;" id="slidesCarpool">
            
            <div>
                <img u=image src="../resources/imageSliderAtTestimonialPage/data1/images/a1.png" />
                <div u="thumb">Do you notice it is draggable by mouse/finger?</div>
            </div>
            <div>
                <img u=image src="../resources/imageSliderAtTestimonialPage/data1/images/b1.png" />
                <div u="thumb">Did you drag by either horizontal or vertical?</div>
            </div>
            <div>
                <img u=image src="../resources/imageSliderAtTestimonialPage/data1/images/c1.png" />
                <div u="thumb">Do you notice navigator responses when drag?</div>
            </div>
            <div>
                <img u=image src="../resources/imageSliderAtTestimonialPage/data1/images/d1.png" />
                <div u="thumb">Do you notice arrow responses when click?</div>
            </div>
            <div>
                <img u=image src="../resources/imageSliderAtTestimonialPage/data1/images/e1.png" />
                <div u="thumb">Do you notice arrow responses when click?</div>
            </div>
            
        </div>




       <!--  <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 600px; height: 300px;
            overflow: hidden;" id="slidesCarpool">
            
            <div>
                <img u=image src="../resources/imageSliderAtTestimonialPage/data1/images/a1.png" />
                <div u="thumb">Do you notice it is draggable by mouse/finger?</div>
            </div>
            <div>
                <img u=image src="../resources/imageSliderAtTestimonialPage/data1/images/b1.png" />
                <div u="thumb">Did you drag by either horizontal or vertical?</div>
            </div>
            <div>
                <img u=image src="../resources/imageSliderAtTestimonialPage/data1/images/c1.png" />
                <div u="thumb">Do you notice navigator responses when drag?</div>
            </div>
            <div>
                <img u=image src="../resources/imageSliderAtTestimonialPage/data1/images/d1.png" />
                <div u="thumb">Do you notice arrow responses when click?</div>
            </div>
            <div>
                <img u=image src="../resources/imageSliderAtTestimonialPage/data1/images/e1.png" />
                <div u="thumb">Do you notice arrow responses when click?</div>
            </div>
            
        </div> -->


        <!-- ThumbnailNavigator Skin Begin -->
        <div u="thumbnavigator" class="sliderb-T" style="position: absolute; bottom: 0px; left: 0px; height:45px; width:600px;">
            <div style="filter: alpha(opacity=40); opacity:0.4; position: absolute; display: block;
                background-color: #000000; top: 0px; left: 0px; width: 100%; height: 100%;">
            </div>
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides">
                <div u="prototype" style="POSITION: absolute; WIDTH: 600px; HEIGHT: 45px; TOP: 0; LEFT: 0;">
                    <div u="thumbnailtemplate" style="font-family: verdana; font-weight: normal; POSITION: absolute; WIDTH: 100%; HEIGHT: 100%; TOP: 0; LEFT: 0; color:#fff; line-height: 45px; font-size:20px; padding-left:10px;"></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- ThumbnailNavigator Skin End -->
        
        <!-- Bullet Navigator Skin Begin -->
        <!-- jssor slider bullet navigator skin 01 -->
        <style>
            /*
            .jssorb01 div           (normal)
            .jssorb01 div:hover     (normal mouseover)
            .jssorb01 .av           (active)
            .jssorb01 .av:hover     (active mouseover)
            .jssorb01 .dn           (mousedown)
            */
            .jssorb01 div, .jssorb01 div:hover, .jssorb01 .av
            {
                filter: alpha(opacity=70);
                opacity: .7;
                overflow:hidden;
                cursor: pointer;
                border: #000 1px solid;
            }
            .jssorb01 div { background-color: gray; }
            .jssorb01 div:hover, .jssorb01 .av:hover { background-color: #d3d3d3; }
            .jssorb01 .av { background-color: #fff; }
            .jssorb01 .dn, .jssorb01 .dn:hover { background-color: #555555; }
        </style>
        <!-- bullet navigator container -->
        <div u="navigator" class="jssorb01" style="position: absolute; bottom: 16px; right: 10px;">
            <!-- bullet navigator item prototype -->
            <div u="prototype" style="POSITION: absolute; WIDTH: 12px; HEIGHT: 12px;"></div>
        </div>
        <!-- Bullet Navigator Skin End -->
        
        <!-- Arrow Navigator Skin Begin -->
        <style>
            /* jssor slider arrow navigator skin 05 css */
            /*
            .jssora05l              (normal)
            .jssora05r              (normal)
            .jssora05l:hover        (normal mouseover)
            .jssora05r:hover        (normal mouseover)
            .jssora05ldn            (mousedown)
            .jssora05rdn            (mousedown)
            */
            .jssora05l, .jssora05r, .jssora05ldn, .jssora05rdn
            {
            	position: absolute;
            	cursor: pointer;
            	display: block;
                background: url(../img/a17.png) no-repeat;
                overflow:hidden;
            }
            .jssora05l { background-position: -10px -40px; }
            .jssora05r { background-position: -70px -40px; }
            .jssora05l:hover { background-position: -130px -40px; }
            .jssora05r:hover { background-position: -190px -40px; }
            .jssora05ldn { background-position: -250px -40px; }
            .jssora05rdn { background-position: -310px -40px; }
        </style>
        <!-- Arrow Left -->
        <span u="arrowleft" class="jssora05l" style="width: 40px; height: 40px; top: 123px; left: 8px;">
        </span>
        <!-- Arrow Right -->
        <span u="arrowright" class="jssora05r" style="width: 40px; height: 40px; top: 123px; right: 8px">
        </span>
        <!-- Arrow Navigator Skin End -->
        <a style="display: none" href="http://www.jssor.com">Image Slider</a>
        <!-- Trigger -->
    </div>
    <!-- Jssor Slider End -->
    
    							
								
		            	
		        </div> <!-- END of content -->
		        
		        
		        
		        
		        		<table width="100%" border="0">
			 <tr>
		  		<td>
					<div id="quotes">
						<c:forEach var="feedback" items="${listOfPraiseFeedback}">
							<div class="textItem">
								<table width="152" border="0" height="100px">
									<tr>
										<td width="60px"> <img width="30" height="30" src="../../images/arrow/cl1.png" /> </td>
										<td width="90px"> <img class="image1" width="50" height="50" src="${ feedback.user.userProfilePic }" /></td>
										<td> <label> ${ feedback.feedbackContents } </label> </td>
										<td width="60px"> <img width="30" height="30" src="../../images/arrow/cl2.png" /> </td>
									</tr>
									<tr>
										<td colspan="4" height="30px" align="center"><img src="../../images/arrow/quote-shelf.png" /></td>
									</tr>
									<tr>
										<td align="center" colspan="4">
											<c:choose>
												<c:when test="${feedback.user ne null and feedback.user.userName ne null}">
													<rideBy> ${ feedback.user.userName }, </rideBy>
												</c:when>
												<c:otherwise>
													<rideBy> Anonymous, </rideBy>
												</c:otherwise>
											</c:choose>
											
											<rideBy1> 
												<a href="testimonials.jsp"> More Stories <img  src="../../images/arrow/arrow12.png" /> </a> 
											</rideBy1>
										</td>
									</tr>	
								</table>
							</div>
						</c:forEach>
					</div>
		  		</td>
			    
			  	<td align="center" valign="bottom">

			     <div class="circular-label label-outer label-size-large label-color-pink">
					  <div class="label-inner">
					   <span><counter><rideBy>${totalUserCount}</rideBy></counter></span>
					 </div>
				 </div>
				 	<br>
					<img alt="" width="120px" height="80px" src="../../images/car/handshake.png">
				 <br/>
			  	  handshakes and still counting...
			    </td>
			    
			  </tr>
			
		</table>
		        
		        
		        <div class="cleaner"></div>
		    </div> <!-- END of main -->
		    
		    <%-- ${totalUserCount} --%>
		    <%@ include file="../../resources/includes/footer.jsp" %>
		</div>
	
	</body>
</html>