<%@include file="header.jsp"%>
<title>trOqc - Finances</title>

<% 
	User user = (User)request.getSession().getAttribute("user"); 
	if (user == null){
	response.sendRedirect("/TrocQc/Login");
	return;
	}
%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/chart.js@2.7.1/dist/Chart.min.js"></script>
    <script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>
   	<script type="text/javascript" defer src="/TrocQc/resources/graph.js"></script>
   	<script type="text/javascript" defer src="/TrocQc/resources/finances.js"></script>

</head>

<body>
	<div class="container-fluid justify-content-center text-center text-align " id="financeContainer">
		<form action="financesServlet" method="post">

	
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
			</div>
			
			
			
			<div class="row justify-content-center">
				<div class="financeContainer">
					 	<div class="row justify-content-center"  >
							<div class="col text-center"> <h5>DATE DE DÉBUT</h5> </div>
							<div class="col text-center"> <h5>DATE DE FIN</h5> </div>
						</div>				
					 	<div class="row justify-content-center"  >
							<div class="col text-center"> <input type="date" min="2000-01-01" name="startDate" id="startDate"> </div>
							<div class="col text-center"> <input type="date" min="2000-01-01" name="endDate" id="endDate"> </div>
						</div>				
					<table class="centerTable w-100">
						<tr>
							<th colspan=2>TOTAL</th>
						</tr>
						
						<tr>
							<td colspan=2>
								<p id="totalProfit" class="totalExpense totalProfit">1070.69$</p>
							</td>
						</tr>
						
						<tr class="w-100">
							<td>MATÉRIAUX</td>
							<td> <p id="totalProfit" class="totalExpense">-150.00$</p></td>
						</tr>
						<tr>
							<td>PRODUITS</td>
							<td><p id="totalProfit" class="totalExpense">-1200.00$</p></td>
						</tr>
						<tr>
							<td>VENTES</td>
							<td><p id="totalProfit" class="totalExpense">2420.69$</p></td>
						</tr>
	
					</table>
	
					<div class="row justify-content-center">
						<div class="col mt-3 text-center "><button class="btn" type="submit">METTRE À JOUR</button></div>
						<div class="col mt-3 text-center">
							<button class="btn" id="openGraphBtn" onclick="showGraph(['Bing bong', 'Zooptop'], [4, 15])">TENDANCE</button>
						</div>
					</div>
					
													
				</div>
				
				<div class="row justify-content-center text-center">
					<h3 class="text-center">Modèle de régression: </h3> <br>
					<h4 id="regressionModel"><%= session.getAttribute("regModel") %></h4>
				</div>
				
				<canvas class="my-4" id="myChart" width="700" height="200" ></canvas>
				
				
				<c:forEach var="xVal" items="${xVals}">
					<c:forEach var="yVal" items="${yVals}">
						<script type="text/javascript" src="/TrocQc/resources/graph.js">addGraphValues(${xVal}, ${yVal})</script>
					</c:forEach >
				</c:forEach>
				
			
			</div>
		</form>
	</div>
	

    

</body>
</html>