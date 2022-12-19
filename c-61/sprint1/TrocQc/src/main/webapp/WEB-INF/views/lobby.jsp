<%@include file="header.jsp"%>
<%@ page import="com.TrocQc.Entity.User"%>

<% 
	User user = (User)request.getSession().getAttribute("user"); 
%>

<title>trOqc - Le Hub</title>
</head>

<c:set var="pgTitle" value="Welcome" scope="request" />

<body>
	<div class="container-fluid">
		
		<div class="row mb-4">
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
		</div>
		

			
		<div class="row align-items-center">
			<div class="col align-items-center">
				<div class="row   "></div>
				 <div class="row m-5 justify-content-center  " > <button id="btnVentes" class="btn btn-primary w-75" onclick="redirectTo('Ventes')">VENTES</button> </div>
				 <div class="row m-5 justify-content-center"><button id="btnInventaire" class="btn btn-primary w-75" onclick="redirectTo('Inventaire')">INVENTAIRE</button></div>
				 <div class="row m-5 justify-content-center"><button id="btnFinances" class="btn btn-primary w-75" onclick="redirectTo('Finances')">FINANCES</button></div>
				 <div class="row m-5 justify-content-center"><button id="btnConfigs" class="btn btn-primary w-75" onclick="redirectTo('Configurations')">CONFIGURATIONS</button></div>
			</div>
			
			<div class="col">
				<div class="infoModule text-center" id="moduleWelcome">
					<img alt="" class="" src="resources/images/troqcLogoBlue400p.png">
					<br><br>
					<h3>Bienvenue, <%=user.getFirstName()%>. </h3>
					<p>Que fait-on aujourd'hui?</p>
				</div>			
			
				<div class="infoModule text-center" id="moduleVentes">
					<img alt="" class="modulePicture" src="resources/images/Sales.png">
					<br><br>
					<h3>VENTES</h3>
					<p>Échangez vos produits et/ou services à d'autres utilisateurs de TroQc. </p>
				</div>			
			
				<div class="infoModule text-center" id="moduleInventaire">
					<img alt="" class="modulePicture" src="resources/images/InventoryIcon.png">
					<br><br>
					<h3>INVENTAIRE</h3>
					<p>Ajoutez et gérez vos produits dans votre inventaire.</p>
				</div>
				
				<div class="infoModule text-center" id="moduleFinances">
					<img alt="" class="modulePicture" src="resources/images/Finances.png">
					<br><br>
					<h3>FINANCES</h3>
					<p>Consultez les finances de votre projet.</p>
				</div>
			
				<div class="infoModule text-center" id="moduleConfigs">
					<img alt="" class="modulePicture" src="resources/images/Configs.png">
					<br><br>
					<h3>CONFIGURATIONS</h3>
					<p>Modifier les configurations de votre compte.</p>
				</div>
			</div>
		</div>
		
		
		<div class="row m-4 ">
			<div class="d-flex justify-content-center "><button class="btn btn-primary" id="noteBtn" >BLOC-NOTES</button></div>
		</div>		
	</div>
	
	<div class="notePad" id="notePad">
		<form action="lobbyServlet" method="post">
			<div class="container mt-auto align-middle align-items-center">
				<div class="row mt-auto align-bottom justify-content-center d-flex align-items-center border" id="noteFormRow">
					<div class="xbtn" style="width: 30px" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
					<div class="col m-1 text-center""> <input type="text" placeholder="Sujet" name="subject" id="tempSubject"> </div>
					<div class="col m-1 text-center" > <input type="text" placeholder="Contenu" name="content" id="tempBody" style="width: 100%"> </div>
					
				</div>

				<div class="row mt-auto align-bottom justify-content-center d-flex align-items-center border">
					<div class="col text-center"> PosX <input type="range" name="xVal" value="0" min="0" max="420" id="range2" oninput="pinNote()" onchange="pinNote()"> </div>
					<div class="col text-center"> PosY <input type="range" name="yVal" value="80" min="80" max="420" cols="15" id="range1" oninput="pinNote()" onchange="pinNote()"> </div>
					<input class="col btn m-1" style="width: 90px" type="submit" value="ÉPINGLER" id="submitNote" onclick="">
					<input class="col btn m-1" style="width: 90px" type="button" value="MODIFIER" id="modSwitch" onclick="">
				</div>
				
				<c:forEach var="note" items="${noteList}">
					<div class="postIt" id="postIt" onclick="onClickManager(${note.id})" > 
						<p id="subject" class="mt-5 mx-4">${note.note_subject}</p>
						<p id="body" class="mx-4">${note.note_body}</p>
						<div id="id"> ${note.id}</div>
						<div id="coordinates"> ${note.posX} ${note.posY}</div>
					</div>
				</c:forEach>
			</div>
		</form>
	</div>
	
	<div class="modifyPad" id="modifyPad">
		<form action="lobbyServlet" method="post">
			<div class="container mt-auto align-middle align-items-center">
				<div class="row border" id="noteFormRow">
					<div class="xbtn m-1" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
					
				</div>

				<div class="row mt-auto align-bottom justify-content-center d-flex align-items-center border">
					<div class="col text-center""> <input type="text" placeholder="Sujet" name="newSubject" id="newFormSubject"> </div>
					<div class="col text-center" > <input type="text" placeholder="Contenu" name="newBody" id="newFormBody"> </div>
					<input class="col btn m-1" style="width: 60px" type="submit" value="MODIFIER" id="submitNote" onclick="">
					<input type="hidden" id="selectId" name="selectId">
					<input type="hidden" id="selectXPos" name="selectXPos">
					<input type="hidden" id="selectYPos" name="selectYPos">
				</div>
				
				<div class="row align-middle mt-auto align-bottom justify-content-center d-flex align-items-center">
					<div class="bigPostIt" id="bigPostIt">
						<p id="newSubject" class="mx-4" >SUBJ</p>
						<p id="newBody" class="mx-4" >BODY</p>
					</div>
				</div>	
				
			</div>
		</form>
	</div>
	
	<script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>