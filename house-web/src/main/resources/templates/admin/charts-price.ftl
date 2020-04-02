
<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-blog-detail" id="page-top">
<!-- Wrapper -->
<div class="wrapper">
    <!-- Navigation -->
    <@common.nav/>
    <div id="container" style="min-width:900px;height:700px"></div>
    <div id="sliders">
        <table>
            <tr><td>Alpha Angle</td><td><input id="R0" type="range" min="0" max="45" value="15"/> <span id="R0-value" class="value"></span></td></tr>
            <tr><td>Beta Angle</td><td><input id="R1" type="range" min="0" max="45" value="15"/> <span id="R1-value" class="value"></span></td></tr>
        </table>
    </div>
      <@common.footer/>
    <!-- end Page Footer -->
</div>
    <script type="text/javascript" src="/static/assets/js/jquery-2.1.0.min.js"></script>

    <script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
    <script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/highcharts-3d.js"></script>


<script language="JavaScript">
    $(document).ready(function() {
        var chart = {
            renderTo: 'container',
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                depth: 50,
                viewDistance: 25
            }
        };
        var title = {
            text: '房价3D柱状图'
        };
        var subtitle = {
            text: '信息来自本网站房源信息库'
        };

        var plotOptions = {
            column: {
                depth: 25
            }
        };
        var series= [{
            data: [
            <#list house as hs>
                ${hs.price},
            </#list>
            ]
        }];

        var json = {};
        json.chart = chart;
        json.title = title;
        json.subtitle = subtitle;
        json.series = series;
        json.plotOptions = plotOptions;
        var highchart = new Highcharts.Chart(json);

        function showValues() {
            $('#R0-value').html(highchart.options.chart.options3d.alpha);
            $('#R1-value').html(highchart.options.chart.options3d.beta);
        }

        // Activate the sliders
        $('#R0').on('change', function () {
            highchart.options.chart.options3d.alpha = this.value;
            showValues();
            highchart.redraw(false);
        });
        $('#R1').on('change', function () {
            highchart.options.chart.options3d.beta = this.value;
            showValues();
            highchart.redraw(false);
        });

        showValues();
    });
</script>
</body>
</html>