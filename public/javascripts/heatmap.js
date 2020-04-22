
function displayHeatmap(size, maxScore, data) {

    var axis = Array.from(Array(size).keys());

    data = data.map(function (item) {
        return [item[0], item[1], item[2] || '-'];
    });

    option = {
        tooltip: {
            position: 'top',
            triggerOn: 'click'
        },
        animation: false,
        grid: {
            height: '50%',
            top: '20%',
            left: '20%'
        },
        xAxis: {
            type: 'value',
            interval: 1,
            position: 'top',
            data: axis,
            splitArea: {
                show: true
            }
        },
        yAxis: {
            type: 'value',
            interval: 1,
            position: 'left',
            inverse: true,
            data: axis,
            splitArea: {
                show: true
            }
        },
        visualMap: {
            min: 0,
            max: maxScore,
            calculable: true,
            orient: 'horizontal',
            left: 'center',
            bottom: '5%'
        },
        series: [{
            name: 'Area score',
            type: 'heatmap',
            data: data,
            label: {
                show: false
            },
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };

    var myChart = echarts.init(document.getElementById('heatmap'));
    myChart.setOption(option);
}
