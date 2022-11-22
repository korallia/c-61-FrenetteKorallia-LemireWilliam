<%@include file="header.jsp"%>
<title>trOqc - Inventaire</title>
</head>

<body>
	<div class="container-fluid">
		<div class="row mb-3">
			<div class="col">
			.
			</div>
			
			<div class="col">
				<div class="row justify-content-center" >
					<img alt="" src="resources/images/iconB250p.png" class="logo" onclick="redirectTo('Lobby')">
				</div>
			</div>
			
			<% 
				User user = (User)request.getSession().getAttribute("user"); 
				if (user == null){
				response.sendRedirect("/TrocQc/Login");
				return;
				}
			%>
			
			<div class="col text-end ">
				<div class="row align-items-center ">
					<div class="col-sm-9 text-end">
						<div class ="row align-items-center"> <p>Salut, <%=user.getFirstName()%>!</p>  </div>
						<div class ="row "><a class="link">SE DÉCONNECTER</a></div>
					</div>
					<div class="col-sm-3"><img class="avatar" alt="" src="resources/images/<%=user.getAvatar()%>"></div>
				</div>
			</div>
			
		</div>
		
		
		<div class="row " >
			<!-- Tab links -->
			<div class="tab d-flex justify-content-center">
			  <button class="tablinks" onclick="openTab(event, 'Produits')">PRODUITS</button>
			  <button class="tablinks" onclick="openTab(event, 'Materiaux')">MATÉRIAUX</button>
			  <button class="tablinks" onclick="openTab(event, 'Templates')">TEMPLATES</button>
			  <button class="tablinks" onclick="openTab(event, 'Rapport')">RAPPORT</button>
			  
			</div>
			
			<!-- Tab content -->
			<div id="Produits" class="tabcontent text-center">
			  <h3>PRODUITS</h3>
			  <p>La liste de tous les produits en inventaire.</p>
			  <div class="tableDiv">
			  	<table class="table">
			  	<tr class="justify-content-center">
			  		<th> ID </th>
			  		<th>NOM</th>
			  		<th>QUANTITÉ</th>
			  		<th>SKU</th>
			  		<th>DESC</th>
			  		<th>COÛT</th>
			  		<th> M.S.R.P. </th>
			  		<th>MATÉRIAUX</th>
			  		<th>N.B.Q.</th>
			  		<th>DATE</th>
			  	</tr>
			  	
			  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>100</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>100</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>100</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>100</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>100</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  				  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>100</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  				  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>100</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  				  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>100</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  				  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>100</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  				  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>10</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  				  				  	<tr>
			  		<td>1</td>
			  		<td>TASSE LOGO</td>
			  		<td>100</td>
			  		<td>SKU</td>
			  		<td>Une tasse bien simple, mais avec logo au choix.</td>
			  		<td>15.99$</td>
			  		<td>14.99$</td>
			  		<td>-</td>
			  		<td>10</td>
			  		<td>10/10/22</td>
			  	</tr>
			  	
			  </table>
			  </div>
			  
  			<div class="row mt-3 text-center">
				<div class="col"> <button id="addProductBtn">AJOUTER</button> </div>
				<div class="col"> <button>MODIFIER</button> </div>
				<div class="col"><button>SUPPRIMER</button> </div>
			</div>
			  
			</div>
			
			<div id="Materiaux" class="tabcontent text-center">
			  <h3>MATÉRIAUX</h3>
			  <p>La liste de tous les matériaux en inventaire.</p>
			  
	   			<div class="row mt-3 text-center">
					<div class="col"> <button id="addMaterialBtn">AJOUTER</button> </div>
					<div class="col"> <button>MODIFIER</button> </div>
					<div class="col"><button>SUPPRIMER</button> </div>
				</div>
			</div>
			
			<div id="Templates" class="tabcontent text-center">
			  <h3>TEMPLATES</h3>
			  <p>Différents templates pour la création de produits.</p>
			</div>
			
			<div id="Rapport" class="tabcontent text-center ">
			  <h3>RAPPORT</h3>
			  <p>Exportez un rapport des tous les produits et matériaux en inventaire.</p>
			  <button class="btn text-center">GÉNÉRER RAPPORT</button>
			</div>
			
			

		</div>
		

		
		
		<div class="row"></div>
		
		<div class="productForm" id="productForm">
			<div class="xbtn m-1" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
			
			<div class="container mt-auto align-middle">
				<form action="/InventoryServlet" method="post">
				
					<div class="row">
						<h1 class="text-center"> AJOUTER UN PRODUIT </h1>
					</div>
					
					<div class="row m-1">
						<input type="text" placeholder="Entrer le nom du produit..." name="productName" >
					</div>
					
					<div class="row m-1">
						<input type="text" placeholder="Entrer le SKU du produit..." name="productSKU" >
					</div>
					
					<div class="row m-1">
						<div class="col m-1"> <input class="w-100" type="number" placeholder="Entrer la quantité" name="productQuantity" > </div>
						<div class="col m-1"> 
							<div class="selector">
								<select class="text-align">
									<option value="0"> - Choisir l'unité... - </option>
									<option value="1"> - Milli-litres - </option>
									<option value="1"> - Milli-mètres - </option>
								</select>
							</div>
						</div> 
						<div class="col m-1"> <input type="number" placeholder="Entrer le NBQ" name="productLQN" > </div>
					</div>
					
					<div class="row m-1">
						<div class="col m-1"> <input class="w-100" type="number" placeholder="Entrer le coût..." name="productCost" > </div>
						<div class="col m-1"> <input class="w-100" type="number" placeholder="Entrer le prix..." name="productPrice" > </div>
						<div class="col m-1"> <input class="w-100" type="number" placeholder="Entrer le MSRP..." name="productMSRP" > </div>
					</div>
					
					<div class="row m-1"> 
						<div class="col m-1"> <input type="file" name="barcode" placeholder="Téléverser un code barre"> </div>
						<div class="col m-1"> <input class="btn m-1" type="button" value="GÉNÉRER CODE BARRE" id="generateBarcodeBtn" onclick=""> </div>
					</div>
					
					<div class="row m-1"> 
						<div class="col m-1 text-center">Nouveau Champ</div>
						<div class="col m-1 text-center">Valeur</div>
						<div class="col m-1 text-center">Unité</div>
					</div>
					
					<div class="row m-1">
						<div class="col  text-center"> <input type="text" placeholder="Entrer le nouveau champ..." name="newFieldName1" > </div>
						<div class="col  text-center"> <input type="text" placeholder="Entrer la valeur..." name="newFieldValue1" > </div>
						<div class="col  text-center">
							<select class="text-align" name="newFieldUnit1">
								<option value="0"> - Choisir l'unité... - </option>
								<option value="1"> - Milli-litres - </option>
								<option value="2"> - Milli-mètres - </option>
							</select>
						</div>
					</div>
					
					<div class="row m-1">
						<div class="col  text-center"> <input type="text" placeholder="Entrer le nouveau champ..." name="newFieldName2" > </div>
						<div class="col  text-center"> <input type="text" placeholder="Entrer la valeur..." name="newFieldValue2" > </div>
						<div class="col  text-center">
							<select class="text-align" name="newFieldUnit2">
								<option value="0"> - Choisir l'unité... - </option>
								<option value="1"> - Milli-litres - </option>
								<option value="2"> - Milli-mètres - </option>
							</select>
						</div>
					</div>
					
				</form>	
			</div>
		
		</div>
		
		<div class="materialForm" id="materialForm"> 
			<div class="xbtn m-1" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
			
			<form action="/InventoryServlet" method="post">
				<div class="row ">
					<h1 class="text-center"> AJOUTER DU MATÉRIEL </h1>
				</div>
				
				<div class="row m-1">
					<input type="text" placeholder="Entrer le nom du matériel..." name="materialName">
				</div>					
				
				<div class="row m-1">
					<div class="col "> <input class="" type="number" placeholder="Entrer la quantité" name="materialQuantity" > </div>
					<div class="col "> 
						<div class="selector w-100">
							<select class="text-align w-100"">
								<option value="0"> - Choisir l'unité... - </option>
								<option value="1"> - Milli-litres - </option>
								<option value="1"> - Milli-mètres - </option>
							</select>
						</div>
					</div> 
				</div>
				
				<div class="row m-1">
					<div class="col "> <input type="number" placeholder="Entrer le NBQ" name="materialLQN" > </div>
					<div class="col "> <input type="number" placeholder="Entrer le coût" name="materialCost" > </div>
				</div>
				
				<div class="row m-1 border mt-3">
					<h4 class="text-center">AJOUTER UN NOUVEAU CHAMP</h4>
					<div class="col my-2"> <input type="text" placeholder="Nom du champ..." name="materialNewFieldName1" > </div>
					<div class="col my-2"> <input type="text" placeholder="Valeur du champ..." name="materialNewFieldValue1" > </div>

				</div>
				
				<div class="row " id="noteBtn">
					<div class="d-flex justify-content-center"><input type="submit" class="btn " value="AJOUTER MATÉRIEL"></div>
					
					
				</div>
			</form >
			
		</div>
		
	</div>
	
	<script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>
	<script type="text/javascript" src="/TrocQc/resources/inventaire.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>