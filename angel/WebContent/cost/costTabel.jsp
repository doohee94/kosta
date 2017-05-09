<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<script type="text/javascript">
Highcharts.chart('container', {
    title: {
        text: '년간 소비 내역'
    },
    xAxis: {
        categories: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    },
    labels: {
        items: [{
            html: '년간 소비 분포',
            style: {
                left: '50px',
                top: '18px',
                color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
            }
        }]
    },
    series: [{
        type: 'column',
        name: '식비',
        data: [30, 25, 21, 32, 38, 29, 31, 28, 40, 19, 22, 25]
    }, {
        type: 'column',
        name: '유흥',
        data: [2, 3, 5, 7, 6, 10, 8, 4, 20, 16, 20, 8]
    }, {
        type: 'column',
        name: '기타',
        data: [5, 3, 3, 9, 0, 9, 0, 2, 4, 20, 10, 2]
    }, {
        type: 'spline',
        name: '평균',
        data: [12.3 , 10.3 , 14.2 , 15.2, 10.2, 10.3, 9.3, 10,5 , 22.1, 20, 10.3],
        marker: {
            lineWidth: 2,
            lineColor: Highcharts.getOptions().colors[3],
            fillColor: 'white'
        }
    }, {
        type: 'pie',
        name: 'Total consumption',
        data: [{
            name: '식비',
            y: 13,
            color: Highcharts.getOptions().colors[0] // Jane's color
        }, {
            name: '유흥',
            y: 23,
            color: Highcharts.getOptions().colors[1] // John's color
        }, {
            name: '기타',
            y: 19,
            color: Highcharts.getOptions().colors[2] // Joe's color
        }],
        center: [100, 80],
        size: 100,
        showInLegend: false,
        dataLabels: {
            enabled: false
        }
    }]
});
</script>
<title></title>
</head>
<body>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</body>
</html>