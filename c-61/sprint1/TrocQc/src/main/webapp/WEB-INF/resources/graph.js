/**
 * 
 */
 


var ctx = document.getElementById("myChart");
var data = [z];
var labels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: labels,
      datasets: [{
        data:data,
        lineTension: 0,
        backgroundColor: 'transparent',
        borderColor: '#9fc5f8',
        borderWidth: 4,
        pointBackgroundColor: '#9fc5f8'
      }]
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



 
 
 