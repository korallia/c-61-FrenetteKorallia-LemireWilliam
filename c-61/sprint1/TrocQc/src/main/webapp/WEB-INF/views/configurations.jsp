<%@include file="header.jsp"%>

<title>trOqc - Configurations</title>

<% 
	User user = (User)request.getSession().getAttribute("user"); 
	if (user == null){
	response.sendRedirect("/TrocQc/Login");
	return;
	}
%>

</head>
<body>

	<div class="container-fluid text-center ">
		<div class="row mb-3">
			<div class="col">
			
			</div>
			
			<div class="col">
				<div class="row justify-content-center" >
					<img alt="" src="resources/images/iconB250p.png" class="logo" onclick="redirectTo('Lobby')">
				</div>
			</div>
			
	
			
			<div class="col text-end ">
				<div class="row align-items-center ">
					<div class="col-sm-9 text-end">
						<div class ="row align-items-center"> <p>Salut, <%=user.getFirstName()%>!</p>  </div>
						<div class ="row "><a class="link">SE DÉCONNECTER</a></div>
					</div>
					<div class="col-sm-3"><img class="avatar" src="/TrocQc/getUserAvatar" id="id"/></div>
				</div>
			</div>
		</div>
		
		<div class="row justify-content-center align-items-center text-center text-center"  >
			<h1>CONFIGURATIONS</h1>
			<form action="configServlet" method="post">
				<div class="configContainer justify-content-center align-items-center text-center">
	
					<h5>Modifier SKU</h5>
					<div class="SKUdiv justify-content-center mt-2 id="SKUdiv">
						<h5>Nombre de lettres par colonne</h5>
						<input type="number" placeholder="Nom" name="Name"> 
						<br>
						<input type="number" placeholder="Description" name="Description">
						<br>
						<c:forEach var="prod" items="${prodList}"> 		
								<c:forEach var="custCol" items="${prod.userCustomFields}">
									<input type="number" placeholder="${custCol.fieldtypeName}" name="${custCol.fieldtypeName}"> <br>
								</c:forEach>
						</c:forEach>
					</div>
					
					<div class="  ">
						<input class="btn w-100 btmBtn text-center" type="submit" value="SAUVEGARDER">
					</div>
					
				</div>			
			</form>

		</div>
			
			
	</div>
<script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>