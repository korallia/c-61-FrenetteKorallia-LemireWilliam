<%@include file="header.jsp"%>
<title>trOqc - Créer Compte</title>

</head>

<body>	<script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>
	<form action="inscriptionUsagerServlet" method="POST" enctype="multipart/form-data">
		<div class="container-fluid">
			<div class = "row h-100 ">
				<div class="col w-25 "> </div>
				
				<div class="col content">
					<div class="row justify-content-center">
						<img alt="" src="resources/images/iconB250p.png" class="logo" onclick="redirectTo('Login')">
					</div>
					
					<div class="row accountContainer justify-content-center ">
					 	<div class="row title  ">
					 		<h1>CRÉATION DE COMPTE</h1>
					 	</div>
					 	
					 	<div class="row">
					 		<div class="col text-center">PRÉNOM: <br> <input type="text" name="firstname" size="20"></div>
					 		<div class="col text-center">NOM DE FAMILLE: <br> <input type="text" name="lastname" size="20"></div>
					 	</div>
					 	
					 	<div class="row ">
					 		<div class="col text-center">COURRIEL: <br> <input type="text" name="email" size="57"></div>
					 	</div>
					 	
					 	<div class="row ">
					 		<div class="col text-center">NOM DE COMPTE: <br> <input type="text" name="accountname" size="57"></div>
					 	</div>
					 	
					 	<div class="row ">
					 		<div class="col text-center">MOT DE PASSE: <br> <input type="password" name="password" size="57"></div>
					 	</div>
					 	
					 	<div class="row ">
					 		<div class="col text-center">RÉÉCRIRE MOT DE PASSE: <br> <input type="password" name="passwordVerif" size="57"></div>
					 	</div>
					 	
					 	<div class="row ">
					 		<div class="col text-center">ADRESSE: <br> <input type="text" name="address" size="57"></div>
					 	</div>
					 	
					 	<div class="row">
					 		<div class="col text-center">VILLE: <br> <input type="text" name="city" size="20"></div>
					 		<div class="col text-center">CODE POSTAL: <br> <input type="text" name="postalcode" size="20"></div>
					 	</div>
					 	
					 	<div class="row justify-content-center"  >
							<select class="select text-align" name="categorie" >
							 <option value="0" >- CATÉGORIE DE PRODUITS - </option>
							<c:forEach items="${ProductCategorySet}" var="category">
							  <option value="${category}">${category}</option>
							</c:forEach>
							</select>
						</div>
							
					 	<div class="row ">
					 		<div class="col text-center">SITE WEB: <br> <input type="text" name="url" ></div > 
					 		
						 		<div class="col text-center">
						 		<div class="row"> <span> <a class=" align-items-center pr-2">TÉLÉVERSER AVATAR</a><img class="icon"  src="resources/images/uploadBlk.png" > </span> </div>
						 		<div class="row"><input type="file" name="file" accept="image/png, image/jpeg" /></div>					 			
					 		</div> 
					 	</div>
					 	
					 	<div class="row button">
							<button>
								CRÉER MON COMPTE
							</button>
					 	</div>
					 	
					</div>			
				</div>
				
				<div class="col w-25 "> </div>
			</div>			
		</div>
	</form>
		<script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>
</body>
</html>