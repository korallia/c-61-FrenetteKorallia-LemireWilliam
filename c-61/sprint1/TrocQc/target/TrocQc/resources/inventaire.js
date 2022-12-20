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

function getTemplateRow(table, tableRow){
	var i, rows;
	rows = document.getElementsByClassName("tempRow");
	for (i = 0; i < rows.length; i++) {
		rows[i].classList.remove("activeRow");
	}
	
	tableRow.className += " activeRow";
	
	
	var id = tableRow.childNodes[1].innerHTML.trim();
 	var name = tableRow.childNodes[3].innerHTML.trim();
 	var desc  = tableRow.childNodes[5].innerHTML.trim();
 	var sku = tableRow.childNodes[7].innerHTML.trim();
 	var cost = tableRow.childNodes[9].innerHTML.trim();
 	var price = tableRow.childNodes[11].innerHTML.trim();
 	var lql = tableRow.childNodes[13].innerHTML.trim();
 	var unit = tableRow.childNodes[15].innerHTML.trim();
 	
 	
 	console.log("MATERIALS");
 	var materials = tableRow.childNodes[19].childNodes[1].innerHTML;
 	console.log(materials);
 	materials = tableRow.childNodes[19].childNodes[0].innerHTML;
 	console.log(materials);
 	materials = tableRow.childNodes[19].innerHTML;
 	console.log(materials);
 	
 	//var custCol1 = tableRow.childNodes[21].innerHTML.trim();
 	//var custCol2 = tableRow.childNodes[23].innerHTML.trim();
 	//var custCol3 = tableRow.childNodes[25].innerHTML.trim();
	
 	var modId = document.getElementById("hiddenTemplateId"); //Hidden field
 	var modName = document.getElementById("modTemplateName");
 	var modDesc = document.getElementById("modTemplateDesc");
 	var modSKU = document.getElementById("modTemplateSKU");
 	var modCost = document.getElementById("modTemplateCost");
 	var modPrice = document.getElementById("modTemplatePrice");
 	var modLQL = document.getElementById("modTemplateLQL");
 	var modUnit = document.getElementById("modTemplateUOM");
 	//var modMaterials = document.getElementById("modTemplateUOM");

 	var modCustColName1 = document.getElementById("modNewFieldName1");
 	var modCustColValue1 = document.getElementById("modNewFieldValue1");
 	
 	var modCustColName2 = document.getElementById("modNewFieldName2");
 	var modCustColValue2 = document.getElementById("modNewFieldValue2");
 	
 	var modCustColName3 = document.getElementById("modNewFieldName3");
 	var modCustColValue3 = document.getElementById("modNewFieldValue3");

 	
 	modCustColName1.value = "";
	modCustColValue1.value = "";
	modCustColName2.value = "";
	modCustColValue2.value = "";
	modCustColName3.value = "";
	modCustColValue3.value = "";
 	
 	
 	try {
		var customCol1 = tableRow.childNodes[21].innerHTML.trim();
		var customColArray1 =  customCol1.split(":");
			if (modCustColName1 != "" || modCustColValue1 != ""){
				modCustColName1.value = customColArray1[0].trim();
		 		modCustColValue1.value = customColArray1[1].trim();
			}		
			
	} catch (error) {
  		console.error(error);
	}
	
 	try {
		
		if(tableRow.childNodes[23] != null){
			var customCol2 = tableRow.childNodes[23].innerHTML.trim();
			var customColArray2 =  customCol2.split(":");	
			
			if (modCustColName2 != "" || modCustColValue2 != ""){
				modCustColName2.value = customColArray2[0].trim();
		 		modCustColValue2.value = customColArray2[1].trim();
			}			
		}
	} catch (error) {
 		console.error(error);

	}
	
 	try {
		if (tableRow.childNodes[25] != null){
			var customCol3 = tableRow.childNodes[25].innerHTML.trim();
			var customColArray3 =  customCol3.split(":");
			if (modCustColName3 != "" || modCustColValue3 != ""){
				modCustColName3.value = customColArray3[0].trim();
	 			modCustColValue3.value = customColArray3[1].trim();
			}
		}
	} catch (error) {
  		console.error(error);

	} 	
	
	modId.value = id;
	modName.value = name;
	modDesc.value = desc;
	modSKU.value = sku;
	modCost.value = parseFloat(cost);
	modPrice.value = parseFloat(price);
	modLQL.value = parseInt(lql);
	modUnit.value = unit;
	
	
}

function getRawMaterialRow(table, tableRow){
	var i, rows;
	rows = document.getElementsByClassName("matRow");
	for (i = 0; i < rows.length; i++) {
		rows[i].classList.remove("activeRow");
	}
	
	tableRow.className += " activeRow"; 
	
	var id = tableRow.childNodes[1].innerHTML.trim();
 	var name = tableRow.childNodes[3].innerHTML.trim();
 	var cost  = tableRow.childNodes[5].innerHTML.trim();
 	var quantity = tableRow.childNodes[7].innerHTML.trim();
 	var unit = tableRow.childNodes[9].innerHTML.trim();
 	var date = tableRow.childNodes[11].innerHTML.trim();
 	
	
 	var modId = document.getElementById("hiddenProdId"); //Hidden field
 	var modName = document.getElementById("modMaterialName");
 	var modCost = document.getElementById("modMaterialCost");
 	var modQt = document.getElementById("modMaterialQuantity");
 	var modUnit = document.getElementById("modMaterialUOM");

 	var modCustColName1 = document.getElementById("modMaterialNewFieldName1");
 	var modCustColValue1 = document.getElementById("modMaterialNewFieldValue1");
 	
 	var modCustColName2 = document.getElementById("modMaterialNewFieldName2");
 	var modCustColValue2 = document.getElementById("modMaterialNewFieldValue2");
 	
 	var modCustColName3 = document.getElementById("modMaterialNewFieldName3");
 	var modCustColValue3 = document.getElementById("modMaterialNewFieldValue3");
 	
 	modCustColName1.innerHTML = "";
	modCustColValue1.innerHTML = "";
	modCustColName2.innerHTML = "";
	modCustColValue2.innerHTML = "";
	modCustColName3.innerHTML = "";
	modCustColValue3.innerHTML = "";
	
 	try {
		var customCol1 = tableRow.childNodes[13].innerHTML.trim();
		var customColArray1 =  customCol1.split(":");
			if (modCustColName1 != "" || modCustColValue1 != ""){
				modCustColName1.value = customColArray1[0].trim();
		 		modCustColValue1.value = customColArray1[1].trim();
			}		
			
	} catch (error) {
  		console.error(error);
	}
	
 	try {
		
		if(tableRow.childNodes[15] != null){
			var customCol2 = tableRow.childNodes[15].innerHTML.trim();
			var customColArray2 =  customCol2.split(":");	
			
			if (modCustColName2 != "" || modCustColValue2 != ""){
				modCustColName2.value = customColArray2[0].trim();
		 		modCustColValue2.value = customColArray2[1].trim();
			}			
		}
	} catch (error) {
 		console.error(error);

	}
	
 	try {
		if (tableRow.childNodes[17] != null){
			var customCol3 = tableRow.childNodes[17].innerHTML.trim();
			var customColArray3 =  customCol3.split(":");
			if (modCustColName3 != "" || modCustColValue3 != ""){
				modCustColName3.value = customColArray3[0].trim();
	 			modCustColValue3.value = customColArray3[1].trim();
			}
		}
	} catch (error) {
  		console.error(error);

	}
 	
 	modId.value = id;
 	modName.value = name;
 	modCost.value = parseFloat(cost);
 	modQt.value = parseFloat(quantity); 
 	modUnit.value = unit;

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
	
	if(!!document.getElementById("modTemplateBtn")) {
		document.getElementById("modTemplateBtn").addEventListener('click', openModTemplateForm);
	}
	
    tabcontent = document.getElementsByClassName("tabcontent");
    tabcontent[0].style.display = "block";
    
	tablinks = document.getElementsByClassName("tablinks");
	tablinks[0].className += " active";
	 

	
	var table = document.getElementById("matTable");
	if (table) {
	  for (var i = 0; i < table.rows.length; i++) {
	    table.rows[i].onclick = function() {
	      getRawMaterialRow(table, this);
	    };
	  }
	}
	
	
	var table = document.getElementById("tempTable");
	if (table) {
	  for (var i = 0; i < table.rows.length; i++) {
	    table.rows[i].onclick = function() {
	      getTemplateRow(table, this);
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
	

	function openModTemplateForm(){
		var node = document.getElementById("modifyTemplateForm");
		node.style.display = "block";
	}
	
	

}

//Export as CSV 
//https://blog.naingdroidapps.com/2019/07/export-csv-file-from-mysql-database-in-java-program.html

//Barcode generator / Maybe UPC
//https://www.baeldung.com/java-generating-barcodes-qr-codes