<%@include file="header.jsp"%>
<title>trOqc - Finances</title>
</head>

<body>
	<div class="container-fluid justify-content-center text-center text-align">
		<div class="row mb-3">

			<div class="col">
			
			</div>
			
			<div class="col">
				<div class="row justify-content-center" >
					<img alt="" src="resources/images/iconB250p.png" class="logo">
				</div>
			</div>
			
			<div class="col text-end">
				<div class="row align-items-center">
					<div class="col-sm-9 text-end">
						<div class ="row align-items-center"> <p>Salut, ___________________!</p>  </div>
						<div class ="row "><a class="link">SE DÉCONNECTER</a></div>
					</div>
					<div class="col-sm-3"><img alt="" src="images/avatarB.png"></div>
				</div>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="financeContainer">
				 	<div class="row justify-content-center"  >
						<select class="select text-align mb-3" >
						  <option value="0" >- CHOISIR LA PÉRIODE DÉSIRÉE - </option>
						  <option value="1">Jour</option>
						  <option value="2">Mois</option>
						  <option value="3">et cetera</option>
						</select>
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
					<tr>
						<td>AUTRES</td>
						<td><p id="totalProfit" class="totalExpense">0.00$</p></td>
					</tr>
				</table>
				<form action="">
					<div class="row ">
						<div class="col w-100"><input type="text" name="otherExpense" placeholder="Entrer une dépense..." size="15"></div>
						<div class="col ">
							<input type="number" name="expenseCost" placeholder="Coût" size="5">
							<input type="submit" value="+">
						</div>
					</div>				
				</form>
				<div class="row">
					<div class="col mt-3 "><button class="btn">METTRE À JOUR</button></div>
					<div class="col mt-3">
						<button class="btn" id="openGraphBtn" onclick="showGraph(['Bing bong', 'Zooptop'], [4, 15])">TENDANCE</button>
					</div>
				</div>
				
												
			</div>
			
			
			<canvas class="my-4" id="myChart" width="900" height="380" ></canvas>
		
		</div>
	
	</div>
	

    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/chart.js@2.7.1/dist/Chart.min.js"></script>
   	<script type="text/javascript" defer src="./graph.js"></script>
   	<script type="text/javascript" defer src="./finances.js"></script>
</body>
</html>