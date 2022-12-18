
	var ctx = document.getElementById("myChart");
	console.log(ctx);
	var data = [];
	var labels = [];
	  var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: labels,
	      datasets: [
			{
	        data:data,
	        lineTension: 0,
	        backgroundColor: 'transparent',
	        borderColor: '#9fc5f8',
	        borderWidth: 4,
	        pointBackgroundColor: '#9fc5f8'
	      	},
	      	{
			data: [],
	    	borderColor: '#FF9900',
	        borderWidth: 4,
	        pointBackgroundColor: '#FF9900'
			}
	      	
	      ]
	    },
	    options: {
	      scales: {
	        yAxes: [{
	          ticks: {
	            beginAtZero: false
	          }
	        }]
	      },
	      legend: {
	        display: false,
	      }
	    }
	  });
	




window.onload = function () {
	
	function addGraphValues (xVal, yVal) {
	labels.push(xVal);
	data.push(yVal);
	
	}
}




 
 
 