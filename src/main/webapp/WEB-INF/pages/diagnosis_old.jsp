<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>辅助诊断</title>
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
		<link rel="stylesheet" type="text/css" href="../static/zTree/css/zTreeStyle/zTreeStyle.css">
		<script src="../static/js/jquery-1.11.3.js"></script>
		<script src="../static/js/jsrender.min.js"></script>
		<script src="../static/flatui/video.js"></script>
		<script src="../static/js/bootstrap.js"></script>

		<script type="text/javascript">
			var patient_info = {};
			var chief_complaint_list = [];

			patient_info.name = "";
			patient_info.gender = "";
			patient_info.id = "";
			patient_info.age = "";
			patient_info.office = "";

			patient_info.complaint = [];
			patient_info.complaintTime = [];
			patient_info.complaintDegree = [];
			patient_info.phyExam = [];
			patient_info.phyExamResult = [];

			patient_info.test = [];
			patient_info.testResult = [];

			patient_info.possibleDisease = [];
			patient_info.advice = [];

			degree_list = ['未选择', '轻度', '中度', '重度'];
			degree_list_en = ['unselected', 'light', 'medium', 'heavy'];

			function tmpl_render_html(tmpl, target, d){
				var html = $(tmpl).render(d);
				$(target).html(html);
			}

			function ajax_post_json(target, json){
				$.ajax({
				  type: 'POST',
				  url: target,
				  data: JSON.stringify (json), // or JSON.stringify ({name: 'jonas'}),
				  //success: function(d) { alert('data: ' + d); },
				  contentType: "application/json",
				  dataType: 'text'
				});
			}

			function get_complaint_list(){
				chief_complaint_list = ['sniveel', 'headache', 'cough', 'NasalTampon', 'DryPharynx', 'dizzy', 'throatache', 'FearCold', 'dyspnea', 'hemoptysis'];
				chief_complaint_list_ch = ['流涕', '头痛', '咳嗽', '鼻塞', '咽干', '头晕', '咽痛', '畏寒', '呼吸困难', '咳血'];
				update_chief_complaint_list();
				// $.ajax( {
				// 	type : "get",
				// 	url : "ajax/get_complaints.do",
				// 	dataType:"json",
				// 	success : function(json) {
				// 		chief_complaint_list = json.complaintList;
				// 		update_chief_complaint_list();
				// 	}
				// });
			}

			function post_basicinfo(){
				$.ajax({
				  type: 'POST',
				  url: "ajax/post_basicinfo",
				  data: JSON.stringify ({name: 'haha'}), // or JSON.stringify ({name: 'jonas'}),
				  //success: function(d) { alert('data: ' + d); },
				  contentType: "application/json",
				  dataType: 'json'
				});
			}

			function update_basic_info(){
				$('#patient_name').html($('#input_name').val());
				$('#patient_gender').html($("input:radio[name='input_gender'][checked]").val());
				$('#patient_age').html($('#input_age').val());
				$('#case_office').html($('#input_office').val());
				$('#case_id').html($('#input_id').val());
				
				if ($('#input_name').val() != "")
					patient_info.name = $('#input_name').val();
				if ($("input:radio[name='input_gender'][checked]").val() != undefined)
					patient_info.gender = $("input:radio[name='input_gender'][checked]").val();
				if ($('#input_id').val() != "")
					patient_info.id = $('#input_id').val();
				if ($('#input_age').val() != "")
					patient_info.age = $('#input_age').val();
				if ($('#input_office').val() != "")
					patient_info.office = $('#input_office').val();
			}

			function get_phyExam(){
				$.ajax({
				  type: 'POST',
				  url: "ajax/phyExam",
				  data: JSON.stringify (patient_info), // or JSON.stringify ({name: 'jonas'}),
				  success: function(d) { alert('data: ' + d); },
				  contentType: "application/json",
				  dataType: 'json'
				});
			}

			function update_patient_info(){
				console.log(patient_info);
				update_basic_info();
				update_phyExamResult();
				update_testResult();
				$.ajax({
				  type: 'POST',
				  url: "ajax/update_patient_info",
				  data: JSON.stringify (patient_info), // or JSON.stringify ({name: 'jonas'}),
				  success: function(d) {
				  	console.log(d); 
				  	patient_info = d;
				  	update_disease_table();
				  	update_advice_table();
				  	update_chief_complaint_table();
				  	update_test_table();
				  	update_phyExam_table();
				  },
				  contentType: "application/json",
				  dataType: 'json'
				});
			}
		</script>
	</head>

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
                        <li><a href="">添加规则</a></li>
                        <li><a href="">使用指南</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="">建议</a></li>
                        <li><a href="">关于</a></li>
                    </ul>
				</div>
			</div>
		</nav>

		<div class="container bs-docs-container">
			<div class="row">
				<div class="panel panel-default col-md-9">
					<div class="panel-body" role="main" id="top">
						<div id="basic_info_section" class="bs-docs-section row">
							<h4 id="basic_info_title" class="page-header">基本信息</h4>
							<div>
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<strong>姓名：</strong><span id="patient_name">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;
									<strong>性别：</strong><span id="patient_gender">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;
									<strong>年龄：</strong><span id="patient_age">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;
									<strong>科室：</strong><span id="case_office">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;
									<strong>ID号：</strong><span id="case_id">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="" data-toggle="modal" data-target="#basic_info_modal"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
									<br />
								</p>
							</div>
							<br />
							<script type="text/javascript">
								function gen_text_input(chname, egname){
									str = "<div class=\"control-group row\">\
											<label class=\"control-label col-md-2\"><strong>" + chname + "</strong></label>\
											<div class=\"col-md-8\">\
												<div id=\"" + egname + "_show\">\
													<p id=\"" + egname + "\"></p>\
													<a id=\"" + egname + "_edit\" onclick=\"$('#" + egname + "_show').hide(); $('#" + egname +"_update').show()\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>\
												</div>\
												<div id=\"" + egname + "_update\" style=\"display:none;\">\
													<textarea rows=\"3\" id=\"input_" + egname + "\" class=\"form-control\" placeholder=\"" + chname + "\" aria-describedby=\"sizing-addon1\"></textarea>\
													<a id=\"" + egname + "_confirm\" onclick=\"$('#" + egname+ "').html($('#input_" + egname + "').val()); $('#" + egname + "_show').show(); $('#" + egname + "_update').hide()\"><span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span></a>\
													&nbsp;&nbsp;&nbsp;&nbsp;\
													<a id=\"" + egname + "_cancel\" onclick=\" $('#" + egname + "_show').show(); $('#" + egname + "_update').hide()\"><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span></a>\
													&nbsp;&nbsp;&nbsp;&nbsp;\
													<a id=\"" + egname + "_cancel\" onclick=\"$('#input_" + egname + "').val(''); $('#" + egname + "').html(''); $('#" + egname + "_show').show(); $('#" + egname + "_update').hide()\"><span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span></a>\
												</div>\
											</div>\
										</div>\
										<br />";
									document.write(str);
								}
							</script>
							<div id="patient_log" class="form-horizontal">
								<script type="text/javascript">
									gen_text_input("现病史", "current_log");
									gen_text_input("既往史", "past_log");
									gen_text_input("个人史", "personal_log");
									gen_text_input("家族史", "family_log");
								</script>
							</div>
						</div>

						<script type="text/javascript">
							function add_chief_complaint(){
								patient_info.complaint.push(chief_complaint_list[$('#input_chief_complaint').val()]);
								patient_info.complaintTime.push($('#input_chief_complaintTime').val());
								patient_info.complaintDegree.push($('#input_chief_complaintDegree').val());
								update_chief_complaint_table();
							}

							function del_chief_complaint(id){
								patient_info.complaint.splice(id, 1);
								patient_info.complaintTime.splice(id, 1);
								patient_info.complaintDegree.splice(id, 1);
								update_chief_complaint_table();
							}

							function update_chief_complaint_table(){
								str = "<tr>\
										<th>症状</th>\
										<th>程度</th>\
										<th>持续时间</th>\
										<th></th>\
									   </th>";
								for (var i = 0; i < patient_info.complaint.length; i++){
									str += "<tr>\
												<td>" + patient_info.complaint[i] + "</td>\
												<td>" + degree_list[patient_info.complaintDegree[i]] + "</td>\
												<td>" + patient_info.complaintTime[i] + "</td>\
												<td> <a href=\"javascript:void(0)\" onclick=\"del_chief_complaint(" + i + ");\"><span class=\"glyphicon glyphicon-trash\"></span></a></td>\
											</tr>";
								}
								$('#chief_complaint_table').html(str);
							}

							function update_chief_complaint_list(){
								str = "";
								for (var i = 0; i < chief_complaint_list.length; i++){
									str += "<option value=\"" + i + "\">" + chief_complaint_list_ch[i] + "</option>";
								}
								$('#input_chief_complaint').html(str);
								$('#input_chief_complaint').val(0);
								$("select").select2({dropdownCssClass: 'dropdown-inverse'});
							}

						</script>

						<div id="chief_complaint_section" class="bs-docs-section row">
							<h4 id="chief_complaint_title" class="page-header">主诉</h4>
							<div class="col-sm-offset-1">
								<form class="form-horizontal">
									<div class="control-group row">
										<label class="control-label col-sm-2">症状：</label>
										<div class="col-sm-10">
											<select id="input_chief_complaint" class="form-control select select-primary select-block mbl">
			  								</select>
		  								</div>
									</div>

	  								<div class="control-group row">
	  									<label class="control-label col-sm-2">严重程度：</label>
										<div class="col-sm-10">
		  									<select id="input_chief_complaintDegree" class="form-control select select-primary select-block mbl">
												<option value="0">未选择</option>
												<option value="1">轻度</option>
												<option value="2">中度</option>
												<option value="3">重度</option>
			  								</select>
										</div>
	  								</div>

	  								<div class="control-group row">
	  									<label class="control-label col-sm-2">持续时间：</label>
	  									<div class="col-sm-4">
		  									<input id="input_chief_complaintTime" class="form-control input-large" type="text" placeholder="持续时间（天）"></input>
	  									</div>
	  								</div>
	  								<br />
	  								
	  								<div class="control-group row">
	  									<label class="control-label col-sm-2"></label>
	  									<div class="col-sm-10">
	  										<button type="button" class="btn btn-info" onclick="add_chief_complaint();">添加</button>
	  									</div>
	  								</div>
	  								<br />
								</form>
							</div>
							<div class="col-sm-offset-2 col-sm-8">
								<table id="chief_complaint_table" class="table table-hover table-striped">
								</table>
							</div>
						</div>

						<script type="text/javascript">
							function update_phyExam_table(){
								str = "<tr><th>项目</th><th>结果</th></tr>";
								for (var i = 0; i < patient_info.phyExam.length; i++){
									str += "<tr>\
												<td>" + patient_info.phyExam[i] + "</td>\
												<td> <input id=\"phy" + i + "\" class=\"form-control input-large\" type=text></input> </td>\
											</tr>";
								}
								$('#phyExam_content').html(str);
								for (var i = 0; i < patient_info.phyExam.length; ++i){
									$('#phy' + i).val(patient_info.phyExamResult[i]);
								}
							}

							function update_phyExamResult(){
								for (var i = 0; i < patient_info.phyExam.length; i++){
									patient_info.phyExamResult[i] = $('#phy' + i).val();
								}
							}
						</script>

						<div id="phyExam_section" class="bs-docs-section row">
							<h4 id="phyExam_title" class="page-header">体格检查</h4>
							<div class="row">
								<div class="col-sm-offset-2 col-sm-8">
									<table id="phyExam_content" class="table table-bordered">
										
									</table>
								</div>
							</div>
							<br />
							<!-- <div class="row">
								<div class="col-sm-offset-3">
	  								<button type="button" class="btn btn-info" onclick="update_phyExamResult();">更新</button>
								</div>
							</div> -->
						</div>
	
						<script type="text/javascript">
							function update_test_table(){
								str = "<tr><th>项目</th><th>结果</th></tr>";
								for (var i = 0; i < patient_info.test.length; i++){
									str += "<tr>\
												<td>" + patient_info.test[i] + "</td>\
												<td> <input id=\"test" + i + "\" class=\"form-control input-large\" type=text></input> </td>\
											</tr>";
								}
								$('#test_content').html(str);
								for (var i = 0; i < patient_info.test.length; ++i){
									$('#test' + i).val(patient_info.testResult[i]);
								}
							}

							function update_testResult(){
								for (var i = 0; i < patient_info.test.length; i++){
									patient_info.testResult[i] = $('#test' + i).val();
								}
							}
						</script>
						<div id="test_section" class="bs-docs-section row">
							<h4 id="test_title" class="page-header">推荐检查</h4>
							<div class="row">
								<div class="col-sm-offset-2 col-sm-8">
									<table id="test_content" class="table table-bordered">
										
									</table>
								</div>
							</div>
							<br />
							<!-- <div class="row">
								<div class="col-sm-offset-3">
	  								<button type="button" class="btn btn-info" onclick="update_testResult();">更新</button>
								</div>
							</div> -->
						</div>
						
						<script type="text/javascript">
							function update_disease_table(){
								str = "<tr><th>病名</th><th>概率</th></tr>";
								for (var i = 0; i < patient_info.possibleDisease.length; ++i){
									if (patient_info.possibleDisease[i] == null){
										continue;
									}
									str += "<tr>\
												<td>" + patient_info.possibleDisease[i] + "</td>\
												<td></td>\
											</tr>";
								}
								$('#disease_table').html(str);
							}
						</script>
						<div id="diagnosis_result_section" class="bs-docs-section row">
							<h4 id="diagnosis_result_title" class="page-header">初步诊断结果</h4>
							<div class="col-sm-offset-2 col-sm-8">
								<table id="disease_table" class="table table-bordered">
									
								</table>
							</div>
						</div>

						<script type="text/javascript">
							function update_advice_table(){
								str = "<tr><th>处理意见</th><th>具体描述</th></tr>";
								for (var i = 0; i < patient_info.advice.length; ++i){
									var index = patient_info.test.indexOf(patient_info.advice[i]);
									if ( index == -1){
										patient_info.test.push(patient_info.advice[i]);
										patient_info.testResult.push("");
									}
									if (index == -1 || (index != -1 && (patient_info.testResult[index] == undefined || patient_info.testResult[index] == "")))
									{
										str += "<tr>\
												<td>" + patient_info.advice[i] + "</td>\
												<td></td>\
											</tr>";
									}
								}
								$('#advice_table').html(str);
							}
						</script>

						<div id="solution_section" class="bs-docs-section row">
							<h4 id="solution_title" class="page-header">处理意见</h4>
							<div class="col-sm-offset-2 col-sm-8">
								<table id="advice_table" class="table table-bordered">
									
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3" role="complementary">
					<nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm" id="navbar-example" data-spy="affix" data-offset-top="20">
						<ul class="nav bs-docs-sidenav">
							<li>
								<a href="#basic_info_section">基本信息</a>
							</li>
							<li>
								<a href="#chief_complaint_section">主诉</a>
							</li>
							<li>
								<a href="#phyExam_section">体格检查</a>
							</li>
							<li>
								<a href="#test_section">推荐检查</a>
							</li>
							<li>
								<a href="#solution_section">处理意见</a>
							</li>
							<li>
								<a href="#top" class="back-to-top">返回顶部</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="update_patient_info();"><span class="glyphicon glyphicon-refresh"></span>同步</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- basic info Modal -->
		<script type="text/javascript">
			function gen_input(chname, egname){
				str = "<div class=control-group><label class='control-label col-sm-2' for='input_" + egname + "'/>" + chname + "</label><div class=col-sm-10><input id='input_" + egname + "' class='form-control input-large' type=text placeholder='输入" + chname + "' /></div></div><br /><br />";
				document.write(str);
			}
		</script>
		<div class="modal fade" id="basic_info_modal" tabindex="-1" role="dialog" aria-labelledby="basic_info_modal_label" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="basic_info_modal_label">基本信息</h4>
			  </div>
			  <div class="modal-body" id="basic_info_modal_body">
				<div>
					<form class="form-horizontal">
						<script type="text/javascript">
							gen_input("姓名", "name");
						</script>
						<div class="control-group">
							<label class="control-label col-sm-2" for="input_gender">性别</label>
							<div class="col-sm-10">
								<label class="radio" onclick="$('#gender_male').attr('checked', true);$('#gender_female').attr('checked', false);">
									<input id="gender_male" type="radio" value="男" name="input_gender" />
										男
								</label>
								<label class="radio checked" onclick="$('#gender_female').attr('checked', true);$('#gender_male').attr('checked', false);">
									<input id="gender_female" type="radio" value="女" name="input_gender" checked="checked" />
										女
								</label>
							</div>
						</div>
						<br />
						<br />
						<div class="control-group">
							<label class="control-label col-sm-2" for="input_age">年龄</label>
							<div class="col-sm-10">
								<select id="input_age" class="form-control select select-primary select-block mbl">
		  						</select>
		  						<script type="text/javascript">
									for (var i = 0; i < 100; ++i){
		    							$('#input_age').append("<option value=" + i + ">" + i + "</option>");
		    						}
		    					</script>
							</div>
						</div>
						<br />
						<br />
						<script type="text/javascript">
							gen_input("科室", "office");
							gen_input("ID号", "id");
						</script>
					</form>
				</div>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="update_basic_info();" data-dismiss="modal">保存</button>
			  </div>
			</div>
		  </div>
		</div>


        
		<footer class="footer">
			 <div class="container">
				<div class="row footer-bottom">
				  <ul class="list-inline text-center">
					<li><a href="">PKU SEI</a> Version : 0.4</li>
				  </ul>
				</div>
			 </div>
		</footer>

		<nav class="navbar navbar-default navbar-fixed-bottom">
			<div class="container">
				<a href="javascript:void(0)" onclick="update_patient_info();"><span class="glyphicon glyphicon-refresh"></span>同步</a>
			</div>
		</nav>

		<script type="text/javascript" id="my_init">
			get_complaint_list();
			update_chief_complaint_table();
		</script>

		<script type="text/javascript" id="flat_ui_init">
			$(':checkbox').radiocheck();
			$(':radio').radiocheck('check');
			$("select").select2({dropdownCssClass: 'dropdown-inverse'});
			$(".tagsinput").tagsinput();
        	videojs.options.flash.swf = "/SpringX/static/flat_ui/dist/js/vendors/video-js.swf";
		</script>
	</body>
</html>