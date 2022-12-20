
 /* Fichier javascript finance.js
 * Auteur:  William Lemire
 * Équipe: William et Korallia 
 * Ce fichier gère le style de couleur sur les champs de rapport de la page finance
 */
 
window.onload = function(){ 
	//document.getElementById('endDate').valueAsDate = new Date();
	
	var nodes = document.getElementsByClassName("totalExpense");
  	for (i = 0; i < nodes.length; i++) {
		var text = (nodes[i].innerHTML);
    	var value = parseFloat( text.substring(0, text.length -1));
    	if (value < 0.0) {
			nodes[i].style.color = "#de5353";
			nodes[i].addEventListener("hover", event => {
  				nodes[i].style.backgroundColor = "#de5353"; 
			});
		}
		else if(value > 0.0) {
			nodes[i].style.color = "#2fd10e";
		}	
    }

 }
 
 