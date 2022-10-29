<%@include file="header.jsp"%>
<title>trOqc - Créer Compte</title>
</head>

<body>
	<form action="inscriptionUsagerServlet" method="POST">
		<div class="container-fluid">
			<div class = "row h-100 ">
				<div class="col w-25 "> </div>
				
				<div class="col content">
					<div class="row justify-content-center">
						<img alt="" src="images/iconB250p.png" class="logo">
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
					 		<div class="col text-center">ADRESSE: <br> <input type="text" name="address" size="57"></div>
					 	</div>
					 	
					 	<div class="row">
					 		<div class="col text-center">VILLE: <br> <input type="text" name="city" size="20"></div>
					 		<div class="col text-center">CODE POSTAL: <br> <input type="text" name="postalcode" size="20"></div>
					 	</div>
					 	
					 	<div class="row justify-content-center"  >
							<select class="select text-align" >
							  <option value="0" >- CATÉGORIE DE PRODUITS - </option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							  <option value="4">Four</option>
							  <option value="5">Five</option>
							</select>
						</div>
							
					 	<div class="row ">
					 		<div class="col text-center">SITE WEB: <br> <input type="text" name="url" size="20"></div > 
					 		
					 		<div class="col avatar text-center">
					 			<a class="align-items-center">TÉLÉVERSER AVATAR</a> <img alt="" src="images/uploadBlk.png" >
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