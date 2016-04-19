//首页分类统计服务器
$(function () {
    $(document).ready(function () {
        //获取不同类型服务器数据
        $.ajax({
	  		type:"get",
	  		url:"/index/server_cata/",
	  		async:true,
	  		success:function(result){
	  			var serCataobj = jQuery.parseJSON(result);
		        $('#sercategory').highcharts({
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false
		            },
		            title: {
		                text: '服务器分类'
		            },
			        credits: { 
			            enabled: false
			        },
		            tooltip: {
		                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		            },
		            plotOptions: {
		                pie: {
		                    allowPointSelect: true,
		                    cursor: 'pointer',
				                dataLabels: {
				                    enabled: true,
				                    formatter: function() {
								            		return '<b>'+ this.point.name +'</b>: '+ Highcharts.numberFormat(this.percentage, 1) +'% ('+
								                         Highcharts.numberFormat(this.y, 0, ',') +' 台)';
								         		},
				                    style: {
				                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
				                    }
				                },
		                   showInLegend: true, 
		                },
		
		            },
		            series: [{
		                type: 'pie',
		                name: '占比',
		                data: [
		                    ['物理服务器',   serCataobj.physerver],
		                    ['虚拟服务器',   serCataobj.vmserver],
		                    ['ESXi服务器',  serCataobj.esxiserver],
				    ['网络设备', serCataobj.networkdevice],
		                ]
		            }]
		        });
	  		}
	  	});
    });
});

//首页统计业务平台服务器数量
$(function () {
	$.ajax({
		type:"get",
		url:"/index/platpt/",
		async:true,
		success:function(result){
			var platobj = jQuery.parseJSON(result);
		    $('#platpt').highcharts({
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: '业务平台服务器分布'
		        },
		        xAxis: {
		            categories: [
		                '医患药平台',
		                '药店人平台',
		                '西普平台',
		                'DR数据平台',
		                '管理平台',
		                '营销平台',
		                '其它',
		            ],
		            crosshair: true
		        },
		        credits: { 
		            enabled: false
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		                '<td style="padding:0"><b>{point.y}台</b></td></tr>',
		            footerFormat: '</table>',
		            shared: true,
		            useHTML: true
		        },
		        plotOptions: {
		            column: {
		               colorByPoint:true,
		            },
		        },
		        series: [{
		            name: '业务平台服务器分布',
		            //colorByPoint:true,  或者直接写在这里
		            data: [platobj.yhypt, platobj.ydrpt, platobj.xppt, platobj.drpt, platobj.glpt, platobj.yxpt, platobj.other]
		            //data: [3, 2, 1, 5, 10, 4, 2]	
		        }]
		    });
		}
	});
});

//首页使用状态统计
$(function () {
	$.ajax({
		type:"get",
		url:"/index/usestatus/",
		async:true,
		success:function(result){
			var useobj = jQuery.parseJSON(result);
		    $('#onlinestat').highcharts({
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: 0,
		            plotShadow: false
		        },
		        colors: ['#50B432', '#ED561B'],
		        title: {
		            text: '使用状态',
		            align: 'center',
		            verticalAlign: 'middle',
		            y: 50
		        },
		        credits: { 
		            enabled: false
		        },
		        tooltip: {
		            formatter: function() {
		            		return '<b>'+ this.point.name +'</b>: '+ Highcharts.numberFormat(this.percentage, 1) +'% ('+
		                         Highcharts.numberFormat(this.y, 0, ',') +' 台)';
		         		},
		        },
		        plotOptions: {
		            pie: {
		                dataLabels: {
		                    enabled: true,
		                    distance: -50,
		                    style: {
		                        fontWeight: 'bold',
		                        color: 'white',
		                        textShadow: '0px 1px 2px black'
		                    }
		                },
		                startAngle: -90,
		                endAngle: 90,
		                center: ['50%', '75%']
		            }
		        },
		        series: [{
		            type: 'pie',
		            name: '占比',
		            innerSize: '50%',
		            data: [
		                ['正在使用',   useobj.online],
		                ['正在闲置',   useobj.offline],
		            ]
		        }]
		    });			
		}
	});
});

//首页维保状态统计
$(function () {
	$.ajax({
		type:"get",
		url:"/index/maintenance/",
		async:true,
		success:function(result){
			var maintobj = jQuery.parseJSON(result);
		    $('#maintain').highcharts({
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: 0,
		            plotShadow: false
		        },
		        colors: ['#50B432', '#ED561B'],
		        title: {
		            text: '维保状态(物理,ESXi)',
		            align: 'center',
		            verticalAlign: 'middle',
		            y: 50
		        },
		        credits: { 
		            enabled: false
		        },
		        tooltip: {
		            //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		            formatter: function() {
		            		return '<b>'+ this.point.name +'</b>: '+ Highcharts.numberFormat(this.percentage, 1) +'% ('+
		                         Highcharts.numberFormat(this.y, 0, ',') +' 台)';
		         		},
		        },
		        plotOptions: {
		            pie: {
		                dataLabels: {
		                    enabled: true,
		                    distance: -50,
		                    style: {
		                        fontWeight: 'bold',
		                        color: 'white',
		                        textShadow: '0px 1px 2px black'
		                    }
		                },
		                startAngle: -90,
		                endAngle: 90,
		                center: ['50%', '75%']
		            }
		        },
		        series: [{
		            type: 'pie',
		            name: '维保状态',
		            innerSize: '50%',
		            data: [
		                ['维保期内',   maintobj.inner],
		                ['维保过期',   maintobj.outer],
		            ]
		        }]
		    });			
		}
	});
});

//判断用户是否登陆，没有登陆则导航栏只显示Login，登陆后隐藏Login，显示Logout
$(function(){	
	var user2 = $.trim($("#logout").children("a").text());
	if(user2=='AnonymousUser'){
		$("#logout").hide();
	}else{
		$("#login").hide();
	}
});

//左侧菜单栏目添加active样式,左侧菜单栏目点击时显示向右字体图标，同时隐藏其余栏目的向右字体图标, window.location当前页面url
$(function(){
	$(".list-group-item").each(function(){
		$this = $(this);
		if($this[0].href==String(window.location)){
			$this.addClass("active");
			$this.children(".glyphicon-chevron-right").show();
		}
	})
});
