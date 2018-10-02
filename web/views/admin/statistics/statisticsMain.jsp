<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.admin.model.vo.*"%>
<!DOCTYPE html>
<%
	ArrayList<Integer> monthSales = (ArrayList<Integer>)request.getAttribute("monthSales");


	HashMap<String, Integer> descMap = (HashMap<String, Integer>)request.getAttribute("sel_desc");
	HashMap<String, Integer> ascMap = (HashMap<String, Integer>)request.getAttribute("sel_asc"); 
	HashMap<String, Integer> cnt = (HashMap<String, Integer>)request.getAttribute("cnt");
	ArrayList<Cnt> count = (ArrayList<Cnt>)request.getAttribute("count");
	Set<String> keySet = descMap.keySet();
	Iterator<String> iter = keySet.iterator();
	String descKey[] = new String[4];
	String ascKey[] = new String[4];
	String key[] = new String[cnt.size()];
	int i = 0;
	while(iter.hasNext()){
		descKey[i++] = iter.next();
	}
	i = 0;
	keySet = ascMap.keySet();
	iter = keySet.iterator();
	while(iter.hasNext()){
		ascKey[i++] = iter.next();
	} 
	
	i = 0;
	keySet = cnt.keySet();
	iter = keySet.iterator();
	while(iter.hasNext()){
		key[i++] = iter.next();
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
	margin: 20px
}

</style>
</head>
<body>
	<jsp:include page="../common/menu.jsp">
		<jsp:param name="name" value="5" />
	</jsp:include>
	<div id="main" style="margin-left: 50px;margin-top: 50px">
	<div>
	<div align="center">최저 판매 카테고리</div>
	<canvas id="myChart3" width="300" height="300"></canvas>
	</div>
	<div>
	<div align="center">최다 판매 카테고리</div>
	<canvas id="myChart2" width="300" height="300"></canvas>
	</div><br><br>
	<div>
	<canvas id="myChart" width="300" height="300"></canvas>
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
    	        data: [<%=descMap.get(descKey[0])%>, 
    	        	<%=descMap.get(descKey[1])%>, 
    	        	<%=descMap.get(descKey[2])%>, 
    	        	<%=descMap.get(descKey[3])%>],
    	    	backgroundColor: [
   	    	 	'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(255,99,132,1)',
			]}],

    	    // These labels appear in the legend and in the tooltips when hovering different arcs
    	    labels: [
    	    	'<%=descKey[0]%>',
    	    	'<%=descKey[1]%>',
    	    	'<%=descKey[2]%>',
    	    	'<%=descKey[3]%>'
    	    ]
    	}
});

var ctx3 = document.getElementById("myChart3");
var myChart = new Chart(ctx3, {
	 type: 'pie',
	    data: {
	    	    datasets: [{
	    	        data: [<%=ascMap.get(ascKey[0])%>, 
	    	        	<%=ascMap.get(ascKey[1])%>, 
	    	        	<%=ascMap.get(ascKey[2])%>, 
	    	        	<%=ascMap.get(ascKey[3])%>],
	    	    	backgroundColor: [
	   	    	 	'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(255,99,132,1)'
				]}],

	    	    // These labels appear in the legend and in the tooltips when hovering different arcs
	    	    labels: [
	    	    	'<%=ascKey[0]%>',
	    	    	'<%=ascKey[1]%>',
	    	    	'<%=ascKey[2]%>',
	    	    	'<%=ascKey[3]%>'
	    	    ]
	    	}
});









var ctx4 = document.getElementById("myChart4");
var myLineChart = new Chart(ctx4, {
    type: 'line',
    data:{
    	
    	datasets: [{
    		label:'일 별 방문자수',
	        data: [<%for(int j = 0; j < count.size(); j++){%><%=count.get(j).getCnt()%><%if(j<count.size()-1){%>,<%}%><%}%>],
	        	borderColor:['rgba(255,99,132,1)'],
	        	fill:[false],
	        	lineTension:0
    	}],
	    labels: [<%for(int j = 0; j < count.size(); j++){%>'<%=count.get(j).getD()%>'<%if(j<count.size()-1){%>,<%}%><%}%>]
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