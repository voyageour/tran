<%@page import="com.corporate.transportdb.dto.updated.UserRouteMappingUpdated"%>
<%@page import="com.corporate.transportdb.dto.updated.RouteDriverVehicleMappingUpdated"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.corporate.transportdb.dto.updated.UserRequestNew"%>
<%@page import="com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated"%>
<%@page import="java.util.List"%>
<%@page import="com.corporate.transportdb.domain.RouteDetailsHelper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../../../resources/includes/titleAndMeta.jsp" %>
	<!-- script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script> -->
	<script type="text/javascript" src="../../../resources/jQuery/jquery-1.7.2.js"></script>
	
	
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script> -->
	<script src="../../../resources/jQuery/jquery-ui-1.10.3.js"></script>
	
	
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /> -->
	<link rel="stylesheet" href="../../../resources/jQuery/jquery-ui.min.css" />

	<link href="../../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../../../resources/bootstrap/css/bootstrap.min.css" />


	<!-- MENUBAR STARTED -->
	<link rel="stylesheet" href="../../../resources/SimplejQueryDropdowns/css/style.css" type="text/css" media="screen, projection"/>
	<script type="text/javascript" language="javascript" src="../../../resources/SimplejQueryDropdowns/js/jquery.dropdownPlain.js"></script>
	<link href="../../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />	
	<!-- MENUBAR ENDED -->


		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
		    <!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script> -->
		    <script type="text/javascript" src="../../../resources/token-input/src/jquery.tokeninput.js"></script>
		    <link rel="stylesheet" href="../../../resources/token-input/styles/token-input.css" type="text/css" />
		    <link rel="stylesheet" href="../../../resources/token-input/styles/token-input-facebook.css" type="text/css" />
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->



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

		<style type="text/css">	
			.customers {
				margin:0px;padding:0px;
				width:100%;
				box-shadow: 10px 10px 5px #888888;
				border:1px solid #11110a;
				
				-moz-border-radius-bottomleft:4px;
				-webkit-border-bottom-left-radius:4px;
				border-bottom-left-radius:4px;
				
				-moz-border-radius-bottomright:4px;
				-webkit-border-bottom-right-radius:4px;
				border-bottom-right-radius:4px;
				
				-moz-border-radius-topright:4px;
				-webkit-border-top-right-radius:4px;
				border-top-right-radius:4px;
				
				-moz-border-radius-topleft:4px;
				-webkit-border-top-left-radius:4px;
				border-top-left-radius:4px;
			}.customers table{
				width:100%;
				height:100%;
				margin:0px;padding:0px;
			}.customers tr:last-child td:last-child {
				-moz-border-radius-bottomright:4px;
				-webkit-border-bottom-right-radius:4px;
				border-bottom-right-radius:4px;
			}
			.customers table tr:first-child td:first-child {
				-moz-border-radius-topleft:4px;
				-webkit-border-top-left-radius:4px;
				border-top-left-radius:4px;
			}
			.customers table tr:first-child td:last-child {
				-moz-border-radius-topright:4px;
				-webkit-border-top-right-radius:4px;
				border-top-right-radius:4px;
			}.customers tr:last-child td:first-child{
				-moz-border-radius-bottomleft:4px;
				-webkit-border-bottom-left-radius:4px;
				border-bottom-left-radius:4px;
			}.customers tr:hover td{
				
			}
			.customers tr:nth-child(odd){ background-color:#cccccc; }
			.customers tr:nth-child(even)    { background-color:#ffffff; }.customers td{
				vertical-align:middle;
				
				
				border:1px solid #11110a;
				border-width:0px 1px 1px 0px;
				text-align:center;
				padding:9px;
				color:#000000;
			}.customers tr:last-child td{
				border-width:0px 1px 0px 0px;
			}.customers tr td:last-child{
				border-width:0px 0px 1px 0px;
			}.customers tr:last-child td:last-child{
				border-width:0px 0px 0px 0px;
			}
			.customers tr:first-child td{
					background:-o-linear-gradient(bottom, #252544 5%, #3a3a63 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #252544), color-stop(1, #3a3a63) );
				background:-moz-linear-gradient( center top, #252544 5%, #3a3a63 100% );
				filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#252544", endColorstr="#3a3a63");	background: -o-linear-gradient(top,#252544,3a3a63);
			
				background-color:#252544;
				border:0px solid #11110a;
				text-align:center;
				border-width:0px 0px 1px 1px;
				color:#ffffff;
			}
			.customers tr:first-child:hover td{
				background:-o-linear-gradient(bottom, #252544 5%, #3a3a63 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #252544), color-stop(1, #3a3a63) );
				background:-moz-linear-gradient( center top, #252544 5%, #3a3a63 100% );
				filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#252544", endColorstr="#3a3a63");	background: -o-linear-gradient(top,#252544,3a3a63);
			
				background-color:#252544;
			}
			.customers tr:first-child td:first-child{
				border-width:0px 0px 1px 0px;
			}
			.customers tr:first-child td:last-child{
				border-width:0px 0px 1px 1px;
			}
		</style>
		

		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

		<script type="text/javascript">
			$(function() {
				
				$('#buttons').find('a').click(function() {
			    	$('#dialog_'+nr).show();
			        // find out clicked id and open dialog
			        var nr = this.id.split("_")[1];
			        $('#dialog_'+nr).dialog({ 

			        	position:'center', 
				        draggable: true, 
				        resizable: true, 
				        width: $(window).width()-50, 
				        height: $(window).height()-50,
					    buttons: {
							"Close": function() {
							    $(this).dialog("close");
							}
					    }
			        });
				});
			});
	
			$(function() {	
				$('#buttons1').find('a').click(function() {
			    	$('#dialog_'+nr).show();
			        // find out clicked id and open dialog
			        var nr = this.id.split("_")[1];
			        $('#dialog_'+nr).dialog({ 

			        	position:'center', 
				        draggable: true, 
				        resizable: true, 
				        width: $(window).width()-50, 
				        height: $(window).height()-50 
				        
			        });
			        
			    });
			});
		</script>
		
		<style type="text/css">
			#search-box {
			    position: relative;
			    width: 100%;
			    margin: 0;
			}
			#search-form {
			    height: 40px;
			    border: 1px solid #999;
			    -webkit-border-radius: 5px;
			    -moz-border-radius: 5px;
			    border-radius: 5px;
			    background-color: #fff;
			    overflow: hidden;
			}
			
			#search-text {
			    font-size: 14px;
			    color: #ddd;
			    border-width: 0;
			    background: transparent;
			}
			
			#search-box input[type="text"] {
			    width: 90%;
			    padding: 11px 0 12px 1em;
			    color: #333;
			    outline: none;
			}
			
			#search-button {
			    position: absolute;
			    top: 0;
			    right: 0;
			    height: 42px;
			    width: 80px;
			    font-size: 14px;
			    color: #fff;
			    text-align: center;
			    line-height: 42px;
			    border-width: 0;
			    background-color: #999;
			    -webkit-border-radius: 0px 5px 5px 0px;
			    -moz-border-radius: 0px 5px 5px 0px;
			    border-radius: 0px 5px 5px 0px;
			    cursor: pointer;
			}
			.slidingDiv {
			    height:300px;
			   /*  background-color: #99CCFF; */
			    padding:20px;
			    margin-top:10px;
			    /* border-bottom:5px solid #3399FF; */
			}
			 
			.show_hide {
			    display:none;
			}			
		</style>
		
		<script type="text/javascript">
			
			function closeDiv(){
				var div = document.getElementById('searchResults');
				div.style.display='none';
			}
			
		</script>

				
<style type="text/css">		

/* define height and width of scrollable area. Add 16px to width for scrollbar          */
div.tableContainer {
	clear: both;
	border: 1px solid #963;
	height: 200px;
	overflow: auto;
	/* width: 756px */
}

/* Reset overflow value to hidden for all non-IE browsers. */
html>body div.tableContainer {
	overflow: hidden;
	/* width: 756px */
}

/* define width of table. IE browsers only                 */
div.tableContainer table {
	float: left;
	/* width: 740px; */
}

/* define width of table. Add 16px to width for scrollbar.           */
/* All other non-IE browsers.                                        */
html>body div.tableContainer table {
	/* width: 756px */
}

/* set table header to a fixed position. WinIE 6.x only                                       */
/* In WinIE 6.x, any element with a position property set to relative and is a child of       */
/* an element that has an overflow property set, the relative value translates into fixed.    */
/* Ex: parent element DIV with a class of tableContainer has an overflow property set to auto */
thead.fixedHeader tr {
	position: relative
}

/* set THEAD element to have block level attributes. All other non-IE browsers            */
/* this enables overflow to work on TBODY element. All other non-IE, non-Mozilla browsers */
html>body thead.fixedHeader tr {
	display: block
}

/* make the TH elements pretty */
thead.fixedHeader th {
	background: gray;
/* 	border-left: 1px solid #EB8;
	border-right: 1px solid #B74;
	border-top: 1px solid #EB8;
 */	font-weight: normal;
	padding: 4px 3px;
	text-align: left
}

/* make the A elements pretty. makes for nice clickable headers                */
thead.fixedHeader a, thead.fixedHeader a:link, thead.fixedHeader a:visited {
	color: #FFF;
	display: block;
	text-decoration: none;
	width: 100%
}

/* make the A elements pretty. makes for nice clickable headers                */
/* WARNING: swapping the background on hover may cause problems in WinIE 6.x   */
thead.fixedHeader a:hover {
	color: #FFF;
	display: block;
	text-decoration: underline;
	width: 100%
}

/* define the table content to be scrollable                                              */
/* set TBODY element to have block level attributes. All other non-IE browsers            */
/* this enables overflow to work on TBODY element. All other non-IE, non-Mozilla browsers */
/* induced side effect is that child TDs no longer accept width: auto                     */
html>body tbody.scrollContent {
	display: block;
	height: 190px;
	overflow: auto;
	width: 100%
}

/* make TD elements pretty. Provide alternating classes for striping the table */
/* http://www.alistapart.com/articles/zebratables/                             */
tbody.scrollContent td, tbody.scrollContent tr.normalRow td {
	background: #FFF;
	border-bottom: none;
	border-left: none;
	border-right: 1px solid #CCC;
	border-top: 1px solid #DDD;
	padding: 2px 3px 3px 4px
}

tbody.scrollContent tr.alternateRow td {
	background: #EEE;
	border-bottom: none;
	border-left: none;
	border-right: 1px solid #CCC;
	border-top: 1px solid #DDD;
	padding: 2px 3px 3px 4px
}

/* define width of TH elements: 1st, 2nd, and 3rd respectively.          */
/* Add 16px to last TH for scrollbar padding. All other non-IE browsers. */
/* http://www.w3.org/TR/REC-CSS2/selector.html#adjacent-selectors        */
html>body thead.fixedHeader th {
	width: 200px
}

html>body thead.fixedHeader th + th {
	width: 240px
}

html>body thead.fixedHeader th + th + th {
	width: 316px
}

/* define width of TD elements: 1st, 2nd, and 3rd respectively.          */
/* All other non-IE browsers.                                            */
/* http://www.w3.org/TR/REC-CSS2/selector.html#adjacent-selectors        */
html>body tbody.scrollContent td {
	width: 200px
}

html>body tbody.scrollContent td + td {
	width: 240px
}

html>body tbody.scrollContent td + td + td {
	width: 300px
}		
</style>
		
		<!-- FOR DROPDOWN START -->
  		<style type="text/css"> 
		    ol li {list-style: decimal outside;}
		    
		    ol li { margin-left: 1.25em; }
		    
		    div.side-by-side { width: 100%; margin-bottom: 1em; }
		    div.side-by-side > div { float: left; width: 50%; }
		    div.side-by-side > div > em { margin-bottom: 10px; display: block; }
		    
		    .clearfix:after {
		      content: "\0020";
		      display: block;
		      height: 0;
		      clear: both;
		      overflow: hidden;
		      visibility: hidden;
		    }
  		</style>
  		<link rel="stylesheet" href="../../../resources/dropdown-charts/chosen.css" />  
  		<!-- FOR DROPDOWN END -->
  		
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
		$("#appSelection").on('change', function() {
		   
		    if(this.value==0){ //TRANSPORT
		    	document.location.href = "../../transport/home";		    	
		    }else{ //CARPOOL
		    	document.location.href = "../../carpool/home";
		    }
		});
    });
	</script>
	
	<script type="text/javascript">
    $(document).ready(function(){
		if($("#appSelection").val()==0){
			$("#menuCarpool").css("display","none");
	    	$("#menuTransport").css("display","block");
		}else{
			$("#menuCarpool").css("display","block");
	    	$("#menuTransport").css("display","none");
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
</head>

<body id="subpage">

	<!-- NOTIFICATION STARTED -->
		
	<% if(request.getAttribute("status")!=null){ %>	
	
		<script type="text/javascript">
		var status = "<%=request.getAttribute("status")%>";
		alert(status);
		</script>  
	
	<% } %>
		
	<% if(request.getParameter("status")!=null){ %>	
	
		<script type="text/javascript">
		var status = "<%=request.getParameter("status")%>";
		alert(status);
		
		</script>  
	
	<% } %>
		
	<!-- NOTIFICATION ENDED -->
	
	
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
					  <option value="0" selected="selected">Transport</option>
					  <option value="1">Carpool</option>
					</select>
	           	</li>
          </ul>
          
        </div>
      </div>
    </nav>
	
	
<div id="templatemo_wrapper">

    <%@ include file="../../../resources/includes/header.jsp" %>
    <%@ include file="../../../resources/includes/adminMenu.jsp" %>
        
    <div class="cleaner h20"></div>
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
        
        <div id="content" style="width: 96%;">
         	<h2>Charging Module</h2> 
        								
					<div class="horizon_divider"></div>
					<%-- <span>	
						<center>
							<h4 style="font-size: 14px; padding-bottom: 10px; border-bottom: 1px solid #ccc; margin: 5px;">
								<a href=""><b>Route Wise</b></a> &nbsp; | &nbsp;
								<a href="">Complete</a>
							</h4>
						</center>
					</span> --%>

					<c:choose>
						<c:when test="${listOfRouteDetailsHelper ne null && fn:length(listOfRouteDetailsHelper) gt 0}">								
							<div id="buttons" style="padding-top: 50px;">
								<table id="report" border="1" width="100%" class="customers">
									<tr>
										<td>Route</td>
										<td>Member Count</td>
										<td>Total Amount</td>
										<td>Action</td>
									</tr>
									<c:forEach var="routeDetailsHelper" items="${listOfRouteDetailsHelper}" varStatus="theCount" >
										<tr class="odd">
											<td>
												<p><em>${routeDetailsHelper.route.routeName}</em></p>
											</td>
											<td>
												<p><em>${ fn:length(routeDetailsHelper.listOfUserRouteMappingUpdated ) } Employee</em></p>
											</td>
											<td>
												<p>
													<em> 
										            	${ fn:length(routeDetailsHelper.listOfUserRouteMappingUpdated ) * busFare.busFareAmount } Rs
													</em>
												</p>
											</td>
											<td style="width: 200px;">
												<a style="text-decoration: none; float: left; margin-right: 5px;" href="#" class="myButton" id="btn_${routeDetailsHelper.route.routeId}">Employee List</a>
											</td>
										</tr>
									</c:forEach>	
								</table>	
							</div>
							
							<!-- ITERATE AND FILL DIV, SO THAT IT CAN BE DISPLAYED AS DIALOG START -->
							<c:forEach var="routeDetailsHelper" items="${listOfRouteDetailsHelper}" varStatus="theCounter">
								<%-- <div id="dialog_${theCounter.count}" class="dialogbox" style="display:none;"> --%>
								<div id="dialog_${routeDetailsHelper.route.routeId}" class="dialogbox" style="display:none;">
								
									<b>Passenger Details:</b>
									<center><a href="#" class="show_hide">Show Passenger Details</a></center>
									<div class="slidingDiv">
										<table width="100%" border="0" style="overflow-y: scroll; display: block;" id="passengerDetailsDiv">
											<tr>
												<td width="10%" style="background-color: gray;">SL No</td>
												<td width="30%" style="background-color: gray;">Employee</td>
												<td width="30%" style="background-color: gray;">Pick Up Point</td>
												<td width="15%" style="background-color: gray;">Time</td>
												<td width="15%" style="background-color: gray;">Amount</td>
											</tr>
											<tr>
												<c:choose>
													<c:when test="${routeDetailsHelper.listOfUserRouteMappingUpdated ne null && fn:length(routeDetailsHelper.listOfUserRouteMappingUpdated) gt 0}">
														<c:set var="count" value="1" scope="page" />
														<c:choose>
															<c:when test="${routeDetailsHelper.listOfRoutePlaceMappingUpdated ne null && fn:length(routeDetailsHelper.listOfRoutePlaceMappingUpdated) gt 0}">
																<c:forEach var="routePlace" items="${routeDetailsHelper.listOfRoutePlaceMappingUpdated}">
																	<c:forEach var="user" items="${routeDetailsHelper.listOfUserRouteMappingUpdated}">
																		<c:if test="${ (user.place.placeName eq routePlace.place.placeName)}">
																			<tr class="odd">
																				<td height="20">${count}</td>
																				<td>${ user.user.userName }</td>
																				<td>${ user.place.placeName }</td>
																				<td><fmt:formatDate pattern="HH:mm:ss" value="${ routePlace.arrivalTime }" /></td>
																				<td>${ busFare.busFareAmount } Rs</td>
																				<td></td>
																			</tr>
																			<c:set var="count" value="${count + 1}" />
																		</c:if>
																	</c:forEach>
																</c:forEach>
															</c:when>
															<c:otherwise>
															
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<tr class="odd">
															<td colspan="6">
																No Members Found
															</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tr>
										</table>
										<!-- <a href="#" class="show_hide">Hide Passenger Details</a> -->
									</div>
									
								</div>
							</c:forEach>
							<!-- ITERATE AND FILL DIV, SO THAT IT CAN BE DISPLAYED AS DIALOG END -->
						</c:when>
						<c:otherwise>
							Sorry, No records found.
						</c:otherwise>
					</c:choose>
    						

			
			
        </div> <!-- END of content -->
        <div class="cleaner"></div>
    </div> <!-- END of main -->
    
	<%@ include file="../../../resources/includes/footer.jsp" %>
   
</div>

		<!-- DROPDOWN START -->
	  	<script src="../../../resources/dropdown-charts/chosen.jquery.js" type="text/javascript"></script>
	  	<script type="text/javascript"> 
		    var config = {
		      '.chzn-select'           : {},
		      '.chzn-select-deselect'  : {allow_single_deselect:true},
		      '.chzn-select-no-single' : {disable_search_threshold:10},
		      '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
		      '.chzn-select-width'     : {width:"95%"}
		    }
		    for (var selector in config) {
		      $(selector).chosen(config[selector]);
		    }
	  	</script>
		<!-- DROPDOWN END -->
</body>
</html>