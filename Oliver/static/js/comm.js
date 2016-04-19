//点击主机删除按扭时在模态框中显示要删除项主机名
function delbutton(){
	var ser_name_list = "";
	$("input[name='sercheckbox']:checked").each(function(){
		var n = $(this).attr("id");
		var s = $(this).attr("value");
		ser_name_list += n + ", "
	});
	$("#hostModal").find(".modal-body").text(ser_name_list);
};
//点击模态框中的确认按钮时将被选中的主机id值传到后端，做删除处理
function ackdelbtn(){
	var ser_pk_list = "";
	$("input[name='sercheckbox']:checked").each(function(){
		var s = $(this).attr("value");
		ser_pk_list += s + ","
	});	
	$.ajax({
		type: "GET",
		url: "/delete/host/",
		data: {'pk': ser_pk_list},
		success: function(msg){
			if(msg == "ok"){
				$("input[name='sercheckbox']:checked").each(function(){
					$(this).parent().parent().remove();
				});
			}else{
				alert(msg);
			}
		}
	});
};
//主机列表实现全选或取消
$(function(){
	$("input[name='allsercheck']").click(function(){
		if($(this).is(":checked")){
			$("input[name='sercheckbox']").prop("checked",true);
			}else{
			$("input[name='sercheckbox']").prop("checked",false);	
		}
	});
});

//点击web监控项删除按钮时在模态框中显示删除项名
function delwebbutton(){
	var web_name_list = "";
	$("input[name='webcheckbox']:checked").each(function(){
		var n = $(this).attr("id");
		var s = $(this).attr("value");
		web_name_list += n + ", "
	});
	$("#webModal").find(".modal-body").text(web_name_list);
};

//点击模态框中的确认按钮时将被选中的web id值传到后端，做删除处理
function ackwebbtn(){
	var web_pk_list = "";
	$("input[name='webcheckbox']:checked").each(function(){
		var s = $(this).attr("value");
		web_pk_list += s + ","
	});	
	$.ajax({
		type: "GET",
		url: "/delete/web/",
		data: {'pk': web_pk_list},
		success: function(msg){
			if(msg == "ok"){
				$("input[name='webcheckbox']:checked").each(function(){
					$(this).parent().parent().remove();
				});
			}else{
				alert(msg);
			}
		}
	});
};

//监控站点全选或取消
$(function(){
	$("input[name='allwebcheck']").click(function(){
		if($(this).is(":checked")){
			$("input[name='webcheckbox']").prop("checked",true);
			}else{
			$("input[name='webcheckbox']").prop("checked",false);
		}
	});
});

function webcancel(){
	$("#addweb").attr("method", "GET");
	$("#site_name").removeAttr("required");
	$("#weburl").removeAttr("required");
	$("#addweb").submit();
};

function websave(){
	$("#addweb").attr("method", "POST");
};

function sercancel(){
	$("#addserver").attr("method", "GET");
	$("#mangip").removeAttr("required");
	$("#hostname").removeAttr("required");
//	$("#sn").removeAttr("required");
	$("#addserver").submit();
};

function sersave(){
	$("#addserver").attr("method", "POST");
};

function groupcancel(){
	$("#addhostgroup").attr("method", "GET");
	$("#groupname").removeAttr("required");
	$("#addhostgroup").submit();
};

function groupsave(){
	$("#addhostgroup").attr("method", "POST");
	$("#groupmember_2 option").attr("selected", true);
}

//选中的主机条目右移
function rightmove(){
	$("select[name='groupmember_1'] option:selected").each(function(){
		$(this).remove();
		$("select[name='groupmember_2']").append(this);
	});	
};

//选中的主机条目左移
function leftmove(){
	$("select[name='groupmember_2'] option:selected").each(function(){
		$(this).remove();
		$("select[name='groupmember_1']").append(this);
	});	
};

//集中运维管理实现当选择任一主机组时,在右边显示其对应的主机列表
function changeGroup(){
	var gpstr = "";
	$("select[name='hostgrouplist'] option:selected").each(function(){
		var v = $(this).val();
		gpstr += v + "@@";
	});
	$.ajax({
		type: "GET",
		url: "/ywgl/displaymem/",
		data: {'gpstr': gpstr},
		success: function(result){
			$("select[name='memberlist']").html(result);
		}
	});
};

//集中运维管理选择任一功能模块，在右边显示其对应的扩展项，在下面显示其功能说明
function changeModule(){
	var v = $("select[name='modulelist'] option:selected").val();
	$.ajax({
		type:"GET",
		url:"/ywgl/displayfunc/",
		async:true,
		data:{'func': v},
		success:function(msg){
			var m = eval("(" + msg + ")");
			$("#mod_desc").html(m.desc);
			$("#mod_extend").html(m.extend);
		}
	});
};

//集中运维管理实现刷新功能
function PageRefresh(){
	$("#opsmange").attr("method", "GET");
	$("#opsmange").submit();
}

//添加模块点击确定时将表单的提交方式修改为POST
function modsubbt(){
	$("#addmodule").attr("method", "POST");
};

//添加模块点击取消时将表单的提交方式修改为GET
function modcancle(){
	$("#addmodule").attr("method", "GET");
	$("#mod_name").removeAttr("required");
	$("#mod_desc").removeAttr("required");
	$("#addmodule").submit();
}

//安全审核页面实现点左边任一主机组名，在右边显示其对应的IP列表
function changejsgroup(){
	var gpnames = "";
	$("select[name='sjgroup'] option:selected").each(function(){
		var v = $(this).val();
		gpnames += v + "@@"
	});
    $.ajax({
    	type:"GET",
    	url:"/audit/audit_host/",
    	async:true,
    	data:{'gpnames': gpnames},
    	success:function(result){
    		$("select[name='sjmember']").html(result);
    	}
    });
};

//安全审计页面实现点开始监控实现采集数据库中的数据并显示
function get_hist(){
	var n = $("#jsmoniter").text();
	if(n=="开始监控"){
		$("#jsmoniter").text("停止监控");
		time = setInterval("get_last_info()", 2000);	
	}else{
		$("#jsmoniter").text("开始监控");
		clearInterval(time);
	}
};
var LastID = "0";
//setInterval需要循环调用函数
function get_last_info(){
	var Hosts = "";	

	$("select[name='sjmember'] option:selected").each(function(){
		var ip = $(this).val();
		Hosts += ip + "@@";
	});
//	alert(LastID)
    $.ajax({
    	type:"GET",
    	url:"/audit/audit_run/",
    	async:true,
    	data:{'Hosts': Hosts, 'LastID': LastID},
    	success:function(result){
    		var result_arry = result.split("@@");
    		LastID = result_arry[1];
    		$("#sjoutput").prepend(result_arry[0]);
    		var num = $("#sjoutput").children("font").length;
    		if(num>100){
    			$("#sjoutput").children("font:gt(99)").remove();
    		}
    	}
    });
};	
//安全审计查询指定时间之后的日志信息
function sjquery(){
	var sjdate = $("#sjdate").val();
	$.ajax({
		type:"get",
		url:"/audit/audit_sjquery/",
		async:true,
		data:{'sjdate': sjdate},
		success:function(result){
			$("#sjoutput").html(result);
		}
	});
}

//查询统计点查询按钮时控制仅允许一个查询条件
function query(){
	var b = $("select[name='pingtai'] option:selected").val();
	var p = $("#ywip").val();
	var n = $("#biaoji").val();
	var m = $("select[name='linestat'] option:selected").val();
	var o = $("select[name='weibao'] option:selected").val();
	var count = 0
	var arrList = new Array();
	arrList.push(b);
	arrList.push(p);
	arrList.push(n);
	arrList.push(m);
	arrList.push(o);
	for(var i=0;i<arrList.length;i++){
		if(arrList[i]==""){count += 1}
	};
	if(count!=4){
		alert("请选择或输入检索条件, 同时只能选择或输入1个查询条件")
		$("#statquery").attr("method", "GET");
		$("#statquery").submit();		
	};
};

//查询统计点查询时要求业务平台和设备类型2个条件同时满足
function query2(){
	var m = $("select[name='pingtai2'] option:selected").val();
	var n = $("select[name='devtype'] option:selected").val();
	var count = 0
	var arrList = new Array();
	arrList.push(m);
	arrList.push(n);
	for(var i=0;i<arrList.length;i++){
		if(arrList[i]==""){count += 1}
	};
	if(count!=0){
		alert("请选择检索条件, 必须同时选择2个查询条件")
		$("#statquery2").attr("method", "GET");
		$("#statquery2").submit();		
	};	
};

//顶部图标添加鼠标悬停事件
$(function(){
	$("a[style='padding-right: 30px;']").hover(
		function(){
			$(this).children().stop().animate({'width': '72px'}, 'fast');
		},
		function(){
			$(this).children().stop().animate({'width': '64px'}, 'fast');
		}
	);
});

