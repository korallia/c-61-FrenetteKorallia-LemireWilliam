/**
 * 
 */
 var img;
 var xdiv;
 var itis = false;
 var postIts;
window.onload = function(){
	//https://stackoverflow.com/questions/45278879/how-to-pass-variable-values-from-java-to-javascript
	function openNotePad () {
		/*
		var notes = '${noteList}';
				
		console.log(notes);
		
		var div = document.createElement('div');
		div.className = 'notePad';
		div.id = 'notePad';
		
		var divBuffer = document.createElement('div');
		divBuffer.className = 'notePadBuffer';
		divBuffer.id = 'mainContain';
		
		var xdiv = generateXBtn();
		
		form = document.createElement('form');
		formDiv = document.createElement('div');
		row = document.createElement('div');
		noteContent = createFormElement("div", "col text-center", null, null, null, null);
		noteSubject = createFormElement("div", "col text-center", null, null, null, null);
		noteX = createFormElement("div", "col text-center", null, null, null, null);
		noteY = createFormElement("div", "col text-center", null, null, null, null);
		submitButton = createFormElement("div", "col text-center", null, null, null, null);
		
		form.setAttribute("method", "post");
        form.setAttribute("action", "lobbyServlet");
		
		formDiv.className = "container mt-auto align-middle align-items-center";
		row.className = "row mt-auto align-bottom justify-content-center d-flex align-items-center border";
		row.id = "noteFormRow";
		//noteSubject.className = "col text-center";
		//noteContent.className = "col mt-1 text-center";
		//submitButton.className = "col text-center";
		
		//createFormElement(returnType, className, id, type, placeHolder, name)
		
		var noteSub = createFormElement("input", null, null, "text", "Sujet", "subject");
		noteSub.size = 20;
		
		var noteCont = createFormElement("input", null, null, "text", "Contenu", "content");
		noteCont.cols = 35;
		noteCont.rows = 1.5;
		
	//top:60-420px 
	//left:0-420px		
		var noteXval = createFormElement("input", null, null, "range", null, "xVal");
		noteXval.cols = 10;
		noteXval.min = 0;
		noteXval.max = 420;
		
		var noteYval = createFormElement("input", null, null, "range", null, "yVal");
		noteYval.cols = 10;
		noteYval.min = 60;
		noteYval.max = 420;
		
        var s = document.createElement("input");
        s.setAttribute("type", "submit");
        s.setAttribute("value", "Pinner");
        s.id = "submitNote";
        s.addEventListener('click', pinNote)
        
		noteSubject.appendChild(noteSub);
		noteContent.appendChild(noteCont);
		noteX.appendChild(noteXval);
		noteY.appendChild(noteYval);
		submitButton.appendChild(s);
		
		row.appendChild(noteSubject);
		row.appendChild(noteContent);
		row.appendChild(noteXval);
		row.appendChild(noteYval);
		row.appendChild(submitButton);
		
		form.append(row);
		
		formDiv.appendChild(form)
		
		
		div.appendChild(xdiv);
		divBuffer.appendChild(formDiv);
		divBuffer.appendChild(div);
		//;
		
		document.getElementsByTagName('body')[0].appendChild(divBuffer); 
		*/
		
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
			var idNode = postIts[i].lastElementChild.previousElementSibling
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
			console.log(itis);
		});
	}
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
	intId = parseInt(id)
	var postie = postIts[intId]
	//var bod =  postIts[id].items(1).innerHTML
	//console.log(subj);
	console.log(intId);
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

function createFormElement(returnType, className, id, type, placeHolder, name) {
	elem = document.createElement(returnType + '');
	elem.className = '' + className;
	elem.id = '' + id;
	elem.type = '' + type;
	elem.placeholder = '' + placeHolder;
	elem.name = name;
	return elem;
}


