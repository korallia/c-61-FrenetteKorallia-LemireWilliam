/**
 * 
 */
 
 var img;
 var xdiv;
 
 //https://www.w3schools.com/howto/howto_js_tabs.asp
 function openTab(evt, tabName) {
  var i, tabcontent, tablinks;

  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}

function tableContent(tableRow){
	alert(tableRow);
}


window.onload = function(){
	
	if(!!document.getElementById("addProductBtn")) {
		document.getElementById("addProductBtn").addEventListener('click', openProductForm);
	}
	
	if(!!document.getElementById("addTemplateBtn")) {
		document.getElementById("addTemplateBtn").addEventListener('click', openTemplateForm);
	}
	if(!!document.getElementById("addMaterialBtn")) {
		document.getElementById("addMaterialBtn").addEventListener('click', openMaterialForm);
	}
	if(!!document.getElementById("modMaterialBtn")) {
		document.getElementById("modMaterialBtn").addEventListener('click', openModMaterialForm);
	}
	
	var table = document.getElementById("matTable");
	if (table) {
	  for (var i = 0; i < table.rows.length; i++) {
	    table.rows[i].onclick = function() {
	      tableContent(this);
	    };
	  }
	}
	
	function openProductForm(){
		var node = document.getElementById("productForm");
		node.style.display = "block";
	}
	
	function openMaterialForm(){
		var node = document.getElementById("materialForm");
		node.style.display = "block";
	}
	
	function openModMaterialForm(){
		var node = document.getElementById("modifyMaterialForm");
		node.style.display = "block";
	}	
	
	function openTemplateForm(){
		var node = document.getElementById("addTemplateForm");
		node.style.display = "block";
	}	
	
	
}

//Export as CSV 
//https://blog.naingdroidapps.com/2019/07/export-csv-file-from-mysql-database-in-java-program.html

//Barcode generator / Maybe UPC
//https://www.baeldung.com/java-generating-barcodes-qr-codes