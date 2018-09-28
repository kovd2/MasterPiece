<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<%
	ArrayList<Integer> monthSales = (ArrayList<Integer>)request.getAttribute("monthSales");
	int count = (int)request.getAttribute("count");
	int a = 1;
	
	int cnt = 0;
	if(application.getAttribute("cntVisit") != null){
		cnt = (int)application.getAttribute("cntVisit");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#main>div{
	display: inline-block;
}

</style>
</head>
<body>
	<jsp:include page="../common/menu.jsp">
		<jsp:param name="name" value="5" />
	</jsp:include>
	<div id="main">
	<div>
	방문자 수 : <%=cnt%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	신규 가입자 : <%=count%>
	</div><br>
	<div>
	<canvas id="myChart" width="300" height="300"></canvas>
	</div>
	<div>
	<canvas id="myChart2" width="300" height="300"></canvas>
	</div><br>
	<div>
	<canvas id="myChart3" width="300" height="300"></canvas>
	</div>
	<div>
	<canvas id="myChart4" width="300" height="300"></canvas>
	</div>
	</div>
	<script>
var day = new Date();
var month = day.getMonth()+1;
if(month<7){
	var m = ["1월","2월","3월","4월","5월","6월"];
}else{
	var m = ["7월","8월","9월","10월","11월","12월"];
}





var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
	type: 'bar',
    data: {
    		labels: [m[0], m[1], m[2], m[3], m[4], m[5]],
        datasets: [{
            label: '월 매출 통계',
            data: [<%=monthSales.get(0)%>, <%=monthSales.get(1)%>, <%=monthSales.get(2)%>, <%=monthSales.get(3)%>, <%=monthSales.get(4)%>, <%=monthSales.get(5)%>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
var ctx2 = document.getElementById("myChart2");
var myChart = new Chart(ctx2, {
    type: 'pie',
    data: {
    	    datasets: [{
    	        data: [10, 20, 30,10, 20, 30,10, 20, 30],
    	    	backgroundColor: [
   	    	 'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)'
			]}],

    	    // These labels appear in the legend and in the tooltips when hovering different arcs
    	    labels: [
    	        'CPU',
    	        'MAINBOARD',
    	        'RAM',
    	        'GRAPHIC',
    	        'HDD/SSD',
    	        'ODD',
    	        'POWER',
    	        'COOLER',
    	        'CASE'
    	    ]
    	},
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
var ctx3 = document.getElementById("myChart3");
var myChart = new Chart(ctx3, {
    type: 'bar',
    data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
var ctx4 = document.getElementById("myChart4");
var myChart = new Chart(ctx4, {
    type: 'bar',
    data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
</body>
</html>