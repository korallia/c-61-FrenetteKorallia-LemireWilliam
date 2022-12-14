<%@include file="header.jsp"%>

<title>trOqc - Ventes</title>

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
						<div class ="row "><a class="link">SE D�CONNECTER</a></div>
					</div>
					<div class="col-sm-3"><img class="avatar" src="/TrocQc/getUserAvatar" id="id"/></div>
				</div>
			</div>
		</div>
		
		<div class="row justify-content-center align-items-center" >
			<div class="ventesContainer justify-content-center align-items-center">
				<button class="btn mb-3 mt-5" onclick="" id="manualSaleBtn">ENTRER VENTE MANUELLE</button>
				<button class="btn mt-5">� VENIR</button>
			</div>
		</div>
		
		
		<div class="salesForm" id="salesForm">
			<div class="xbtn m-1" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
			
			<div class="container mt-auto align-middle">
				<form action="ventesServlet" method="post">
					<div class="row">
						<h3 class="text-center"> AJOUTER UNE VENTE </h3>
					</div>			
				
					<div class="row m-1">
						<input type="text" placeholder="Entrer le nom du client..." name="customerName" >
					</div>	
					
					<div class="row m-1">
						<select class="text-align" name="productId">
							<option value="0"> - Choisir un produit... - </option>
							<c:forEach var="product" items="${prodList}">
								<option value="${product.id}"> ${product.name} </option>
							</c:forEach>
						</select>
					</div>	
					
					<div class="col m-1"> <input class="w-100" type="number" step="any" placeholder="Entrer la quantit�" name="soldProductQuantity" > </div>
					
					<div> <input type="submit" value="AJOUTER VENTE"> </div>
				</form>
		</div>
		
		
		
	</div>
			
			
			
			
			
	</div>
<script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>