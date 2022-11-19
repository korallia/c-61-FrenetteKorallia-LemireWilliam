/**
 * 
 */
 var img;
 var xdiv;
 var itis = false;
 var postIts;
 var selectedId;
 var selectedCoord;
 var selectedXPos;
 var selectedYPos;
window.onload = function(){
	//https://stackoverflow.com/questions/45278879/how-to-pass-variable-values-from-java-to-javascript
	function openNotePad () {

		var node = document.getElementById("notePad");
		node.style.display = "block";
	}
	
	if(!!document.getElementById("noteBtn")) {
		document.getElementById("noteBtn").addEventListener('click', openNotePad);
	}
	
	if (!!document.getElementsByName("postIt")) {
		//PIN ALL NOTES FROM DB
		postIts = document.getElementsByClassName("postIt");
		for(var i = 0; i < postIts.length; i++){
			var pos = postIts[i].lastElementChild.innerHTML.split(" ");
			var idNode = postIts[i].lastElementChild.previousElementSibling;
			postIts[i].lastElementChild.style.display = "none";
			idNode.style.display = "none";
			postIts[i].style.top = parseInt(pos[2]) + "px";
			postIts[i].style.left = pos[1] + "px";
			postIts[i].style.backgroundImage = "url('resources/images/bluepinpostit250p.png')";
			postIts[i].style.backgroundRepeat = "no-repeat";
			console.log(pos);
			
		}	
	}
		if(!!document.getElementById("modSwitch")) {
		document.getElementById("modSwitch").addEventListener('click', function() {
			itis = true;
			document.getElementById("newFormSubject").addEventListener('change', updateSubject);
			document.getElementById("newFormBody").addEventListener('change', updateBody);
		});
		
	}
}

function updateSubject() {
	var newSubj = document.getElementById("newSubject");
	var subjInput = document.getElementById("newFormSubject");
	newSubj.innerHTML = subjInput.value;
}

function updateBody() {
	var newBody = document.getElementById("newBody");
	var bodyInput = document.getElementById("newFormBody");
	newBody.innerHTML = bodyInput.value;
}

function onClickManager(id){
	if (itis) {
		modifyNote(id);
	}
	else { 
		deleteNote(id);
	}
	
	itis = false;
}

function modifyNote(id) {
	var node = document.getElementById('modifyPad');
	node.style.display = "block";
	var noteDiv = document.getElementById('bigPostIt');
	noteDiv.style.backgroundImage = "url('resources/images/bluepinpostit500p.png')";
	postIts = document.getElementsByClassName("postIt");
	intId = parseInt(id);

	for(var i = 0; i < postIts.length; i++){
		var idNode = postIts[i].lastElementChild.previousElementSibling.innerHTML;
		var coords = postIts[i].lastElementChild.innerHTML.split(" ");
		console.log(coords);
		selectedXPos = coords[1];
		selectedYPos = coords[2];
		var suj = postIts[i].firstElementChild.innerHTML;
		var bod = postIts[i].lastElementChild.previousElementSibling.previousElementSibling.innerHTML;
		
		var XposForm = document.getElementById("selectXPos");
		var YposForm = document.getElementById("selectYPos");
		
		XposForm.value = suj;
		YposForm.value = bod;
		
		if (idNode == id){
			var newsub = document.getElementById("newSubject");
			newsub.innerHTML = suj;
			var newbod = document.getElementById("newBody");
			newbod.innerHTML = bod;
			var idForm = document.getElementById("selectId");
			XposForm = document.getElementById("selectXPos");
			YposForm = document.getElementById("selectYPos");
			idForm.value = idNode.split(" ").join("");
			XposForm.value = selectedXPos;
			YposForm.value = selectedYPos;
		}
	}
}

function deleteNote(id) {
	
	console.log(id);
	var form = document.createElement('form');
	form.setAttribute("method", "post");
    form.setAttribute("action", "lobbyServlet");
    
	var noteToDelete = document.createElement('input');
	
	noteToDelete.name = "id";
	noteToDelete.value = id;
	noteToDelete.type = "text";
	
	form.appendChild(noteToDelete);
	document.body.appendChild(form);
	form.submit();
}

function pinNote() {
	var colors = {
		1: "resources/images/pinkpostit.png",
		2: "resources/images/bluepinpostit.png"
	};
	//top:60-420px 
	//left:0-420px
	var rdmMaxTop = (Math.random() * 420)+60;
	var rdmMaxLeft = (Math.random() * 420);
	var rdmSrc = Math.floor((Math.random() * Object.keys(colors).length)+1);
	var parent = document.getElementById("notePad");
	var postItDiv = document.createElement('div');
	postIt = document.createElement('img');
	postIt.className = "postIt";
	postIt.style.top = rdmMaxTop+"px";
	postIt.style.left = rdmMaxLeft+"px";
	postIt.src = colors[rdmSrc];
	postItDiv.appendChild(postIt);
	parent.appendChild(postItDiv);
}

function generateXBtn() {
	xdiv = document.createElement('div');
	img = document.createElement('img');
	img.className = 'xbtn';
	img.id = 'xbtn';
	img.src = 'resources/images/xbtn50p.png';
	img.x = 0;
	img.y = 0;
	img.addEventListener('click', closeWindow)
	xdiv.appendChild(img);
	return xdiv;
}


function closeWindow () {	
	var node = document.getElementById('notePad');
	var modNode = document.getElementById('modifyPad');
	
	if (modNode.style.display == "block") {
		modNode.style.display="none";
	}
	else if(node.style.display == "block"){
		node.style.display="none";
	}
	
	itis=false;
}


