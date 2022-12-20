<!-- Fichier Jsp configuration.jsp
  Auteur:  William Lemire
  Équipe: William et Korallia 
  Ce fichier représente la vue de la page login de notre application
 -->


<%@include file="header.jsp"%>

<title>trOqc - Échanger entre pairs</title>
</head>

<body>
	
	

	


	
	
	<div class="container-fluid text-center ">
		<div class="row justify-content-center align-items-center">
			<img alt="" src="resources/images/iconB250p.png" class="logo">
		</div>
		
		
		<div class="row justify-content-center align-items-center">
			<div class="loginContainer align-items-center" id="loginContainer">
				<form action="loginServlet" method="post">
					<p id="inputAlert" class="inputAlert">OOPS! Recommencez...</p>
					<div class=" mt-1 justify-content-center">
						COMPTE USAGER: <br> <input id="usernameField" type="text" name="username" size="20"> <br>
						MOT DE PASSE: <br> <input id="passwordField" type="password" name="password" size="20"> <br>
					<br>
					</div>
					
					<input type="submit" value="AUTHENTIFIER" /> 
					<br> <br>
					<a class="linkBlk" onclick="redirectTo('Inscription')">CRÉER UN COMPTE</a> <br>
					<input type="submit" name="forgotpwd" value="MOT DE PASSE OUBLIÉ" />
				</form>
			</div>
		</div>
	</div>

	
	<% String loginError = (String)session.getAttribute("loginError");%>
	
	<script type="text/javascript">
		if(<%=loginError%> == "true"){
			document.getElementById("inputAlert").style.visibility = "visible";
			document.getElementById("loginContainer").style.backgroundColor = "#FF0000";
		}
	</script>
	
	<script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	</body>
</html>