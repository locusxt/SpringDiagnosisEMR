<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: daibinding
  Date: 16/4/24
  Time: 上午9:19
  To change this template use File | Settings | File Templates.
--%>
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

<style>

</style>
<script>

</script>
<script type="text/javascript">


    //Json数据源
    var globalpatientinfo;
    var globalpatient_sym={};
    var full_meta_info={};
    function getCurrentPatientSymptom()
    {
        var allge=$("#allergy_info").val();
        var history_diagnosis=$("#history_disease_info").val();
        var symptom=$("#MainSymptom").val();
        var phy_exam=$("#PhysicalExam").val();

    }
    function getFullMetaData()
    {
        $.ajax({
            //解析从后台返回的json数据
            url:"/post_symptom_metadata",
            type:"post",
            success:function(data){
                var data_json=JSON.parse(data);
                full_meta_info.symptom=data_json;
            }
        });

        $.ajax({
            //解析从后台返回的json数据
            url:"/post_diagnosis_metadata",
            type:"post",
            success:function(data){
                var data_json = JSON.parse(data);
                full_meta_info.diagnosis=data_json;
            }
        });

        $.ajax({
            //解析从后台返回的json数据
            url:"/post_phy_exam_metadata",
            type:"post",
            success:function(data){
                var data_json = JSON.parse(data);
                full_meta_info.phy_exam=data_json;

                //console.log(data);
            }
        });

        $.ajax({
            //解析从后台返回的json数据
            url:"/post_instru_exam_metadata",
            type:"post",
            success:function(data){
                var data_json = JSON.parse(data);
                full_meta_info.instru_exam=data_json;
            }
        });


        $.ajax({
            //解析从后台返回的json数据
            url:"/post_drug_metadata",
            type:"post",
            success:function(data){
                var data_json = JSON.parse(data);
                full_meta_info.drug=data_json;
            }
        });
    }

    //打开诊疗卡号搜索框
    function Search_clinic_id()
    {
        $('#search_clinic_id').modal('show');
    };

    function add_history_disease() {

        $("#add_history_disease").modal('show');
    };
    function add_symptom() {
        $("#add_Symptom").modal('show');

    };

    function add_diagnosis() {
        $("#add_diagnosis").modal('show');

    };

    function add_another_diagnosis() {
        $("#add_another_diagnosis").modal('show');

    };


    function add_allergy() {
        $("#add_allergy").modal('show');

    };

    function allergy_update()
    {
        var allergy=$("#allery_select").val();

        if($("#allergy_info").val()!="")
        {
            allergy+=(","+$("#allergy_info").val());
        }
        $("#allergy_info").val(allergy);
        $("#add_allergy").modal('hide');
    };

    function update_patient_on_diagnosis(obj)
    {
        var name=$(obj).text();
        var clinicid=$(obj).parent().parent().children("td").eq(1).text();
        var gender=$(obj).parent().parent().children("td").eq(2).text();
        var age=$(obj).parent().parent().children("td").eq(3).text();
        var paytype=$(obj).parent().parent().children("td").eq(4).text();
        var tab="<table class='table table-bordered table-condensed'>" +
                "<caption>正在就诊病人</caption>"+"<tr>" +
                        "<td>"+"姓名"+"</td>"+
                        "<td>"+"诊疗卡号"+"</td>"+
                        "<td>"+"性别"+"</td>"+
                        "<td>"+"年龄"+"</td>"+
                        "<td>"+"费用类型"+"</td>"+
                        "</tr>"
                ;
        var tab=tab+"<tr>" +
                        "<td>"+name+"</td>"+
                        "<td>"+clinicid+"</td>"+
                        "<td>"+gender+"</td>"+
                        "<td>"+age+"</td>"+
                        "<td>"+paytype+"</td>"+
                        "</tr>"+"</table>"
                ;
        $("#patient_on_diagnosis").html(tab);
    }

    function waitinglist_update (obj) {
        var name=$(obj).text();
        var clinicid=$(obj).parent().parent().children("td").eq(1).text();
        var clinicID=parseInt(clinicid);
        console.log(globalpatientinfo);
        update_patient_on_diagnosis(obj);

        for(var i=0;i<globalpatientinfo.length;i++)
        {
            if((parseInt(globalpatientinfo[i].clinic_id))==clinicID)
            {
                $("#patient_name").val(globalpatientinfo[i].name);
                $("#patient_clinic_id").val(clinicid);
                $("#patient_gender").val(globalpatientinfo[i].gender);
                $("#patient_age").val(globalpatientinfo[i].age);
                $("#patient_tel").val(globalpatientinfo[i].telnumber);
            }
            console.log(clinicID);
            console.log(globalpatientinfo[i].clinic_id);
        }
        //$("#patient_name").val(name);


    }


    function patientinfo_update(obj)
    {
        var name=$(obj).parent().parent().children("td").eq(0).text();
        var gender=$(obj).parent().parent().children("td").eq(1).text();
        var age=$(obj).parent().parent().children("td").eq(2).text();
        var clinicid=$(obj).parent().parent().children("td").eq(3).text();
        $("#patient_name").val(name);
        $("#patient_gender").val(gender);
        $("#patient_age").val(age);
        $("#patient_clinic_id").val(clinicid);
        $("#search_clinic_id").modal('hide');
        var tab="<table class='table table-bordered'><tr>" +
                        "<td>"+"姓名"+"</td>"+
                        "<td>"+"性别"+"</td>"+
                        "<td>"+"年龄"+"</td>"+
                        "<td>"+"诊疗卡号"+"</td>"+
                        "<td>"+"身份证号"+"</td>"+
                        "</tr>"+"</table>"
                ;
         $("#search_patient_result").html(tab);

    };


    function patient_history_disease_update(obj) {
        var disease=$(obj).parent().text();

        if($("#history_disease_info").val()!="")
        {
            disease+=(","+$("#history_disease_info").val());
        }
        $("#history_disease_info").val(disease);
        $("#add_history_disease").modal('hide');
    };

    function patient_diagnosis_update(obj) {
        var disease=$(obj).parent().text();

        if($("#FirstDiagnosis").val()!="")
        {
            disease+=(","+$("#FirstDiagnosis").val());
        }
        $("#FirstDiagnosis").val(disease);
        $("#add_diagnosis").modal('hide');
    };



    function main_symptom_update(obj)
    {
        var main_symptom=$(obj).parent().text();
        if($("#MainSymptom").val()!="")
        {
            main_symptom+=(","+$("#MainSymptom").val());
        }
        $("#MainSymptom").val(main_symptom);
        $("#add_Symptom").modal('hide');
    }
    /*
    function search_clinic_iddata()
    {
        var search_text=$("#search_patient").val();
        if (search_text!="")
        {
            var tab="<table class='table table-bordered'><tr>" +
                    "<td>"+"姓名"+"</td>"+
                    "<td>"+"性别"+"</td>"+
                    "<td>"+"年龄"+"</td>"+
                    "<td>"+"诊疗卡号"+"</td>"+
                    "<td>"+"身份证号"+"</td>"+
                            "</tr>"
                    ;
            $.each(patients,function(id, item){
                //如果包含则为table赋值
                if(item.name.indexOf(search_text)!=-1){
                    tab+="<tr align='center' ><td> <button class='btn btn-sm btn-link' onclick='patientinfo_update(this)'>" +
                            ""+item.name+"" + "</button> </td>" +
                            "<td>" +item.gender+"</td>" +
                            "<td>"+item.age+"</td>" +
                            "<td>"+item.clinicId+"</td>" +
                            "<td>"+item.IdNumber+"</td>" +
                            "</tr>";
                }
            });
            tab+="</tab>";
            $("#search_patient_result").html(tab);
        }
        else
        {
            $("#search_patient_result").text("no relevant data");
        }

    };
    */

    function search_history_disease()
    {
        var search_text=$("#input_history_disease").val();
        if (search_text!="")
            {
                var tab="<table class='table table-bordered'><tr align='center'>" +
                                "<td>"+"既往病史"+"</td>"+
                                "</tr>"
                        ;
                $.each(full_meta_info.diagnosis,function(id, item){
                    //如果包含则为table赋值
                    if(item.name.indexOf(search_text)!=-1){
                        tab+="<tr align='center' ><td> <button class='btn btn-link ' onclick='patient_history_disease_update(this)'>" +
                                item.name+"</button> </tr>";
                    }
                });
                tab+="</tab>";
                $("#search_history_disease_result").html(tab);
            }
            else
            {
                $("#search_history_disease_result").text("no relevant data");
            }


    };


    function search_diagnosis()
    {
        var search_text=$("#input_diagnosis").val();
        if (search_text!="")
        {
            var tab="<table class='table table-bordered'><tr align='center'>" +
                            "<td>"+"初步诊断"+"</td>"+
                            "</tr>"
                    ;
            $.each(full_meta_info.diagnosis,function(id, item){
                //如果包含则为table赋值
                if(item.name.indexOf(search_text)!=-1){
                    tab+="<tr align='center' ><td> <button class='btn btn-link ' onclick='patient_diagnosis_update(this)'>" +
                            item.name+"</button> </tr>";
                }
            });
            tab+="</tab>";
            $("#search_diagnosis_result").html(tab);
        }
        else
        {
            $("#search_diagnosis_result").text("no relevant data");
        }

    };
    function search_another_diagnosis() {
        var search_text=$("#input_another_diagnosis").val();
        if (search_text!="")
        {
            var tab="<table class='table table-bordered'><tr align='center'>" +
                            "<td>"+"初步诊断"+"</td>"+
                            "</tr>"
                    ;
            $.each(full_meta_info.diagnosis,function(id, item){
                //如果包含则为table赋值
                if(item.name.indexOf(search_text)!=-1){
                    tab+="<tr align='center' ><td> <button class='btn btn-link ' onclick='patient_diagnosis_update(this)'>" +
                            item.name+"</button> </tr>";
                }
            });
            tab+="</tab>";
            $("#search_another_diagnosis_result").html(tab);
        }
        else
        {
            $("#search_another_diagnosis_result").text("no relevant data");
        }

    }

    function search_main_symptom()
    {
        var search_text=$("#search_main_symptom").val();
        if (search_text!="")
        {
            var tab="<table class='table table-bordered'><tr align='center'>" +
                            "<td>"+"主诉症状"+"</td>"+
                            "</tr>"
                    ;
            $.each(full_meta_info.symptom,function(id, item){
                //如果包含则为table赋值
                if(item.name.indexOf(search_text)!=-1){
                    tab+="<tr align='center' ><td> <button class='btn btn-link ' onclick='main_symptom_update(this)'>" +
                            item.name+"</button> </tr>";
                }
            });
            tab+="</tab>";
            $("#search_symptom_result").html(tab);
        }
        else
        {
            $("#search_symptom_result").text("no relevant data");
        }


    };
    //保存主界面病人电子病历记录
    function savePatientRecord(){
        var patientrecord={};
        patientrecord.symptom=$("#MainSymptom").val();
        patientrecord.clinicid=$("#patient_clinic_id").val();
        patientrecord.firstdiagnosis=$("#FirstDiagnosis").val();
        patientrecord.history_disease=$("#history_disease_info").val();
        patientrecord.name=$("#patient_name").val();
        //console.log(patientrecord);
        //alert("test");
        $.ajax({
            type: 'POST',
            url: "ajax/save_patient_record",
            data: JSON.stringify (patientrecord), // or JSON.stringify ({name: 'jonas'}),
            success: function(d) {
               // alert('data: ' + d);
            },
            contentType: "application/json",
            dataType: 'json'
        });
    }

    function writePrescription(){

        document.write_prescription.action="/write_order";

        savePatientRecord();

        var clinic_id=$("#patient_clinic_id").val();
        //alert(clinic_id);
        $("#write_prescription").val(clinic_id);
        document.write_prescription.submit();
    }

    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
        var patient_db;
        getFullMetaData();
        console.log(full_meta_info);
        $.ajax({
            //解析从后台返回的json数据
            url:"/updateWaiting" ,
            type:"post",
            success:function(data){
                var arr=eval(data);
                globalpatientinfo=arr;
                var tab="<table class='table table-bordered table-stripped table-condensed'> <tr>" +
                        "<caption>候诊病人</caption>"+
                               "<tr><td>姓名</td>"+
                                "<td>诊疗卡号</td>"+
                                "<td>性别</td>"+
                                "<td>年龄</td>"+
                                "<td>费用类型</td>";
                        ;
                for(var m = 0;m<arr.length;m++){
                    tab+= "<tr align='center'>" +
                            "<td><button class='btn btn-link' onclick='waitinglist_update(this)'>"+arr[m].name+"</td>"+
                            "<td> "+arr[m].clinic_id+"</button></td>"+
                            "<td>"+arr[m].gender+"</td>"+
                            "<td>"+arr[m].age+"</td>"+
                            "<td>"+arr[m].paytype+"</td></tr>";

                }
                tab+="</table>";
                $("#table_waiting_list").html(tab);
            }
        });
    });


    /*
    $(document).ready(function(){
        $(function () {
            $('#Search_clinic_id').modal('show')});
        $("#search_patient").click(function () {
            var search_text=$("#search_patient").val();
            if (search_text!="")
            {
                var tab="<table width='300' border='1' cellpadding='0' cellspacing='0'><tr align='center'>" +
                        "<td>姓名</td>" + "<td>性别</td>" +
                        "<td>年龄</td>" +
                        "<td>诊疗卡号</td>" +
                        "<td>身份证号</td>" +
                        "</tr>";
                $.each(patients,function(id, item){
                    //如果包含则为table赋值
                    if(item.name.indexOf(seachText)!=-1){
                        tab+="<tr align='center'><td>"+item.name+"" + "</td>" +
                                "<td>" +item.gender+"</td>" +
                                "<td>"+item.age+"</td>" +
                                "<td>"+item.clinicId+"</td>" +
                                "<td>"+item.IdNumber+"</td>" +
                                "</tr>";
                    }
                })
                tab+="</table>";
                $("#search_result").html(tab);
            }
            else
                $("#search_result").html("");
        });
    });

    */

</script>

<!-- Static navbar -->
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
                        <li><a href="../patientManage">患者管理</a></li>

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
    <div class="col-md-8">
        <form name="write_prescription" method="post" role="form">
            <input type="hidden" id="write_prescription" name="clinicid">
            <p>
            <div class="btn-toolbar">
                <div class="btn-group">
                        <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-refresh">清空</span></button>
                        <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-save-file">保存</span></button>
                        <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-ok">完诊</span></button>
                        <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-trash">作废</span></button>
                        <button class="btn btn-primary btn-sm" onclick="writePrescription()"><span class="glyphicon glyphicon-pencil">处方开具</span></button>

                </div>
            </div>
            </p>
        </form>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover table-condensed" id="table_waiting_list">
                    <caption>候诊病人</caption>
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>门诊号</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>费用类型</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr id="patientWaitingList">

                    </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover table-condensed" id="patient_on_diagnosis">
                    <caption>正在就诊病人</caption>
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>诊疗卡号</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>费用类型</th>
                    </tr>
                    </thead>
                    <div id="patient_on_diagnosis_tab">
                        <tbody>

                        </tbody>
                    </div>

                </table>
            </div>
        </div>
    </div>
    <div class="col-md-8">
        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table table-bordered table-striped table-condensed">
                        <tbody>
                        <tr>
                            <td style="width: 20%">姓名</td>
                            <td style="width: 30%"><input id="patient_name" type="text" placeholder="..." class="form-control flat" /></td>
                            <td style="width: 20%">年龄</td>
                            <td style="width: 30%"><input id="patient_age" type="text" placeholder="..." class="form-control flat" /></td>
                        </tr>

                        <tr>
                            <td style="width: 20%">联系电话</td>
                            <td style="width: 30%"><input id="patient_tel" type="text" placeholder="..." class="form-control flat" /></td>
                            <td style="width: 20%">性别</td>
                            <td style="width: 30%"><input id="patient_gender" type="text" placeholder="..." class="form-control flat" /></td>

                        </tr>
                        </tbody>
                        </table>

                        <table class="table table-bordered table-striped">
                        <tr>
                            <td style="width: 20%">医保卡号</td>
                            <td ><input id="patient_healthcard_id" type="text" placeholder="..." class="form-control flat" /></td>
                        </tr>
                        <tr>
                            <td>诊疗卡号</td>
                            <td>  <div class="row">
                                <div class="col-md-8">
                                    <input  id="patient_clinic_id" type="text" placeholder="..." class="form-control flat" />
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-sm btn-primary"   onclick="Search_clinic_id()"  >
                                        查找
                                    </button>
                                </div>

                            </div></td>
                        </tr>
                        <tr>
                            <td>过敏史</td>
                            <td>
                                <div class="row">
                                    <div class="col-md-8">
                                        <input type="text" placeholder="..." class="form-control flat" id="allergy_info" />
                                    </div>
                                   <div class="col-md-2">
                                       <button class="btn btn-sm btn-primary " onclick="add_allergy()">
                                           添加
                                       </button>
                                   </div>

                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td>即往史</td>
                            <td>
                                <div class="row">
                                    <div class="col-md-8">
                                        <input type="text" placeholder="..." class="form-control flat" id="history_disease_info"/>
                                    </div>
                                    <div class="col-md-2">
                                        <button class="btn btn-sm btn-primary" onclick="add_history_disease()" >
                                            添加
                                        </button>
                                    </div>

                                </div>
                            </td>
                        </tr>

                        </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 模态框（Modal）  for 查找挂号患者-->
            <div class="modal fade" id="search_clinic_id" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">×
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                选择挂号患者
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search" id="search_patient">
                                        <span class="input-group-btn">
                                        <button type="submit" class="btn" onclick="search_clinic_iddata()"><span class="fui-search"></span></button>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                </div>
                            </div>
                        </div>
                                <div id="search_patient_result">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td>姓名</td>
                                            <td>性别</td>
                                            <td>年龄</td>
                                            <td>诊疗卡号</td>
                                            <td>身份证号</td>
                                        </tr>
                                    </table>
                                </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">
                                关闭
                            </button>
                            <button type="button" class="btn btn-primary">
                                提交
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <!-- 模态框（Modal）  for 查找过敏原-->
            <div class="modal fade" id="add_allergy" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">×
                            </button>
                            <h4 class="modal-title" >
                                选择常见过敏原
                            </h4>
                        </div>
                        <div class="modal-body">
                            <select  class="form-control" id="allery_select">
                                <option value="花粉">花粉</option>
                                <option value="牛奶">牛奶</option>
                                <option value="紫外线">紫外线</option>
                                <option value="抗生素">抗生素</option>
                            </select>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" onclick="allergy_update()">
                                确定
                            </button>
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">
                                关闭
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


            <!-- 模态框（Modal）  for 查找既往病史症状-->
            <div class="modal fade" id="add_history_disease" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">×
                            </button>
                            <h4 class="modal-title" >
                                选择常见既往史
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search" id="input_history_disease">
                                        <span class="input-group-btn">
                                        <button type="submit" class="btn" onclick="search_history_disease()"><span class="fui-search"></span></button>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                </div>
                            </div>
                        </div>
                            <div id="search_history_disease_result">
                            </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">
                                关闭
                            </button>
                            <button type="button" class="btn btn-primary">
                                提交
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->




            <!-- 模态框（Modal）  for 查找主诉症状-->
            <div class="modal fade" id="add_Symptom" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">×
                            </button>
                            <h4 class="modal-title" >
                                选择常见主诉
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search" id="search_main_symptom">
                                        <span class="input-group-btn">
                                        <button type="submit" class="btn" onclick="search_main_symptom()"><span class="fui-search"></span></button>
                                        </span>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div id="search_symptom_result">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">
                                关闭
                            </button>
                            <button type="button" class="btn btn-primary">
                                提交
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <!-- 模态框（Modal）  for 初步诊断-->
            <div class="modal fade" id="add_diagnosis" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">×
                            </button>
                            <h4 class="modal-title" >
                                诊断
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">

                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search" id="input_diagnosis">
                                        <span class="input-group-btn">
                                        <button type="submit" class="btn" onclick="search_diagnosis()"><span class="fui-search"></span></button>
                                        </span>
                                    </div>
                                </div>

                            </div>


                        </div>
                        <div id="search_diagnosis_result">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">
                                关闭
                            </button>
                            <button type="button" class="btn btn-primary">
                                提交更改
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


            <!-- 模态框（Modal）  for 其他诊断-->
            <div class="modal fade" id="add_another_diagnosis" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">×
                            </button>
                            <h4 class="modal-title" >
                                诊断
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">

                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search" id="input_another_diagnosis">
                                        <span class="input-group-btn">
                                        <button type="submit" class="btn" onclick="search_another_diagnosis()"><span class="fui-search"></span></button>
                                        </span>
                                    </div>
                                </div>

                            </div>


                        </div>
                        <div id="search__another_diagnosis_result">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">
                                关闭
                            </button>
                            <button type="button" class="btn btn-primary">
                                提交更改
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel panel-heading">
                        <button type="button" class="btn btn-default">辅助决策</button>
                    </div>
                    <div class="panel panel-body>">

                    </div>
                </div>
            </div>

        </div>

        <div class="panel panel-default ">
            <div class="panel-body">
                    <div class="row ">
                        <div class="col-sm-1">

                        </div>
                        <div class="col-sm-4">
                            <div class="row">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="height" class="control-label">身高</label>
                                        <input type="text"  style="width: 35%"  id="height">
                                        <p class="form-control-static">Cm</p>
                                    </div>
                                </form>
                            </div>


                        </div>
                        <div class="col-sm-4">
                            <div class="row">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="weight" class="control-label">体重</label>
                                        <input type="text" style="width: 35%"     id="weight">
                                        <p class="form-control-static">Kg</p>
                                    </div>
                                </form>
                            </div>

                        </div>
                        <div class="col-sm-3">
                            <div class="row">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="width" class="control-label">腰围</label>
                                        <input type="text" style="width: 35%" id="width">
                                        <p class="form-control-static">Cm</p>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-1">

                        </div>
                        <div class="col-sm-4">
                            <div class="row">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="temperature" class="control-label">体温</label>
                                        <input type="text"  style="width: 35%" id="temperature">
                                        <p class="form-control-static">度</p>
                                    </div>
                                </form>
                            </div>

                        </div>
                        <div class="col-sm-4">
                            <div class="row">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="pulse" class="control-label">脉搏</label>
                                        <input type="text"  style="width: 35%" id="pulse">
                                        <p class="form-control-static">次/分</p>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="row">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="breath" class="control-label">呼吸</label>
                                        <input type="text" style="width: 35%" id="breath">
                                        <p class="form-control-static">次/分</p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-1">

                        </div>
                        <div class="col-sm-8">
                            <div class="row">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="RBloodPressure">血压</label>
                                        <input type="text"   style="width: 18%" id="RBloodPressure">
                                        <p class="form-control-static">/</p>
                                        <input type="text"   style="width: 18%" id="LBloddPressure">
                                        <p class="form-control-static">mmHg</p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                <div class="col-md-12">
                    <form class="form-horizontal" role="form" >
                        <div class="form-group">
                            <label for="MainSymptom" class=" col-md-2 control-label" style="color: orangered">*主诉</label>
                            <div class="col-md-6">
                                       <input type="text" class="form-control input-sm" id="MainSymptom"
                                               placeholder="...">
                            </div>
                            <div class="col-md-1">
                                <button type="button" class=" btn btn-sm btn-primary " onclick="add_symptom()">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>

                        </div>


                        <div class="form-group">
                            <label for="PhysicalExam" class="col-md-2 control-label" >体格检查</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control input-sm" id="PhysicalExam"
                                       placeholder="...">
                            </div>
                            <div class="col-md-1">
                                <button type="button" class=" btn btn-sm btn-primary " onclick="add_Symptom()">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="PhysicalExam" class="col-md-2 control-label" >检验检查</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control input-sm" id="InStrumentExam"
                                       placeholder="...">
                            </div>
                            <div class="col-md-1">
                                <button type="button" class=" btn btn-sm btn-primary " onclick="add_InStrumentExam()">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="FirstDiagnosis" class="col-md-2 control-label" style="color: orangered" >*初步诊断</label>
                            <div class="col-md-3">
                                <input type="text" class="form-control input-sm" id="FirstDiagnosis"
                                       placeholder="...">
                            </div>
                            <div class="col-md-1">
                                <button type="button" class=" btn btn-sm btn-primary " onclick="add_diagnosis()">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                            <label for="OtherDiagnosis" class="col-md-2 control-label" >其他诊断</label>
                            <div class="col-md-3">
                                <input type="text" class="form-control input-sm" id="OtherDiagnosis"
                                       placeholder="...">
                            </div>
                            <div class="col-md-1">
                                <button type="button" class=" btn btn-sm btn-primary " onclick="add_another_diagnosis()">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                    </form>

                </div>








            </div>
        </div>
    </div>

</div>



</body>
</html>
