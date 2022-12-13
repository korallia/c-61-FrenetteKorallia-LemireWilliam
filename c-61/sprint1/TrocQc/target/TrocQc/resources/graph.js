/**
 * 
 */
 

var ctx = document.getElementById("myChart");
var data = [15339, 21345, 18483, 24003];
var labels = ["Blip", "Bllop", "Wop", "GNIAH"];
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
		data: [16000, 17000, 18000, 19000],
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



 
 
 