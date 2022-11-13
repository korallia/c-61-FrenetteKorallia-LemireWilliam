/**
 * 
 */
 var img;
 var xdiv;
 
window.onload = function(){
	
	function openNotePad () {
		
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
		
        var s = document.createElement("input");
        s.setAttribute("type", "submit");
        s.setAttribute("value", "Pinner");
        s.id = "submitNote";
        s.addEventListener('click', pinNote)
        
		noteSubject.appendChild(noteSub);
		noteContent.appendChild(noteCont);
		submitButton.appendChild(s);
		
		row.appendChild(noteSubject);
		row.appendChild(noteContent);
		row.appendChild(submitButton);
		
		form.append(row);
		
		formDiv.appendChild(form)
		
		
		div.appendChild(xdiv);
		divBuffer.appendChild(formDiv);
		divBuffer.appendChild(div);
		//;
		
		document.getElementsByTagName('body')[0].appendChild(divBuffer); 
		
	}
	
	if(document.getElementById("noteBtn")) {
		document.getElementById("noteBtn").addEventListener('click', openNotePad);
	}
	
	
}

function pinNote() {
	var colors = {
		1: "/resources/images/pinkpostit.png",
		2: "/resources/images/bluepinpostit.png"
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
	img.src = '/resources/images/xbtn.png';
	img.x = 0;
	img.y = 0;
	img.addEventListener('click', closeWindow)
	xdiv.appendChild(img);
	return xdiv;
}

function closeWindow () {	
	var node = document.getElementById('mainContain');
  	while (node.firstChild) {
    node.removeChild(node.lastChild);
  	}
  	node.parentNode.removeChild(node);	
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


