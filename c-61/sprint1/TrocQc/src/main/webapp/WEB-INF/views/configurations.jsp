<!-- Fichier Jsp configuration.jsp
  Auteur:  William Lemire
  Équipe: William et Korallia 
  Ce fichier représente la vue de la page configuration de notre application
 -->


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
			<div class="col"></div>
			
			<div class="col">
				<div class="row justify-content-center" >
					<img alt="" src="resources/images/iconB250p.png" class="logo" onclick="redirectTo('Lobby')">
				</div>
			</div>
			
			<div class="col text-end ">
				<div class="row align-items-center ">
					<div class="col-sm-9 text-end">
						<div class ="row align-items-center mt-3"> <p>Salut, <%=user.getFirstName()%>!</p>  </div>
						<div class ="row "><a href="/TrocQc/logout" class="link">SE DÉCONNECTER</a></div>
					</div>
					<div class="col-sm-3 mt-4 pe-5"><img class="avatar" src="/TrocQc/getUserAvatar" id="id"/></div>
				</div>
			</div>
		</div>
		
		<div class="row justify-content-center align-items-center text-center text-center"  >
			<h1>CONFIGURATIONS</h1>
			<div class="configContainer justify-content-center align-items-center text-center">
				<form action="configsServlet" method="post" enctype="multipart/form-data">
					<div class="menuElement justify-content-center mt-2 id="SKUdiv">
						<h5>Modifier infos personnelles</h5>
						<div class="row mx-1">
							<div class = "col"> <input class="w-100" type="text" placeholder="Prénom" value="<%=user.getFirstName()%>" name="firstName"> </div>
							<div class = "col"> <input class="w-100" type="text" placeholder="Nom de Famille" value="<%=user.getLastName()%>" name="lastName"> </div>
						 </div> 
						<div class="row mx-1">
							<div class = "col"> <input class="w-100" type="text" placeholder="Courriel" value="<%=user.getEmail()%>" name="email"> </div>
						</div> 		
						
						<div class="row mx-1">
							<div class = "col"> <input class="w-100" type="text" placeholder="Nom de compte" value="<%=user.getUsername()%>" name="username"> </div>
						</div> 							
		
						<div class="row mx-1">
							<div class = "col"> <input class="w-100" type="text" placeholder="Adresse" value="<%=user.getAdress()%>" name="address"> </div>
						</div> 	
						
						<div class="row mx-1">
							<div class = "col"> <input class="w-100" type="text" placeholder="Ville" value="<%=user.getCity()%>" name="city"> </div>
							<div class = "col"> <input class="w-100" type="text" placeholder="Code Postal" value="<%=user.getPostalCode()%>" name="postalCode"> </div>
						 </div> 	
						 
						<div class="row mx-1">
							<div class = "col"> <input class="w-100" type="text" placeholder="Site web" value="<%=user.getSiteWeb()%>" name="url"> </div>
						</div> 										
						
					 	<div class="row justify-content-center mx-1"  >
							<select class="select text-align" name="productCategory" value="<%=user.getProductCategory()%>" >
							 <option value="0" >- CATÉGORIE DE PRODUITS - </option>
							<c:forEach items="${ProductCategorySet}" var="category">
							  <option value="${category}">${category}</option>
							</c:forEach>
							</select>
						</div>						
					</div>
					
					<div class="menuElement justify-content-center mt-2" id="changeProfilePic">
						<h5>Modifier la photo de profil</h5>
						<input type="file" placeholder="Téléverser" name="file" accept="image/png, image/jpeg"> 
					</div>						
					
					<div class="menuElement justify-content-center mt-2" id="modifyPassword">
						<h5>Modifier le mot de passe</h5>
						<div class="row mx-1 mb-2">
							<div class = "col"> <input class="w-100" type="password" placeholder="Nouveau mot de passe" name="newPassword"> </div>
						</div> 	
						
						<div class="row mx-1">
							<div class = "col"> <input class="w-100" type="password" placeholder="Répétez le mot de passe" name="repeatPassword"> </div>
						</div> 								
					</div>						
					
					<div >
						<input class="btn w-100 btmBtn text-center" type="submit" value="SAUVEGARDER">
					</div>
				</form>
			</div>		
		</div>
	</div>
<script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>