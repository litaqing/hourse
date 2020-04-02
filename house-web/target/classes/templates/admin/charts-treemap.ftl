<!DOCTYPE html>
<html lang="en-US">
<@common.header/>
<body class="page-sub-page page-blog-detail" id="page-top">
<!-- Wrapper -->
<div class="wrapper">
    <!-- Navigation -->
    <@common.nav/>

    <div id="main" style="width: 100%;height:800px;"></div>
      <@common.footer/>
    <!-- end Page Footer -->
</div>

<script type="text/javascript" src="/static/lib/echarts/3.4.0/echarts.js"></script>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));

    myChart.showLoading();
    myChart.hideLoading();

    myChart.setOption(option = {
        tooltip: {
            trigger: 'item',
            triggerOn: 'mousemove'
        },
        series: [
            {
                type: 'tree',
                data: [
                    {
                        name: "小区房产关系树图",
                        children: [{
                            name: "深圳市",
                            children: [
                                {
                                    name: "万柳书苑",
                                    children: [
                                        {
                                            name: "枫丹丽舍大三居",
                                            value: 300
                                        },
                                        {
                                            name: "橡树湾 全南向 南北通透",
                                            value: 500
                                        },
                                        {
                                            name: "枫丹丽舍大三居",
                                            value: 300
                                        },
                                        {
                                            name: "中央花园大三居",
                                            value: 300
                                        }
                                    ]
                                },
                                {
                                    name: "阳光丽景",
                                    children: [
                                        {
                                            name: "枫丹丽舍大三居",
                                            value: 300
                                        },
                                        {
                                            name: "中央花园大三居",
                                            value: 300
                                        },
                                        {
                                            name: "万柳书苑 180平 南北通透",
                                            value: 800
                                        },
                                        {
                                            name: "中央花园大三居",
                                            value: 300
                                        },
                                        {
                                            name: "橡树湾 全南向 南北通透",
                                            value: 500
                                        }
                                    ]
                                },
                                {
                                    name: "橡树湾",
                                    children: [
                                        {
                                            name: "西山华府 120平",
                                            value: 600
                                        }
                                    ]
                                }
                            ]
                        },]
                    }


                ],

                top: '15%',
                bottom: '14%',

                layout: 'radial',

                symbol: 'emptyCircle',

                symbolSize: 6,

                initialTreeDepth: 3,

                animationDurationUpdate: 750

            }
        ]
    });
</script>
<@common.footer/>
</body>
</html>