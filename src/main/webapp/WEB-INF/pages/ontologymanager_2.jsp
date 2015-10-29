<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
	<TITLE>知识库</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">

	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="../static/css/bootstrap.css">
	<link rel="stylesheet"  href="../static/css/bootstrap-theme.css">
	<link rel="stylesheet" href="../static/flatui/bootstrap.min.css">
	<link rel="stylesheet" href="../static/flatui/flat-ui.min.css">

	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->

	<style>
    .inputText{border-left:0px;border-top:0px;border-right:0px;border-bottom:1px}
    .form-control-free{height: 40px;}
    </style>


	<link rel="stylesheet" type="text/css" href="/SpringX/static/zTree/css/zTreeStyle/zTreeStyle.css">
	<script src="../static/js/jquery-1.11.3.js"></script>
	<script src="../static/js/jsrender.min.js"></script>
	<script src="../static/flatui/video.js"></script>
	<script src="../static/js/bootstrap.js"></script>
	<SCRIPT type="text/javascript">
		<!--
		var setting = {
			view: {
				showIcon:false,
				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom,
				selectedMulti: false
			},
			edit: {
				enable: true,
				editNameSelectAll: true,
				showRemoveBtn: showRemoveBtn,
				showRenameBtn: showRenameBtn
			},
			data: {
				simpleData: {
					enable: true,
					pIdKey: "pid"
				}
			},
			callback: {
				beforeDrag: beforeDrag,
				beforeEditName: beforeEditName,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onRemove: onRemove,
				onRename: onRename,
				onClick: zTreeOnClick
			}
		};
		var x;
		var y;

		var OntModel={
				znodes:[
					{ id:1, pid:0, name:"疾病"},
					{ id:11, pid:1, name:"上呼吸道感染"},
					{ id:111, pid:11, name:"普通感冒"},
					{ id:112, pid:11, name:"流行性感冒"},
					{ id:113, pid:11, name:"咽炎感染"},
					{ id:1121, pid:112, name:"单纯型流行性感冒"},
					{ id:1122, pid:112, name:"肺炎型流行性感冒"},
					{ id:2, pid:0, name:"症状"},
					{ id:21, pid:2, name:"咽干"},
					{ id:22, pid:2, name:"咽痒"},
					{ id:23, pid:2, name:"灼烧"},
					{ id:24, pid:2, name:"发热"},
					{ id:25, pid:2, name:"鼻塞"},
					{ id:26, pid:2, name:"流涕"},
					{ id:3, pid:0, name:"体格检查"},
					{ id:31, pid:3, name:"心率"},
					{ id:32, pid:3, name:"呼吸"},
					{ id:33, pid:3, name:"血压"},
					{ id:34, pid:3, name:"体温"},
					{ id:4, pid:0, name:"医学仪器及影像测量"},
					{ id:41, pid:4, name:"X光片"},
					{ id:42, pid:4, name:"B超"},
					
				],
				Ontschema:[
					{subject:"普通感冒",property:"主诉症状",object:"咽干"},
					{subject:"普通感冒",property:"主诉症状",object:"发热"}
				]
		}
		// var OntModel={
		// 		znodes:[
		// 			{ id:1, pid:0, name:"Disease"},
		// 			{ id:11, pid:1, name:"UpperRespiratoryInfections"},
		// 			{ id:111, pid:11, name:"CommonCold"},
		// 			{ id:112, pid:11, name:"Flu"},
		// 			{ id:113, pid:11, name:"Pharyngitis"},
		// 			{ id:1121, pid:112, name:"SimpleInfluenza"},
		// 			{ id:2, pid:0, name:"Symptom"},
		// 			{ id:21, pid:2, name:"DryPharynx"},
		// 			{ id:24, pid:2, name:"Fever"},
		// 			{ id:25, pid:2, name:"NasalTampon"}
		// 		],
		// 		ontschema:[
		// 			{subject:"CommonCold",property:"has_sympotom_of",object:"DryPharynx"},
		// 			{subject:"CommonCold",property:"has_sympotom_of",object:"Fever"}
		// 		]
		// }
		var log, className = "dark";

		function clear_ontmodel(){
			for (var i = 0; i < OntModel.znodes.length; ++i){
				for (var key in OntModel.znodes[i]){
					console.log(key);
					if (key != "id" && key != "pid" && key != "name"){
						console.log(OntModel.znodes[i][key]);
						delete OntModel.znodes[i][key];
					}
				}
			}
		}

		function post_ontology(){
			clear_ontmodel();
			$.ajax({
			  type: 'POST',
			  url: "ajax/post_ontology",
			  data: JSON.stringify (OntModel), // or JSON.stringify ({name: 'jonas'}),
			  success: function(d) { alert('data: ' + d); },
			  contentType: "application/json",
			  dataType: 'json'
			});
		}

		function zTreeOnClick(event,treeId,treeNode)       //双击一个树节点
		{

			//alert(treeNode.tId + ", " + treeNode.name);
			$("#treeid").val(treeNode.name); //显示树节点名字
			$(function(){
				$('#object').html('');
				$.each(OntModel.znodes,function(i,item){
					//alert(val);
					if(item.pid==2)
					{
					$("#object").append("<option>"+item.name+"</option>"); //遍历其他节点作为下拉菜单
					}
				})
			})
			var temp=[];
			for (var i=0;i<OntModel.Ontschema.length;i++)
			{
				if (treeNode.name==OntModel.Ontschema[i].subject)
				{
					mytmp = [];
					mytmp.push(OntModel.Ontschema[i].property);
					mytmp.push(OntModel.Ontschema[i].object);
					//temp=temp+(OntModel.Ontschema[i].subject+OntModel.Ontschema[i].property+OntModel.Ontschema[i].object);
					//$("#show_record").text(OntModel.Ontschema[i].property);
					//$("#show_record").text(OntModel.Ontschema[i].object);
					temp.push(mytmp);
				}

				//$("#show_record").text(temp); //显示之前的关系记录
			}
			str = "";
			for (var i = 0; i < temp.length; ++i){
				str += "<tr>\
							<td>" + temp[i][0] + "</td>\
							<td>" + temp[i][1] + "</td>\
							<td>" + "<input type='button' id='btn_in_main'+[i] value='detail'>" + "</td>\
						</tr>";
			//对每个detail按钮进行事件绑定
	   						$('#'+'btn_in_main'+[i]).click(function(){

	   							$('#'+'btn_in_main'+[i]).html("fuck");
	   						});
	   								
			}
			$('#show_record').html(str);
		};
	   $( function buildOntModel()
		{
			$("#buildOntModel").click(function(){


				//alert("mm");
				// console.log('233');
				var selectProperty = $("#property").find("option:selected").text();
				// var inputSubject =$("#treeid").attr("value");
				var inputSubject = $("#treeid").val();
				var selectObject = $("#object").find("option:selected").text();
				//alert(inputSubject);
				//var arrayjson=JSON.parse(OntSchema);
				OntModel.Ontschema.push({"subject":inputSubject,"property":selectProperty,"object":selectObject});

				//OntSchema=JSON.stringify(arrayjson);
				tmptree = $.fn.zTree.getZTreeObj('treeDemo');
				tid = tmptree.getSelectedNodes()[0].tId;
				$('#' + tid + '_a').click();
				//var btn_in_main=$("<input type='button' id='btn_in_main' value='detail'>")
				//$('#' + tid + '_a').append(btn_in_main);
				//addBtn_in_mainEvent("btn_in_main");
			});

		})




		function beforeDrag(treeId, treeNodes) {
			return false;
		}
		function beforeEditName(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.selectNode(treeNode);
			//return confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
			return;
		}
		function beforeRemove(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.selectNode(treeNode);
			return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
		}
		function onRemove(e, treeId, treeNode) {
			showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		}
		function beforeRename(treeId, treeNode, newName, isCancel) {
			className = (className === "dark" ? "":"dark");
			showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
			if (newName.length == 0) {
				alert("节点名称不能为空.");
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				setTimeout(function(){zTree.editName(treeNode)}, 10);
				return false;
			}
			return true;
		}
		function onRename(e, treeId, treeNode, isCancel) {
			showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
		}
		function showRemoveBtn(treeId, treeNode) {
			return true;
		}
		function showRenameBtn(treeId, treeNode) {
			return true;
		}
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 8) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
		function getTime() {
			var now= new Date(),
					h=now.getHours(),
					m=now.getMinutes(),
					s=now.getSeconds(),
					ms=now.getMilliseconds();
			return (h+":"+m+":"+s+ " " +ms);
		}

		var newCount = 1;
		function addHoverDom(treeId, treeNode) {
			var sObj = $("#" + treeNode.tId + "_span");
			if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
			var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
					+ "' title='add node' onfocus='this.blur();'></span>";
			sObj.after(addStr);
			var btn = $("#addBtn_"+treeNode.tId);
			if (btn) btn.bind("click", function(){
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				 x=zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
				var m = $.merge(OntModel.znodes,x);

				return false;
			});
		};
		function removeHoverDom(treeId, treeNode) {
			$("#addBtn_"+treeNode.tId).unbind().remove();
		};
		function selectAll() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, OntModel.znodes);
			$("#selectAll").bind("click", selectAll);
			//var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			//znodes=zTree.getNodes();
		})
		//-->
	</SCRIPT>
	<style type="text/css">
		.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
	</style>
</HEAD>

<body style="padding:0px; background-color:#f4f6f4">
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">Logo</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="">在线问诊</a></li>
					<li><a href="">知识库</a></li>
					<li><a href="">使用指南</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="">建议</a></li>
					<li><a href="">关于</a></li>
				</ul>
			</div>
		</div>
	</nav>

<div class="container">
	<div class="row">
		<div class="zTreeDemoBackground left col-sm-4">
			<div class="panel panel-default">
				<div class="panel-body">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
			</div>
		</div>

		<div class="right col-sm-8">
			<div class="panel panel-default">
				<div class="panel-body">
					<p >
						<input id="treeid" class="inputText" type="text" />
					</p>
					
					<h3 class="panel-title">
         					患者主诉
     				 </h3>
				
					<div class="middle row" >
						<div class="col-sm-8">
							<table id="show_record" class="table">
							
							</table>
							<hr />
						</div>
					</div>
					
					<form>
						<select name="Property" id="property">
							<option value="sympotom">主诉症状</option>
							
						</select>
						<select name="object" id="object">

						</select>
						<input class="btn btn-info" id="buildOntModel" type="button" value="添加"/>
					</form>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					<h3 class="panel-title">
         				体格检查
     				 </h3>
     				 <p></p>
     				<div class="control-group row">
						<label class="control-label col-sm-2 ">检测项：</label>
							<div class="col-sm-10 ">
								<select id="physical_exam" class="form-control select select-primary col-sm-4">
										<option value="1">心率</option>
										<option value="2">呼吸</option>
										<option value="3">血压</option>
										<option value="4">体温</option>
								</select>
						</div>					
					</div>
					<p></p>
						<div class="control-group row">
							<label class="control-label col-sm-2">测量数值：</label>
								<div class="col-sm-10">
									<div class="input-group col-sm-4">
										<input id="last_time_ipt1" type="text" class="form-control">
											<span class="input-group-addon">~</span>
												<input id="last_time_ipt2" type="text" class="form-control">
									</div>
								</div>
						</div>
				</div>					
					
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					<h3 class="panel-title">
         				医学仪器及影像测量
     				 </h3>
     				 <p></p>
     				<div class="control-group row">
						<label class="control-label col-sm-2 ">检测项：</label>
							<div class="col-sm-10 ">
								<select id="physical_exam" class="form-control select select-primary col-sm-4">
										<option value="1">X光片</option>
										<option value="2">B超</option>
										
								</select>
						</div>					
					</div>
					<p></p>
						<div class="control-group row">
							<label class="control-label col-sm-2">检测结果</label>
								<div class="col-sm-10">
									<div class="input-group col-sm-4">
										<input id="last_time_ipt1" type="text" class="form-control">
									</div>
								</div>
						</div>
				</div>					
					
			</div>
		</div>


	</div>

</div>
	
	



</body>
</HTML>