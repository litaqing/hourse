<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-blog-detail" id="page-top">
<!-- Wrapper -->
<div class="wrapper">
    <!-- Navigation -->
    <@common.nav/>

    <div id="main" style="width: 100%;height:900px;"></div>
      <@common.footer/>
    <!-- end Page Footer -->
</div>

<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/highcharts-3d.js"></script>
<script type="text/javascript" src="/static/lib/echarts/3.4.0/echarts.js"></script>

<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));

    option = {
        title : {
            text: '房产热度',
            subtext: '3D南丁格尔玫瑰图',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            x : 'center',
            y : 'bottom',
            data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel']
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'房源热度',
                type:'pie',
                radius : [30, 110],
                center : ['30%', '50%'],
                roseType : 'radius',
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: true
                    }
                },
                lableLine: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: true
                    }
                },
                data:[
               <#list hotHouses as house>
                    {value:${house.hot},name: '${(house.name)!}'},
               </#list>
                ]
            },
            {
                name:'房源热度',
                type:'pie',
                radius : [30, 110],
                center : ['75%', '50%'],
                roseType : 'area',
                data:[
                     <#list hotHouses as house>
                    {value:${house.hot},name: '${(house.name)!}'},
                     </#list>
                ]
            }
        ]
    };

    myChart.setOption(option);
</script>
<@common.footer/>
</body>
</html>