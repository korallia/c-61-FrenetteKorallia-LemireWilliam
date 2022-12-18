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
   	


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Jour', 'Ventes', 'Prédictions'],
          <c:forEach var="value" items="${values}">
          ['${value.date}',  ${value.ventes}, ${value.prediction}]<c:if test="${!loop.last}">,</c:if>
          </c:forEach>
        ]);

        var options = {
          title: 'Ventes',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>

</head>

<body>
	<div class="container-fluid justify-content-center text-center text-align " id="financeContainer">
		<form action="/TrocQc/Finances" method="get">
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
							<div class ="row "><a class="link">SE DÉCONNECTER</a></div>
						</div>
						<div class="col-sm-3 mt-4 pe-5"><img class="avatar" src="/TrocQc/getUserAvatar" id="id"/></div>
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
							<div class="col text-center"> <input type="date" min="2020-01-01" value="${startDate}" name="startDate" id="startDate"> </div>
							<div class="col text-center"> <input type="date" min="2020-01-01" value="${endDate}" name="endDate" id="endDate"> </div>
						</div>				
					<table class="centerTable w-100">
						<tr>
							<th colspan=2>TOTAL</th>
						</tr>
						
						<tr>
							<td colspan=2>
								<p id="totalProfit" class="totalExpense totalProfit">${profit}$</p>
							</td>
						</tr>
						
						<tr class="w-100">
							<td>MATÉRIAUX</td>
							<td> <p id="totalProfit" class="totalExpense">-${productcost}$</p></td>
						</tr>
						<tr>
							<td>PRODUITS</td>
							<td><p id="totalProfit" class="totalExpense">-${rawmaterialcost}$</p></td>
						</tr>
						<tr>
							<td>VENTES</td>
							<td><p id="totalProfit" class="totalExpense">${sales}$</p></td>
						</tr>
	
					</table>
	
					<div class="row justify-content-center">
						<div class="col mt-6 text-center "><button class="btn" type="submit">METTRE À JOUR</button></div>
						
					</div>
					
													
				</div>
				
				<div class="row justify-content-center text-center">
					<h3 class="text-center">Modèle de régression: </h3> <br>
					<h4 id="regressionModel2">${regModel}</h4>
				</div>
				
				
				  <div id="curve_chart" style="width: 900px; height: 500px"></div>
				  
				<!-- 
				<canvas class="my-4" id="myChart" width="700" height="200" ></canvas>
				
				
				<c:forEach var="xVal" items="${xVals}">
					<c:forEach var="yVal" items="${yVals}">
						<script type="text/javascript">addGraphValues(${xVal}, ${yVal})</script>
					</c:forEach >
				</c:forEach>
-->
			</div>
		</form>
	</div>

</body>
</html>