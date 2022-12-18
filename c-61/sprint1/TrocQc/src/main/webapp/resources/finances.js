/**
 * 
 */
 
window.onload = function(){ 
	document.getElementById('endDate').valueAsDate = new Date();
	
	
	var nodes = document.getElementsByClassName("totalExpense");
  	for (i = 0; i < nodes.length; i++) {
		var text = (nodes[i].innerHTML);
    	var value = parseFloat( text.substring(0, text.length -1));
    	if (value < 0.0) {
			nodes[i].style.color = "#de5353";
			nodes[i].addEventListener("mouseenter", event => {
  				nodes[i].style.color = "#de5353"; //Hover is red
  				
			});
		}
		else if(value > 0.0) {
			nodes[i].style.color = "#2fd10e";
		}	
    	
    }
    
    
   	function closeChart() {
		var node = document.getElementById('chart');
		node.parentNode.removeChild(node);
		console.log("Look Ma', no hands.")
	}

	function openChart () {
		
		var div = document.createElement('div');
		div.className = 'graphWindow';
		div.id = 'chart';
		
		xdiv = document.createElement('div');
		img = document.createElement('img');
		img.className = 'xbtn';
		img.id = 'xbtn';
		img.src = 'images/xbtn.png';
		img.x = 0;
		img.y = 0;
		img.addEventListener('click', closeChart);
		
		xdiv.appendChild(img);
		div.appendChild(xdiv);
		
		document.getElementsByTagName('body')[0].appendChild(div); 
		}
		if(document.getElementById("openGraphBtn")) {
		document.getElementById("openGraphBtn").addEventListener('click', openChart);
		
		
		
	}	
 }
 
 