<%@include file="header.jsp"%>
<%@ page import="com.TrocQc.Entity.User"%>

<title>trOqc - Le Hub</title>
</head>

<c:set var="pgTitle" value="Welcome" scope="request" />

<body>
	<div class="container-fluid">
		
		<div class="row mb-4">
			<div class="col">
			.
			</div>
			
			<div class="col">
				<div class="row justify-content-center" >
					<img alt="" src="resources/images/iconB250p.png" class="logo">
				</div>
			</div>
			
			<% User user = (User)request.getSession().getAttribute("username"); %>
			
			<div class="col text-end">
				<div class="row align-items-center">
					<div class="col-sm-9 text-end">
						<div class ="row align-items-center"> <p>Salut, <%=user.getFirstName()%>!</p>  </div>
						<div class ="row "><a class="link">SE DÉCONNECTER</a></div>
					</div>
					<div class="col-sm-3"><img alt="" src="resources/images/avatar.png"></div>
				</div>
			</div>
		</div>

			
		<div class="row align-items-center">
			<div class="col align-items-center   ">
				<div class="row   "></div>
				 <div class="row m-5 justify-content-center  " > <button class="btn btn-primary w-75">VENTES</button> </div>
				 <div class="row m-5 justify-content-center"><button class="btn btn-primary w-75">INVENTAIRE</button></div>
				 <div class="row m-5 justify-content-center"><button class="btn btn-primary w-75">FINANCES</button></div>
				 <div class="row m-5 justify-content-center"><button class="btn btn-primary w-75">CONFIGURATIONS</button></div>
			</div>
			
			<div class="col justify-content-center">
				<div class="box justify-content-center"></div>
			</div>
		</div>
		
		
		<div class="row m-4 noteBtn  text-align text-center">
			<div class="row m-5 justify-content-center  " > <button class="btn btn-primary w-75" id="noteBtn" >BLOC-NOTES</button> </div>

		</div>		
	</div>
	
	<div class="notePad" id="notePad">
			<form action="lobbyServlet" method="post">
				<div class="container mt-auto align-middle align-items-center">
					<div class="row mt-auto align-bottom justify-content-center d-flex align-items-center border" id="noteFormRow">
						<div class="xbtn" style="width: 30px" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
						<div class="col text-center""> <input type="text" placeholder="Sujet" name="subject"> </div>
						<div class="col mt-1 text-center" > <input type="text" placeholder="Contenu" name="content" style="width: 100%"> </div>
						
					</div>

					<div class="row mt-auto align-bottom justify-content-center d-flex align-items-center border">
						<div class="col text-center"> PosX <input type="range" name="yVal" value="80" min="80" max="420" id="range2"> </div>
						<div class="col text-center"> PosY <input type="range" name="xVal" value="0" min="0" max="420" cols="15" id="range1"> </div>
						<input class="col btn m-1" style="width: 90px" type="submit" value="ÉPINGLER" id="submitNote" onclick="">
						<input class="col btn m-1" style="width: 90px" type="button" value="MODIFIER" id="modSwitch" onclick="">
					</div>
					
					<c:forEach var="note" items="${noteList}">
						<div class="postIt" id="postIt" onclick="onClickManager(${note.id})" > 
							<p id="subject" class="mt-5 ms-4">${note.note_subject}</p>
							<p id="body" class="ms-4">${note.note_body}</p>
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
						<div class="xbtn" onclick="closeWindow()"> <img alt="" src="resources/images/xbtn50p.png"> </div>
						
					</div>

					<div class="row mt-auto align-bottom justify-content-center d-flex align-items-center border">
						<div class="col text-center""> <input type="text" placeholder="Sujet" name="newSubject" > </div>
						<div class="col text-center" > <input type="text" placeholder="Contenu" name="newContent" > </div>
						<input class="col btn m-1" style="width: 60px" type="submit" value="MODIFIER" id="submitNote" onclick="">
						
					</div>
					
					<div class="row align-middle mt-auto align-bottom justify-content-center d-flex align-items-center">
						<div class="bigPostIt">
							<p id="newSubject" class="mt-5 ms-4">SUBJ</p>
							<p id=" newBody" class="ms-4">BODY</p>
						</div>
					</div>
					
				</div>
			</form>
	</div>
	
	<script type="text/javascript" src="/TrocQc/resources/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>