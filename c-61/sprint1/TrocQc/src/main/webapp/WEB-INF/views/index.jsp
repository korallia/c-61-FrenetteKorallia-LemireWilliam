<%@include file="header.jsp"%>

<title>trOqc - Échanger entre pairs</title>
</head>

<body>
	
	<div class="container-fluid text-center ">
		<div class="row justify-content-center align-items-center">
			<img alt="" src="resources/images/iconB250p.png" class="logo">
		</div>
		
		
		<div class="row justify-content-center align-items-center">
				<div class="loginContainer align-items-center">
					<form action="helloServlet" method="post">
						<br>
						<div class="justify-content-center">
							COMPTE USAGER: <br> <input type="text" name="username" size="20"> <br>
							MOT DE PASSE: <br> <input type="password" name="password" size="20"> <br>
						<br>
						</div>
						
						<input type="submit" value="AUTHENTIFIER" /> 
						<br> <br>
						<a class="link">CRÉER UN COMPTE</a>
					</form>
				</div>
		</div>
			

			
			
				
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	</body>
</html>