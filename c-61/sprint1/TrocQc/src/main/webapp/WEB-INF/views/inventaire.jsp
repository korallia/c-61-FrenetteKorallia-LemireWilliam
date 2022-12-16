<%@include file="header.jsp"%>
<%@ page import="com.TrocQc.Entity.RawMaterial"%>
<title>trOqc - Inventaire</title>

<% 
	User user = (User)request.getSession().getAttribute("user"); 
	if (user == null){
	response.sendRedirect("/TrocQc/Login");
	return;
	}
%>


</head>

<body>
	<div class="container-fluid">
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
						<div class ="row align-items-center mt-3"> <p>Salut, <%=user.getFirstName()%>!</p>  </div>
						<div class ="row "><a class="link">SE DÉCONNECTER</a></div>
					</div>
					<div class="col-sm-3 mt-4 pe-5"><img class="avatar" src="/TrocQc/getUserAvatar" id="id"/></div>
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
			  		<th>DESCRIPTION</th>
			  		<th>SKU</th>
			  		<th>QUANTITÉ</th>
			  		<th>COÛT</th>
			  		<th>PRIX</th>
			  		<th>UNITÉ</th>
			  		<th>MATÉRIAUX</th>
			  		<th>N.B.Q.</th>
			  		<th>DATE</th>
					<th> CUSTOM COL 1 </th>
					<th> CUSTOM COL 2 </th>
					<th> CUSTOM COL 3 </th>	
			  	</tr>
			  	
			  	
				<c:forEach var="product" items="${prodList}">
					<c:forEach var="lot" items="${product.lots}">
						
						<tr>
							<td> ${product.id}</td>
							<td> ${product.name}</td>
							<td> ${product.description}</td>
							<td> ${product.sku}</td>
							<td>${lot.availablequantity}</td>
							<td> ${product.cost} $</td>
							<td> ${product.msrp} $</td>
							<td> ${product.unitofmeasure.name} </td>
							
							<td>
								<c:forEach var="rawMat" items="${product.rawmaterials}">
									${rawMat.rawmaterial.name}
								</c:forEach>
							</td>
							
							<td> ${product.lowQuantityLevel} </td>
							<td> DATE </td>
							
							<c:forEach var="custCol" items="${product.userCustomFields}" >
								<td> ${custCol.fieldtypeName}:  ${custCol.fieldvalue}</td>
							</c:forEach>		
						
	
						</tr>
					
					
					</c:forEach>
					
			
				</c:forEach>				  	
			  	
			  	
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
	  		  <div class="tableDiv" >
			  	<table class="table" id="matTable">
				  	<tr class="justify-content-center">
				  		<th> ID </th>
				  		<th>NOM</th>
				  		<th>COÛT</th>
				  		<th>QUANTITÉ</th>
				  		<th>UNITÉ</th>
				  		<th>DATE</th>
				  		<th>CUSTOM1</th>
				  		<th>CUSTOM2</th>
				  		<th>CUSTOM3</th>
				  	</tr>
			  	
					<c:forEach var="rawMaterial" items="${rmList}">
						<tr class="matRow" id="matRow">
							<td> ${rawMaterial.id}</td>
							<td> ${rawMaterial.name}</td>
							<td> ${rawMaterial.cost} $</td>
							<td> ${rawMaterial.quantity} </td>
							<td> ${rawMaterial.unitofmeasure.name} </td>
							<td> ${rawMaterial.addedDate} </td>
							<c:forEach var="custCol" items="${rawMaterial.userCustomFields}" >
								<td> ${custCol.fieldtypeName}:  ${custCol.fieldvalue}</td>
							</c:forEach>		
							
							
							
						

							
						
							<td>  </td>
						</tr>
					</c:forEach>			  	
				 </table>
		   			<div class="row mt-3 text-center">
						<div class="col"> <button id="addMaterialBtn">AJOUTER</button> </div>
						<div class="col"> <button id="modMaterialBtn">MODIFIER</button> </div>
						<div class="col"><button>SUPPRIMER</button> </div>
					</div>
				</div>
			</div>
			<div id="Templates" class="tabcontent text-center">
			  <h3>TEMPLATES</h3>
			  <p>Différents templates pour la création de produits.</p>
	   		  <div class="tableDiv">
			  	<table class="table">
				  	<tr class="justify-content-center">
				  		<th> ID </th>
				  		<th>NOM</th>
				  		<th>DESCRIPTION</th>
				  		<th>SKU</th>
				  		<th>COÛT</th>
				  		<th>PRIX</th>
				  		<th>UNITÉ</th>
				  		<th>DATE</th>
						<th> CUSTOM COL 1 </th>
						<th> CUSTOM COL 2 </th>
						<th> CUSTOM COL 3 </th>
				  	</tr>
			  	
					<c:forEach var="product" items="${prodList}">
						<tr>
							<td> ${product.id}</td>
							<td> ${product.name}</td>
							<td> ${product.description}</td>
							<td> ${product.sku}</td>
							<td> ${product.cost} $</td>
							<td> ${product.msrp} $</td>
							<td> ${product.unitofmeasure.name} </td>
							<td> ${product.addedDate} </td>
							<c:forEach var="custCol" items="${product.userCustomFields}" >
								<td> ${custCol.fieldtypeName}:  ${custCol.fieldvalue}</td>
							</c:forEach>									
						</tr>
					</c:forEach>			  	
				 </table>
		   			<div class="row mt-3 text-center">
						<div class="col"> <button id="addTemplateBtn">AJOUTER</button> </div>
						<div class="col"> <button>MODIFIER</button> </div>
						<div class="col"><button>SUPPRIMER</button> </div>
					</div>
				</div>
	   		  			  
			</div>
			
			<div id="Rapport" class="tabcontent text-center ">
			  <h3>RAPPORT</h3>
			  <p>Exportez un rapport des tous les produits et matériaux en inventaire.</p>
			  <button class="btn text-center">GÉNÉRER RAPPORT</button>
			</div>
			
			

		</div>
		

		
		
		<div class="row"></div>
		<!-- ADD PRODUCT FORM -->
		<div class="productForm justify-content-center" id="productForm">
			<div class="xbtn m-1" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
			
			<div class="container mt-auto align-middle">
				<form action="inventoryServlet" method="post">
				
					<div class="row">
						<h1 class="text-center"> AJOUTER UN PRODUIT </h1>
					</div>
					
					<div class="row m-1">
						<select class="text-align" name="productId">
							<option value="0"> - Choisir un produit... - </option>
							<c:forEach var="product" items="${prodList}">
								<option value="${product.id}"> ${product.name} </option>
							</c:forEach>
						</select>
					</div>
					
					<div class="row m-1">
						<input type="number" step="any" placeholder="Entrer la quantité..." name="productQuantity" >
					</div>
					
					<div class="row m-1">
						Date de péremption:
						<input type="date" name="productBestBeforeDate" >
					</div>
					
					<div class=" d-flex justify-content-center"> <input class="btn btnprimary mt-3 " type="submit" value="AJOUTER À L'INVENTAIRE">  </div>
					
				</form>	
			</div>
		
		</div>
		
		<!-- ADD MATERIAL FORM -->
		<div class="materialForm" id="materialForm"> 
			<div class="xbtn m-1" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
			
			<form action="inventoryServlet" method="post">
			

			
				<div class="row ">
					<h1 class="text-center"> AJOUTER DU MATÉRIEL </h1>
				</div>
				
				<div class="row m-1">
					<input type="text" placeholder="Entrer le nom du matériel..." name="materialName">
				</div>					
				
				<div class="row m-1">
					<div class="col "> <input class="w-100" type="number" step="any" min="0.00"  placeholder="Entrer la quantité" name="materialQuantity" > </div>
					<div class="col "> 
						<div class="selector w-100">
							<select class="text-align w-100" name="materialUOM">
								<option value="0"> - Choisir l'unité... - </option>
								<c:forEach var="unitOfMeasure" items="${uomList}">
									<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
								</c:forEach>
							</select>
						</div>
					</div> 
				</div>
				
				<div class="row m-1">
					<div class="col "> <input class="w-100" type="number" step="any" min="0.00" placeholder="Entrer le NBQ" name="materialLQN" > </div>
					<div class="col "> <input class="w-100" type="number" step="any" min="0.00" placeholder="Entrer le coût" name="materialCost" > </div>
				</div>
				
				<h4 class="text-center">AJOUTER UN NOUVEAU CHAMP</h4>
				<div class="border">
					<div class="row">
						<div class="col my-2"> <input type="text" placeholder="Nom du champ..." name="materialNewFieldName1" > </div>
						<div class="col my-2"> <input type="text" placeholder="Valeur du champ..." name="materialNewFieldValue1" > </div>
						<div class="col my-2">
							<select class="text-align w-100" name="materialNewFieldUOM1">
								<option value="0"> - Choisir l'unité... - </option>
								<c:forEach var="unitOfMeasure" items="${uomList}">
									<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
								</c:forEach>
							</select>
						</div>							
					</div>
					<div class="row">
						<div class="col my-2"> <input type="text" placeholder="Nom du champ..." name="materialNewFieldName2" > </div>
						<div class="col my-2"> <input type="text" placeholder="Valeur du champ..." name="materialNewFieldValue2" > </div>
						<div class="col my-2">
							<select class="text-align w-100" name="materialNewFieldUOM2">
								<option value="0"> - Choisir l'unité... - </option>
								<c:forEach var="unitOfMeasure" items="${uomList}">
									<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
								</c:forEach>
							</select>
						</div>						
					</div>
					<div class="row ">
						<div class="col my-2"> <input type="text" placeholder="Nom du champ..." name="materialNewFieldName3" > </div>
						<div class="col my-2"> <input type="text" placeholder="Valeur du champ..." name="materialNewFieldValue3" > </div>
						<div class="col my-2">
							<select class="text-align w-100" name="materialNewFieldUOM3">
								<option value="0"> - Choisir l'unité... - </option>
								<c:forEach var="unitOfMeasure" items="${uomList}">
									<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
								</c:forEach>
							</select>
						</div>							
					</div>		
				</div>
		
				<div class="row " id="noteBtn">
					<div class="d-flex justify-content-center"><input type="submit" class="btn " value="AJOUTER MATÉRIEL"></div>
				</div>
			</form >
		</div>
		
		
		
		
		
		
		
		
		
		<!-- MODIFY MATERIAL FORM -->
		
		<div class="materialForm" id="modifyMaterialForm">
			<div class="xbtn m-1" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
			
			<form action="inventoryServlet" method="post">
			
				<input type="hidden" name="hiddenProdId" id="hiddenProdId">
				<div class="row ">
					<h1 class="text-center"> MODIFIER DU MATÉRIEL </h1>
				</div>
				
				<div class="row m-1">
					<input id="modMaterialName" type="text" placeholder="Entrer le nom du matériel..." name="materialName">
				</div>					
				
				<div class="row m-1">
					<div class="col "> <input id="modMaterialQuantity" class="w-100" type="number" step="any" min="0.00"  placeholder="Entrer la quantité" name="materialQuantity" > </div>
					<div class="col "> 
						<div class="selector w-100">
							<select class="text-align w-100" name="materialUOM" id="modMaterialUOM">
								<option value="0"> - Choisir l'unité... - </option>
								<c:forEach var="unitOfMeasure" items="${uomList}">
									<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
								</c:forEach>
							</select>
						</div>
					</div> 
				</div>
				
				<div class="row m-1">
					<div class="col "> <input id="modMaterialLQN" class="w-100" type="number" step="any" min="0.00" placeholder="Entrer le NBQ" name="materialLQN" > </div>
					<div class="col "> <input id="modMaterialCost" class="w-100" type="number" step="any" min="0.00" placeholder="Entrer le coût" name="materialCost" > </div>
				</div>
				
				<h4 class="text-center">AJOUTER UN NOUVEAU CHAMP</h4>
				<div class="border">
					<div class="row">
						<div class="col my-2"> <input class="w-100" id="modMaterialNewFieldName1"  type="text" placeholder="Nom du champ..." name="materialNewFieldName1" > </div>
						<div class="col my-2"> <input class="w-100" id="modMaterialNewFieldValue1" type="text" placeholder="Valeur du champ..." name="materialNewFieldValue1" > </div>
						
					</div>
					<div class="row">
						<div class="col my-2"> <input class="w-100" id="modMaterialNewFieldName2" type="text" placeholder="Nom du champ..." name="materialNewFieldName2" > </div>
						<div class="col my-2"> <input class="w-100" id="modMaterialNewFieldValue2" type="text" placeholder="Valeur du champ..." name="materialNewFieldValue2" > </div>					
					</div>
					<div class="row ">
						<div class="col my-2"> <input class="w-100" id="modMaterialNewFieldName3" type="text" placeholder="Nom du champ..." name="materialNewFieldName3" > </div>
						<div class="col my-2"> <input class="w-100" id="modMaterialNewFieldValue3" type="text" placeholder="Valeur du champ..." name="materialNewFieldValue3" > </div>
						
					</div>		
				</div>
		
				<div class="row " id="noteBtn">
					<div class="d-flex justify-content-center"><input type="submit" class="btn " value="AJOUTER MATÉRIEL"></div>
				</div>
			</form >			
		</div>
		
		
		
		
		
		
		
		
		
		<!-- ADD TEMPLATE FORM -->
		
		<div class="addTemplateForm" id="addTemplateForm">
			<div class="xbtn m-1" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
			<div class="container mt-auto align-middle">
				<form action="inventoryServlet" method="post">
					<div class="row ">
						<h1 class="text-center"> AJOUTER UN TEMPLATE </h1>
					</div>
					
					<div class="row m-1">
						<input type="text" placeholder="Entrer le nom du produit..." name="templateName" >
					</div>
					
					<div class="row m-1">
						<input type="text" placeholder="Entrer le SKU du produit..." name="templateSKU" >
					</div>
					
					<div class="row m-1">
						<input type="text" placeholder="Entrer la description du produit..." name="templateDesc" >
					</div>
					
					<div class="row m-1">
						<div class="col m-1"> <input class="w-100" type="number" placeholder="Entrer la quantité" name="templateQuantity" > </div>
						<div class="col m-1"> 
							<div class="selector">
								<select class="text-align" name="templateUOM">
									<option value="0"> - Choisir l'unité... - </option>
									<c:forEach var="unitOfMeasure" items="${uomList}">
										<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
									</c:forEach>
								</select>
							</div>
						</div> 
						<div class="col m-1"> <input type="text" placeholder="Entrer le NBQ" name="templateLQL" > </div>
					</div>
					
					<div class="row m-1">
						<div class="col m-1"> <input class="w-100" type="number" step="any" placeholder="Entrer le coût..." name="templateCost" > </div>
						<div class="col m-1"> <input class="w-100" type="number" step="any" placeholder="Entrer le prix..." name="templatePrice" > </div>
						<div class="col m-1"> <input class="w-100" type="number" step="any" placeholder="Entrer le MSRP..." name="templateMSRP" > </div>
					</div>
					
					<div class="row m-1"> 
						<div class="col m-1"> <input type="file" name="barcode" placeholder="Téléverser un code barre"> </div>
						<div class="col m-1"> <input class="btn m-1" type="button" value="GÉNÉRER CODE BARRE" id="generateBarcodeBtn" onclick=""> </div>
					</div>
					
					<div class="row my-1 border">
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
									<c:forEach var="unitOfMeasure" items="${uomList}">
										<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row m-1">
							<div class="col  text-center"> <input type="text" placeholder="Entrer le nouveau champ..." name="newFieldName2" > </div>
							<div class="col  text-center"> <input type="text" placeholder="Entrer la valeur..." name="newFieldValue2" > </div>
							<div class="col  text-center">
								<select class="text-align" name="newFieldUnit2">
									<option value="0"> - Choisir l'unité... - </option>
									<c:forEach var="unitOfMeasure" items="${uomList}">
										<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row m-1">
							<div class="col  text-center"> <input type="text" placeholder="Entrer le nouveau champ..." name="newFieldName3" > </div>
							<div class="col  text-center"> <input type="text" placeholder="Entrer la valeur..." name="newFieldValue3" > </div>
							<div class="col  text-center">
								<select class="text-align" name="newFieldUnit3">
									<option value="0"> - Choisir l'unité... - </option>
									<c:forEach var="unitOfMeasure" items="${uomList}">
										<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					
					<div class="row border">
						<div class="row m-1">
							<div class="col m-1 text-center">Matériaux</div>
							<div class="col m-1 text-center">Quantité</div>
							<div class="col m-1 text-center">Unité</div>
						</div>
					
						<div class="row m-1">
							<div class="col text-center">
								<select class="text-align" name="rawMaterialId1">
									<option value="0"> - Choisir du matériel... - </option>
									<c:forEach var="rawMaterial" items="${rmList}">
										<option value="${rawMaterial.id}"> ${rawMaterial.name} </option>
									</c:forEach>
								</select>
							</div>
							
							<div class="col text-center"> <input type="text" placeholder="Entrer la valeur..." name="rawMaterialQuantity1" > </div>
							
							<div class="col text-center">
								<select class="text-align" name="rawMaterialUOM1">
									<option value="0"> - Choisir l'unité... - </option>
									<c:forEach var="unitOfMeasure" items="${uomList}">
										<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row m-1">
							<div class="col text-center">
								<select class="text-align" name="rawMaterialId2">
									<option value="0"> - Choisir du matériel... - </option>
									<c:forEach var="rawMaterial" items="${rmList}">
										<option value="${rawMaterial.id}"> ${rawMaterial.name} </option>
									</c:forEach>
								</select>
							</div>
							
							<div class="col text-center"> <input type="text" placeholder="Entrer la valeur..." name="rawMaterialQuantity2" > </div>
							
							<div class="col text-center">
								<select class="text-align" name="rawMaterialUOM2">
									<option value="0"> - Choisir l'unité... - </option>
									<c:forEach var="unitOfMeasure" items="${uomList}">
										<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row m-1">
							<div class="col text-center">
								<select class="text-align" name="rawMaterialId3">
									<option value="0"> - Choisir du matériel... - </option>
									<c:forEach var="rawMaterial" items="${rmList}">
										<option value="${rawMaterial.id}"> ${rawMaterial.name} </option>
									</c:forEach>
								</select>
							</div>
							
							<div class="col text-center"> <input type="text" placeholder="Entrer la valeur..." name="rawMaterialQuantity3" > </div>
							
							<div class="col text-center">
								<select class="text-align" name="rawMaterialUOM3">
									<option value="0"> - Choisir l'unité... - </option>
									<c:forEach var="unitOfMeasure" items="${uomList}">
										<option value="${unitOfMeasure.id}"> ${unitOfMeasure.abbrievation} </option>
									</c:forEach>
								</select>
							</div>
						</div>												
					</div>
					
					<div class=" d-flex justify-content-center"> <input class="btn" type="submit" value="AJOUTER TEMPLATE"> </div>
					
				</form >
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>
	<script type="text/javascript" src="/TrocQc/resources/inventaire.js" charset="UTF-8"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>