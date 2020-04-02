<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=UyuVONEtIuG8g0RiR47I8e0alOjGG4cv"></script>
    <script type="text/javascript" src="//api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
    <script type="text/javascript" src="//api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
    <script type="text/javascript" src="/static/assets/js/jquery-2.1.0.min.js"></script>
    <title>地图展示</title>
</head>
<@common.header/>

<body class="page-sub-page page-property-detail" id="page-top">
<!-- Wrapper -->
<div class="wrapper">
    <!-- Navigation -->
    <@common.nav/>
<div id="allmap" style="width: 100% ;height: 500px"></div>
  <@common.footer/>
</div>
</body>
</html>

<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(108.95346,34.265725), 12);  // 初始化地图,设置中心点坐标和地图级别
    map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    map.addControl(new BMap.NavigationControl({enableGeolocation:true}));
    map.addControl(new BMap.OverviewMapControl());
    map.setCurrentCity("南京");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

    //===================
    // var xy = [
    //     {'x':118.777882,'y':32.059839},
    //     {'x':118.457882,'y':32.049839},
    //     {'x':118.62882,'y':32.039839},
    //     {'x':118.3882,'y':32.029839},
    //     {'x':118.6666,'y':32.019839},
    //     {'x':118.577882,'y':32.051839},
    //     {'x':118.377882,'y':32.052839},
    //     {'x':118.277882,'y':32.053839},
    //     {'x':118.177882,'y':32.054839},
    //     {'x':118.077882,'y':31.055839},
    //     {'x':118.795394,'y':32.027002}
    // ];
    //
    // var data_info = [[118.777882,32.059839,"<button id='btn' type='button'>fds</button>"],
    //     [118.457882,32.049839,"<button id='btn' type='button'>fds</button>"],
    //     [118.62882,32.039839,"<button id='btn' type='button'>fds</button>"],
    //     [118.3882,32.059839,"<button id='btn' type='button'>fds</button>"],
    //     [118.6666,32.019839,"<button id='btn' type='button'>fds</button>"],
    //     [118.577882,32.051839,"<button id='btn' type='button'>fds</button>"],
    //     [118.377882,32.052839,"<button id='btn' type='button'>fds</button>"],
    //     [118.277882,32.053839,"<button id='btn' type='button'>fds</button>"],
    //     [118.177882,32.054839,"<button id='btn' type='button'>fds</button>"],
    //     [118.077882,31.055839,"<button id='btn' type='button'>fds</button>"],
    //     [118.795394,32.027002,"<button id='btn' type='button'>fds</button>"]
    // ];

    //freemarker在js中的应用：
    var data = [];
    var checkedArray =[];
    //初始化将测试集包含的用例存在数组里面
       <#if mapList??>
           <#list mapList as item>
               <#if item.x??>
                 data.push({
                     x:"${item.x!""}",
                     y:"${item.y!""}",
                     content:"${item.content!""}",
                     id:"${item.id!""}"
                 });
               </#if>
           </#list>
       </#if>

    var markers = [];
    var pt = null;

    for (var i in data) {
        console.log(data[i].x*1);
        pt = new BMap.Point(data[i].x*1, data[i].y*1);
        var ma=new BMap.Marker(pt);
        addClickHandler(data[i].content,ma,data[i].id);
        markers.push(ma);

    }

    // pt = new BMap.Point(108.992425, 34.38577);
    // var ma=new BMap.Marker(pt);
    // addClickHandler("你好",ma);
    // markers.push(ma);
    //最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
    var markerClusterer = new BMapLib.MarkerClusterer(map,
            {
                markers:markers,
                girdSize : 100,
                styles : [{
                    url:'/static/assets/img/red.png',
                    size: new BMap.Size(92, 92),
                    backgroundColor : '#E64B4E'
                }]

            });
    markerClusterer.setMaxZoom(13);
    markerClusterer.setGridSize(100);

    var opts = {
        width : 250,     // 信息窗口宽度
        height: 150,     // 信息窗口高度
        title : "信息窗口" , // 信息窗口标题
        enableMessage:true//设置允许信息窗发送短息
    };
    //	for(var i=0;i<data_info.length;i++){
    //		var marker = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
    //		markers.push(marker);
    //		var content = data_info[i][2];
    //		map.addOverlay(marker);               // 将标注添加到地图中
    //		addClickHandler(content,marker);
    //	}
    function addClickHandler(content,marker,id){
        marker.addEventListener("click",function(e){
            openInfo(content,e,id)}
        );
    }
    function openInfo(content,e,id){
        var p = e.target;
        var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
        var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
        map.openInfoWindow(infoWindow,point); //开启信息窗口
        if (!infoWindow.isOpen()){
            infoWindow.addEventListener("open",function (e) {
                document.getElementById('btn').onclick=function () {
                    window.location.href="detail?id="+id;

                }
            })
        }else{
            var btn=document.getElementById('btn');
            btn.onclick=function () {
                window.location.href="detail?id="+id;
            }
        }
    }

    //
    //



    //================================================
    //	var xy1 = [	{'x':118.85952,'y':32.0711},
    //		{'x':118.651976,'y':32.047353},
    //		{'x':118.735051,'y':32.059839},
    //		{'x':118.777882,'y':32.054019},
    //		{'x':118.677882,'y':32.059839},
    //		{'x':118.787882,'y':32.079839},
    //		{'x':118.777982,'y':32.069839}];
    //	var markers1 = [];
    //	var pt = null;
    //	for (var i in xy1) {
    //	   pt = new BMap.Point(xy1[i].x , xy1[i].y);
    //	   markers1.push(new BMap.Marker(pt));
    //	}
    //
    //
    //	//最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
    //	var markerClusterer1 = new BMapLib.MarkerClusterer(map,
    //		{
    //			markers:markers1,
    //			girdSize : 100,
    //			styles : [{
    //	            url:'./img/blue.png',
    //	            size: new BMap.Size(92, 92),
    //				backgroundColor : '#4783E7'
    //			}],
    //		});
    //		markers1.forEach( function(item){
    //
    //          var label = new BMap.Label("我是文字标注哦",{offset:new BMap.Size(20,-10)});
    //			item.setLabel(label);
    //			console.log(item);
    //      })
    //	console.log(markers1);
    //	markerClusterer1.setMaxZoom(13);
    //	markerClusterer1.setGridSize(100);
    //	console.log(markerClusterer1);
    //	console.log(markerClusterer);

    //	Cluster.prototype.addLabel = function (marker) {
    //      //获取marker的坐标
    //      var position = marker.getPosition();
    //      //创建label
    //      var label = new BMap.Label({position : position});
    //      label.setStyle({
    //          height : '25px',
    //          color : "#fff",
    //          backgroundColor : this._styles[0].backgroundColor,
    //          border : 'none',
    //          borderRadius : "25px",
    //          fontWeight : 'bold',
    //      });
    //      var content = '<span style="color:'+this._styles[0].backgroundColor+'"><i class="fa fa-map-marker"></i></span>'+'<p style="padding:0px 13px;text-align:center;margin-top:5px;">哈哈这是一sssssssssssssss个点</p>';
    //      label.setContent(content)
    //      label.setPosition(position);
    //      this._labels.push(label);
    //      this._map.addOverlay(label);
    //  }

</script>
