<ul id="social_box">
	<sec:authorize var="loggedIn" access="isAuthenticated()" />
	<c:choose>
		<c:when test="${loggedIn}">
			<div class="dd-container">
				<div style="position: relative;" onmouseover="rollOver(this)" onmouseout="rollOut(this)">
					<div class="dd-action" style="width: 250px;">
						<p><em><%= request.getUserPrincipal().getName() %> </em></p>
					</div>
					<ul id="dropdown" style="display: none">
						<li><a href=" <c:url value="/j_spring_security_logout"/> "><span class="lang">Sign Out</span></a></li>
					</ul>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="dd-container">
				<div style="position: relative;" onmouseover="rollOver(this)" onmouseout="rollOut(this)">
					<div class="dd-action">
						<a href="../login.jsp" id="login" style="color: black;"> <b>Login</b> </a>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</ul>