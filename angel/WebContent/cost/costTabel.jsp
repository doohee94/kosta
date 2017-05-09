<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript">
Highcharts.chart('container', {
    chart: {
        type: 'areaspline'
    },
    title: {
        text: '올해 지출량'
    },
    legend: {
        layout: 'vertical',
        align: 'left',
        verticalAlign: 'top',
        x: 150,
        y: 100,
        floating: true,
        borderWidth: 1,
        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
    },
    xAxis: {
        categories: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    },
    yAxis: {
        title: {
            text: '지출금액 (만원) '
        }
    },
    tooltip: {
        shared: true,
        valueSuffix: ' units'
    },
    credits: {
        enabled: false
    },
    plotOptions: {
        areaspline: {
            fillOpacity: 0.5
        }
    },
    series: [{
        name: '식비',
        data: [10,20,10,11,20,33, 12, 18, 10, 20, 22, 10]
    }, {
        name: '유흥비',
        data: [1, 3, 4, 3, 3, 5, 4]
    }, {
    name:'기타' ,
    data: [20, 10, 40, 20, 50, 10, 20, 30, 20 , 50, 40, 10]
    }]
});
</script>
<title></title>
</head>
<body>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</body>
</html>