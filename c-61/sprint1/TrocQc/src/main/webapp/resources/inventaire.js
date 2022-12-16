/**
 * 
 */
 
 var img;
 var xdiv;
 var selectedRowValues;
 var uomDict = {
	"Unité": 4,
	"Metre": 5,
	"Centimetre": 6,
	"Kilogramme": 7,
	"gramme": 8,
	"pouce": 9,
	"pied": 10,
	"litre": 11,
	"millilitre": 12,
	"decalitre": 13,
	"gallon Américain": 14,
	"pinte Américain": 15,
	"tasse Américaine": 16,
	"once liquide Américaine": 17,
	"cuillière à soupe Américaine": 18,
	"cuillère à thé Américaine": 19,
	"livre": 20,
	"once solide": 21,
	"centilitre": 22,
	"millimetre": 23
}
 

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

function tableContent(table, tableRow){
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
 	modUnit.value = uomDict[unit];
 	

 	

 	

 	
 	console.log(tableRow);
 	console.log(id, name, cost, quantity, unit, date, customCol1 );
 	
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
	      tableContent(table, this);
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
	
	
	
	function createAddProductForm() {
		var div = document.createElement('div');
		div.className = 'productForm';
		div.id = 'mainContain';
		
		var xdiv = generateXBtn();
		
		form = document.createElement('form');
		formDiv = document.createElement('div');
		row = document.createElement('div');
		submitButton = document.createElement('div');
		
		form.setAttribute("method", "post");
        form.setAttribute("action", "/helloServlet");
        
        formDiv.className = "container mt-auto align-middle";
		row.className = "row mt-auto align-bottom justify-content-center d-flex align-items-center border";
		
		h1 = document.createElement('h1');
		h1.innerHTML = "AJOUTER UN PRODUIT";
		h1.className = "text-center";
		
		// Product Name
		rowName = document.createElement('div');
		rowName.className = "row m-1";
		pName = createFormElement('input', null, null, "text", "Entrer le nom du produit...", "productName");
		
		
		// Description
		rowDesc = document.createElement('div');
		rowDesc.className = "row m-1";
		pDesc = createFormElement('input', null, null, "text", "Entrer la description du produit...", "productDescription");
		
		// SKU
		rowSKU = document.createElement('div');
		rowSKU.className = "row m-1";
		pSKU = createFormElement('input', 'w-100', null, "text", "Entrer le SKU du produit...", "productSKU");
		
		// 3 COLS: QUANTITY, UNIT, LOW QUANTITY NUMBER 
		rowQTUnitLQN = document.createElement('div');
		rowQTUnitLQN.className = "row m-1";
		
		
		colQT = document.createElement('div');
		colQT.className = "col m-1";
		pQT = createFormElement('input', 'w-100', null, "number", "Entrer la quantité", "productQuantity");
		colQT.appendChild(pQT);
		
		
		colUnit = document.createElement('div');
		colUnit.className = "col m-1";
		colUnitRow = document.createElement('div');
		colUnitRow.className = "row ";
		selectUnit = document.createElement('select');
		selectUnit.className = "text-align";
		
		option0 = document.createElement('option');
		option0.innerHTML = " - Choisir l'unité... - ";
		option1 = document.createElement('option');
		option1.innerHTML = "Milli-litres";
		option2 = document.createElement('option');
		option2.innerHTML = "Milli-Mètres";
		option3 = document.createElement('option');
		option3.innerHTML = "Units";
		
		option0.value = "0";
		option1.value = "1";
		option2.value = "2";
		option3.value = "3";
		
		selectUnit.appendChild(option0);
		selectUnit.appendChild(option1);
		selectUnit.appendChild(option2);
		selectUnit.appendChild(option3);
		
		selectDiv = document.createElement('div');
		selectDiv.className = "selector";
		selectDiv.appendChild(selectUnit)
		
		//colUnitRow.appendChild(selectUnit);
		colUnit.appendChild(selectDiv);
		
		colLQN = document.createElement('div');
		colLQN.className = "col m-1";
		pLQN = createFormElement('input', 'w-100', null, "number", "Entrer le NBQ", "productLQN");
		colLQN.appendChild(pLQN);
		
		
		//COST AND MSRP
		rowCostPriceMSRP= document.createElement('div');
		rowCostPriceMSRP.className = "row m-1";
		
		colCost = document.createElement('div');
		colCost.className = "col m-1";
		pCost = createFormElement('input', 'w-100', null, "number", "Entrer le coût...", "productCost");
		colCost.appendChild(pCost);
		
		colPrice = document.createElement('div');
		colPrice.className = "col m-1";
		pPrice = createFormElement('input', 'w-100', null, "number", "Entrer le prix...", "productPrice");
		colPrice.appendChild(pPrice);
		
		colMSRP = document.createElement('div');
		colMSRP.className = "col m-1";
		pMSRP = createFormElement('input', 'w-100', null, "number", "Entrer le MSRP...", "productMSRP");
		colMSRP.appendChild(pMSRP);
		
		//UPLOAD OR GENERATE BARCODE
		rowBarcodes= document.createElement('div');
		rowBarcodes.className = "row m-1 text-center";
		
		colUploadBC = document.createElement('div');
		colUploadBC.className = "col m-1";
		colText = document.createElement('a');
		colText.innerHTML = "Téléverser code barre";
		colUploadBC.appendChild(colText);
		
		colUCreateBC = document.createElement('div');
		colUCreateBC.className = "col m-1";
		colText2 = document.createElement('a');
		colText2.innerHTML = "Générer code barre";
		colUCreateBC.appendChild(colText2);
		
		//New columns table
		rowNewColumns= document.createElement('div');
		rowNewColumns.className = "row m-1 text-center";
		
		tableDiv = document.createElement('div');
		newColTable = document.createElement('table');
		newColTable.className = "table border";
		
		tRowHeaders = document.createElement('tr');
		tHeadField = document.createElement('th');
		tHeadValue = document.createElement('th');
		tHeadUnit = document.createElement('th');
		
		tHeadField.innerHTML = "Champ";
		tHeadValue.innerHTML = "Valeur";
		tHeadUnit.innerHTML = "Unite";
		
		tRowHeaders.appendChild(tHeadField);
		tRowHeaders.appendChild(tHeadValue);
		tRowHeaders.appendChild(tHeadUnit);
		newColTable.appendChild(tRowHeaders);

		
		// Values for table td
		testVals = document.createElement('tr');
		testVals2 = document.createElement('tr');
		field = document.createElement('td');
		val = document.createElement('td');
		unit = document.createElement('td');
		field2 = document.createElement('td');
		val2 = document.createElement('td');
		unit2 = document.createElement('td');
		
		field.innerHTML = "Couleur";
		val.innerHTML = "Bleu poudre";
		unit.innerHTML = "---";
		
		field2.innerHTML = "Taille";
		val2.innerHTML = "Petit";
		unit2.innerHTML = "---";
		
		testVals.appendChild(field);
		testVals.appendChild(val);
		testVals.appendChild(unit);
		testVals2.appendChild(field2);
		testVals2.appendChild(val2);
		testVals2.appendChild(unit2);
		
		newColTable.appendChild(testVals);
		newColTable.appendChild(testVals2);
		
		tableDiv.appendChild(newColTable);
		
		// New Material col & New Field col
		// Need to pass dictionary of all materials to list names
		rowNewMaterialNewField  = document.createElement('div');
		rowNewMaterialNewField.className = "row m-1 text-center";
		
		colNewMaterial = document.createElement('div');
		colNewMaterial.className = "col border";
		//colNewMaterial.innerHTML = "HELLOS";
		colNewMaterialRow1 = document.createElement('div');
		colNewMaterialRow2 = document.createElement('div');
		colNewMaterialRow3 = document.createElement('div');
		colNewMaterialRow4 = document.createElement('div');
		
		//Row1
		colNewMaterialRow1.className = "row m-1";
		selectMaterial = document.createElement('select');
		selectMaterial.className = "text-align";
		option0 = document.createElement('option');
		option0.innerHTML = " - Choisir du matériel - ";
	
		selectMaterial.appendChild(option0);
		selectMatDiv = document.createElement('div');
		selectMatDiv.className = "";
		selectMatDiv.appendChild(selectMaterial)

		colNewMaterialRow1.appendChild(selectMatDiv);
		
		//Row2
		colNewMaterialRow2.className = "row m-1";
		colNewMaterialRow2Col1 = document.createElement('div');
		colNewMaterialRow2Col1.className = "col";
		colNewMaterialRow2Col2 = document.createElement('div');
		colNewMaterialRow2Col2.className = "col";
		
		mQT = createFormElement('input', null, null, "number", "Quantité...", "materialQuantity");
		mQT.className = "smol";
		selectMaterialUnit = document.createElement('select');
		selectMaterialUnit.className = "text-align";
		option0 = document.createElement('option');
		option0.innerHTML = " - Choisir Unite - ";
	
		selectMaterialUnit.appendChild(option0);
		selectMatUnitDiv = document.createElement('div');
		selectMatUnitDiv.appendChild(selectMaterialUnit)

		colNewMaterialRow2Col1.appendChild(mQT);
		colNewMaterialRow2Col2.appendChild(selectMatUnitDiv);
		
		colNewMaterialRow2.appendChild(colNewMaterialRow2Col1);
		colNewMaterialRow2.appendChild(colNewMaterialRow2Col2);
		
		//Row3
		colNewMaterialRow3.className = "row m-1 text-center";
		materialTableDiv = document.createElement('div');
		materialTable = document.createElement('table');
		materialTable.className = "table border";
		tRowHeaders = document.createElement('tr');
		tHeadMaterial = document.createElement('th');
		tHeadQuantity = document.createElement('th');

		
		tHeadMaterial.innerHTML = "Materiaux";
		tHeadQuantity.innerHTML = "Quantite";

		
		tRowHeaders.appendChild(tHeadMaterial);
		tRowHeaders.appendChild(tHeadQuantity);

		materialTable.appendChild(tRowHeaders);
		
				// Values for table td
		testVals = document.createElement('tr');
		mat = document.createElement('td');
		qt = document.createElement('td');

		mat.innerHTML = "Huile de jojoba";
		qt.innerHTML = "100 ml";
		
		testVals.append(mat);
		testVals.append(qt);
		
		materialTable.appendChild(testVals);
		
		materialTableDiv.appendChild(materialTable);
		colNewMaterialRow3.appendChild(materialTableDiv);
		
		//ROW4
		row4Form = document.createElement('form');
		
		row4Form.setAttribute("method", "post");
        row4Form.setAttribute("action", "/helloServlet");
		
		colNewMaterialRow4.className = "row m-1 text-center";
		bufferDiv = document.createElement('div');
		
        addMaterialBtn = document.createElement("input");
        addMaterialBtn.setAttribute("type", "submit");
        addMaterialBtn.setAttribute("value", "AJOUTER");
		
		bufferDiv.appendChild(addMaterialBtn);
		colNewMaterialRow4.appendChild(addMaterialBtn);
		
		row4Form.appendChild(colNewMaterialRow1);
		row4Form.appendChild(colNewMaterialRow2);
		row4Form.appendChild(colNewMaterialRow3);
		row4Form.appendChild(colNewMaterialRow4);
		

		colNewMaterial.appendChild(row4Form);
	
		
		// New field col
		colNewField = document.createElement('div');
		colNewField.className = "col border";
		colNewFieldRow1 = document.createElement('div');
		colNewFieldRow2 = document.createElement('div');
		colNewFieldRow3 = document.createElement('div');
		
		//Row 1
		colNewFieldRow1.className = "row";
		cName = createFormElement('input', null, null, "text", "Entrer la colonne...", "columnName");
		
		colNewFieldRow1.appendChild(cName);
		
		//Row 2
		colNewFieldRow2.className = "row border";
		colNewFieldRow2Col1 = document.createElement('div');
		colNewField.colNewFieldRow2Col1 = "col ";
		colNewFieldRow2Col2 = document.createElement('div');
		colNewField.colNewFieldRow2Col2 = "col";
		
		cValue = createFormElement('input', null, null, "number", "Entrer la valeur...", "columnValue");	
				
		selectColUnit = document.createElement('select');
		selectColUnit.className = "text-align";
		option0 = document.createElement('option');
		option0.innerHTML = " - Choisir Unite - ";
	
		selectColUnit.appendChild(option0);
		selectColUnitDiv = document.createElement('div');
		selectColUnitDiv.appendChild(selectColUnit)
		
		colNewFieldRow2.appendChild(cValue);
		colNewFieldRow2.appendChild(selectColUnitDiv);
		
		//Row 3
		colNewFieldRow3.className = "row";
        addColBtn = document.createElement("input");
        addColBtn.setAttribute("type", "submit");
        addColBtn.setAttribute("value", "AJOUTER CHAMP");
        
        colNewFieldRow3.appendChild(addColBtn);
		
		colNewField.appendChild(colNewFieldRow1);
		colNewField.appendChild(colNewFieldRow2);
		colNewField.appendChild(colNewFieldRow3);
		
		rowNewMaterialNewField.appendChild(colNewMaterial);
		rowNewMaterialNewField.appendChild(colNewField);
		
		//Submit form
		rowSubmitBtn= document.createElement('div');
		rowSubmitBtn.className = "row";
        submitFormBtn = document.createElement("input");
        submitFormBtn.setAttribute("type", "submit");
        submitFormBtn.setAttribute("value", "AJOUTER PRODUIT");
        
        
		
	//returnType, className, id, type, placeHolder, name
		
	// Append all pieces of the form in their respective row
        row.appendChild(h1);
        rowName.appendChild(pName);
        rowDesc.appendChild(pDesc);
        rowSKU.appendChild(pSKU);
		rowQTUnitLQN.appendChild(colQT);
		rowQTUnitLQN.appendChild(colUnit);
		rowQTUnitLQN.appendChild(colLQN);
		rowCostPriceMSRP.appendChild(colCost);
		rowCostPriceMSRP.appendChild(colPrice);
		rowCostPriceMSRP.appendChild(colMSRP);
		rowBarcodes.appendChild(colUploadBC);
		rowBarcodes.appendChild(colUCreateBC);
		rowBarcodes.appendChild(colUCreateBC);
		rowNewColumns.appendChild(tableDiv);
		rowNewMaterialNewField.appendChild(colNewMaterial);
		rowNewMaterialNewField.appendChild(colNewField);
		rowSubmitBtn.appendChild(submitFormBtn);
       
        form.appendChild(row);
        form.appendChild(rowName);
        form.appendChild(rowDesc);
        form.appendChild(rowSKU);
        form.appendChild(rowQTUnitLQN);
        form.appendChild(rowCostPriceMSRP);
        form.appendChild(rowBarcodes);
        form.appendChild(rowNewColumns);
        form.appendChild(rowNewMaterialNewField);
        form.appendChild(rowSubmitBtn);
        formDiv.appendChild(form);
		
		div.appendChild(xdiv);
		div.appendChild(formDiv);
		
		document.getElementsByTagName('body')[0].appendChild(div); 
		

			
	}
	/*
	if(document.getElementById("addProductBtn")) {
		document.getElementById("addProductBtn").addEventListener('click', createAddProductForm);
	}	
	*/
}

//Export as CSV 
//https://blog.naingdroidapps.com/2019/07/export-csv-file-from-mysql-database-in-java-program.html

//Barcode generator / Maybe UPC
//https://www.baeldung.com/java-generating-barcodes-qr-codes