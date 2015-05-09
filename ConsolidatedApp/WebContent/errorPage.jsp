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
<%@ page isErrorPage="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="resources/includes/titleAndMeta.jsp" %>

<style type="text/css" >
	body {
		/* background:url('resources/images/images/errorPage/errorPage.jpg')  no-repeat; */
		background-image: url('resources/images/images/errorPage/errorPage.jpg');
    	background-position: center top;
    	background-size: 100% auto;
	}
	
	label{
		font: normal;
		
		font-family: serif;
		font-size: 20px;
		color: #eeeeee;
	}
</style>

</head>
<body>
	<div style="height: 400px;"></div>
	
	<div id="message">
		<table align="center" border="0">
		  <tr>
		    <td align="center">
		    	<label>
		    		Some Issue with Database Connectivity, Our Engineers are solving issue.  
		    		<br></br>
		    	</label>
		    	<h3>Thanks for your Patience.</h3>
		    </td>
		  </tr>
		  <tr>
		    <td align="center">
		    	<label>
		    		<%=exception.getMessage() %>  
		    
		    	</label>
		   
		    </td>
		  </tr>
		  
		</table>
	</div>		

</body>
</html>

