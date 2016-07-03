<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/css/bootstrap.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->

    <script src="../static/js/jquery-1.11.3.js"></script>
    <script src="../static/js/bootstrap.js"></script>

    <link rel="stylesheet"  href="../static/flatui/flat-ui.min.css">
    <script src="../static/flatui/flat-ui.min.js"></script>

</head>
<body>
<script type="text/javascript">
    /*
    var drug=[
        {"id": 1, "name": "维生素C","type":"inject","specific":"500mg 2支","producer":"","prize":"5.0"},
        {"id": 2, "name": "布洛芬悬液","type":"oral","specific":"100ml 2g/瓶","producer":"","prize":"18.5"},
        {"id": 3, "name": "xy","type":"physican","specific":"10mg:2g/支","producer":"","prize":"33.0"},
        {"id": 4, "name": "维生素B","type":"inject","specific":"200mg 2支","producer":"","prize":"21"}
    ];
      */

    var patients;


    var patient_db;

    //进入候诊
    function post_patient_info(obj){
        var name=$(obj).text();
        var clinic_id_number=$(obj).parent().parent().children("td").eq(5).text();
        var patient_info={"name": name,"clinicId":clinic_id_number};

        console.log(patient_info);
        $.ajax({
            type: 'POST',
            url: "ajax/post_patient_info",
            data: JSON.stringify (patient_info), // or JSON.stringify ({name: 'jonas'}),
            success: function(d) { alert('data: ' + d); },
            contentType: "application/json",
            dataType: 'json'
        });


        console.log("post info finish");
        window.location.href="/clinicDiagnosis/";
    }

    function add_patient_info() {
        $("#add_patient_info").modal("show");

    };
        //新增档案
    function update_patient_manage() {


        $("#add_patient_info").modal("hide");
        var name=$("#patient_name").val();
        var gender=$("#patient_gender").val();
        var birthday=$("#patient_birthday").val();
        var age=$("#patient_age").val();
        var marriage=$("#patient_marriage").val();
        var paytype=$("#patient_paytype").val();
        var telphone=$("#patient_telphone").val();
        var paycard_id=$("#patient_paycard_id").val();
        var id_number=$("#patient_id_number").val();
        var clinic_id_number=$("#patient_clinic_id_number").val();
        var result="";
        result+="<tr align='center' ><td> " +
                ""+"<button class='btn btn-link' onclick='post_patient_info(this)'>"+name+"</button>"+ " </td>" +
                "<td>" +gender+"</td>" +
                "<td>"+age+"</td>" +
                "<td>"+birthday+" </td>" +
                "<td>"+id_number+"</td>" +
                "<td>"+clinic_id_number+"</td>" +
                "<td>"+telphone+"</td>" +
                "</tr>";
        $("#patient_info_list").append(result);

        var newPatient={"name": name,"gender":gender,"birthday":birthday,
                    "age":age,"clinicid":clinic_id_number,"personid":id_number,"paytype":paytype};
        $.ajax({
            type: 'POST',
            url: "ajax/add_patient_info",
            data: JSON.stringify (newPatient), // or JSON.stringify ({name: 'jonas'}),
            success: function(d) { alert('data: ' + d); },
            contentType: "application/json",
            dataType: 'json'
        });

    }

    function Search_patient_result() {
        var search_text=$("#search_patient_info").val();
        var result="";
        var i;
        if (search_text!="")
        {

            for( i in  patient_db)
            {
                var clinicName=patient_db[i].name+"";
                if(clinicName.indexOf(search_text)!=-1)
                {
                    result+="<tr align='center' ><td> " +
                            "<button class='btn btn-link' onclick='post_patient_info(this)'>"+patient_db[i].name+"</button>" + " </td>" +
                            "<td>" +patient_db[i].gender+"</td>" +
                            "<td>"+patient_db[i].age+"</td>" +
                            "<td>"+"</td>" +
                            "<td>"+patient_db[i].person_id+"</td>" +
                            "<td>"+patient_db[i].clinic_id+"</td>" +
                            "<td>"+"</td>" +
                            "</tr>";
                }
            }

            $("#patient_info_list").html(result);
        }
        else
        {
            $("#patient_info_list").text("输入为空");
        }

    }
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();

        console.log("prepare ajax");
        $.ajax({
            //解析从后台返回的json数据
            url:"post_patient_info_manage" ,
            type:"post",
            success:function(data){
                patient_db=eval(data);
                console.log(patient_db);

            }
        });
        console.log("finish ajax");

    });

</script>
<div class="navbar navbar-inverse navbar-embossed" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
            </button>
            <a class="navbar-brand" href="#">医疗宝</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" id="ClinicDiagnosisiDropDown" data-toggle="dropdown">诊疗收费 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="../clinicDiagnosis/">日常诊疗</a></li>
                        <li><a href="#">记账核销</a></li>
                        <li><a href="../patientManage/">患者管理</a></li>

                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" id="DrugManageDropDown" data-toggle="dropdown">药品库房管理 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">药品入库</a></li>
                        <li><a href="#">药品出库</a></li>
                        <li><a href="#">库存明细</a></li>

                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="../navbar/">帮助</a></li>
                <li><a href="../navbar-fixed-top/">Home</a></li>
                <li class="active"><a href="./">个人中心</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
<div class="row">
    <div class="col-md-10">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">患者信息管理</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">
                        <button class="btn btn-primary" onclick="add_patient_info()">
                            <span class="fui-plus"></span>
                            新增档案
                        </button>
                    </div>
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-3">
                        <div class="input-group  input-group-rounded">
                            <span class="input-group-btn">
                            <button type="submit" class="btn" onclick="Search_patient_result()"><span class="fui-search"></span></button>
                            </span>
                            <input type="text" class="form-control" placeholder="Search" id="search_patient_info">
                        </div>

                    </div>
                </div>

                <p></p>
                <table class="table  table-bordered " id="patient_manage_info">
                    <thead>
                    <tr align="center">
                        <td>姓名</td>
                        <td>性别</td>
                        <td>年龄</td>
                        <td>出生日期</td>
                        <td>身份证号</td>
                        <td>诊疗卡号</td>
                        <td>联系电话</td>
                    </tr>
                    </thead>

                    <tbody id="patient_info_list">
                    <tr align="center">
                        <td>binding</td>
                        <td>男</td>
                        <td></td>
                        <td>1998.5.11</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
    <div class="col-md-2">

    </div>
</div>

<!-- 模态框（Modal）  for 新增档案-->
<div class="modal fade" id="add_patient_info" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" >
                    新增档案
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-condensed" style="background-color: #C0D9D9 ">
                    <tbody>
                    <tr>
                        <td style="width: 20%"> 姓名</td>
                        <td style="width: 30%"><input id="patient_name" type="text"  class="form-control input-sm" /></td>
                        <td style="width: 20%">性别</td>
                        <td style="width: 30%">
                            <select class="form-control input-sm" id="patient_gender">
                                <option>男</option>
                                <option>女</option>
                                <option>未知</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 20%">出生日期</td>
                        <td style="width: 30%"><input id="patient_birthday" type="date" class="form-control input-sm " /></td>
                        <td style="width: 20%">年龄</td>
                        <td style="width: 30%"><input id="patient_age" type="text"  class="form-control input-sm" /></td>
                    </tr>

                    <tr>
                        <td style="width: 20%">婚姻状况</td>
                        <td style="width: 30%">
                            <select class="form-control input-sm" id="patient_marriage">
                                <option>已婚</option>
                                <option>未婚</option>
                                <option>未知</option>
                            </select>
                        </td>
                        <td style="width: 20%">费用类型</td>
                        <td style="width: 30%">
                            <select class="form-control input-sm" id="patient_paytype">
                                <option>公费</option>
                                <option>自费</option>
                                <option>未知</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">联系电话</td>
                        <td style="width: 30%"><input id="patient_telphone" type="text" class="form-control input-sm " /></td>
                        <td style="width: 20%">医保卡号</td>
                        <td style="width: 30%"><input id="patient_paycard_id" type="text"  class="form-control input-sm" /></td>
                    </tr>
                    <tr>
                        <td style="width: 20%">身份证号</td>
                        <td style="width: 30%"><input id="patient_id_number" type="text" class="form-control input-sm " /></td>
                        <td style="width: 20%">诊疗卡号</td>
                        <td style="width: 30%"><input id="patient_clinic_id_number" type="text"  class="form-control input-sm" /></td>
                    </tr>

                    </tbody>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="update_patient_manage()">
                    保存
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>