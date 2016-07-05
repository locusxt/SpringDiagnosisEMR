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
<script type="text/javascript">

    var order_data='${patientKey}';
    order_data_json = eval("(" + order_data + ")");
    console.log(order_data_json);
    var drug;

    /*
    var drug=[
        {"id": 1, "name": "维生素C","type":"inject","specific":"500mg 2支","producer":"","prize":"5.0"},
        {"id": 2, "name": "布洛芬悬液","type":"oral","specific":"100ml 2g/瓶","producer":"","prize":"18.5"},
        {"id": 3, "name": "xy","type":"physican","specific":"10mg:2g/支","producer":"","prize":"33.0"},
        {"id": 4, "name": "维生素B","type":"inject","specific":"200mg 2支","producer":"","prize":"21"}
    ];

    var patients=[
        {"id": 1, "name": "张三","gender":"男","age":"25","clinicId":"20160424001","IdNumber":"510234199211230040"},
        {"id": 2, "name": "李四","gender":"男","age":"23","clinicId":"20160424002","IdNumber":"5102341992112300030"},
        {"id": 3, "name": "qingzi","gender":"女","age":"21","clinicId":"20160424003","IdNumber":"510234199211230041"},
        {"id": 4, "name": "qingzi1","gender":"女","age":"21","clinicId":"20160424003","IdNumber":"510234199211230041"}
    ];
    var disease= [
        {"id":1,"name":"糖尿病"},
        {"id":2,"name":"高血压"},
        {"id":3,"name":"感冒"},
        {"id":4,"name":"中风"},
        {"id":5,"name":"发烧"},
        {"id":6,"name":"中草"},

    ];
    */



    function Search_clinic_id()
    {
        $('#search_clinic_id').modal('show');
    };

    function add_diagnosis() {
        $("#add_diagnosis").modal('show');
    };




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
                if(item.drug_name.indexOf(search_text)!=-1){
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


    function search_diagnosis()
    {
        var search_text=$("#input_diagnosis").val();
        if (search_text!="")
        {
            var tab="<table class='table table-bordered'><tr align='center'>" +
                            "<td>"+"初步诊断"+"</td>"+
                            "</tr>"
                    ;
            $.each(disease,function(id, item){
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

    var i=1;
    function druginfo_update(obj)
    {

        var name=$(obj).parent().parent().children("td").eq(0).text();
        var specific=$(obj).parent().parent().children("td").eq(1).text();

        result ="<tr style='background-color: #5bc0de' align='center' >" +
                "<td ><input type='text' class='form-control flat' style=' background-color: #5bc0de'></td>"+  //序
                //"<td ><input type='text' class='form-control flat' style=' background-color: #00a1cb'>" +"</td>" + //组
                "<td ><input type='text'  style=' width:auto; background-color: #5bc0de' class='form-control flat'>" +"</td>" + //药品名称
                "<td><input type='text' class='form-control flat' style='  background-color: #5bc0de'  >" +"</td>" +       //每次
                "<td><select style='width: auto; background-color: #5bc0de' class='form-control flat'> <option>g</option> <option>袋</option> <option>盒</option> </select> "+"</td>" +  //量
                "<td><select style='width: auto; background-color: #5bc0de' class='form-control flat'> <option>每日一次</option> <option>每日两次</option> <option>每日三次</option> </select> "+"</td>" +         //频率
                "<td><input type='text' class='form-control flat' style='  background-color: #5bc0de'> "+"</td>" +         //天数
                "<td><select style='width: auto; background-color: #5bc0de' class='form-control flat'> <option>口服</option> <option>含服</option><option>皮试</option> </select>"+"</td>" +         //用法
                "<td><input type='text' class='form-control flat' style=' background-color: #5bc0de'> "+"</td>" +         //总量
                "<td><select style='width: auto; background-color: #5bc0de' class='form-control flat'> <option>g</option> <option>袋</option> <option>盒</option></select> "+"</td>" +         //单位
               // "<td><input type='text' class='form-control flat' style='background-color: #00a1cb'> "+"</td>" +       //嘱托
                "<td><button type='button'  style='background-color: #5bc0de' class='btn  btn-sm form-control flat' onclick='deleteDrug(this)' ><span class='glyphicon glyphicon-trash'></button> "+"</td>" +       //操作
                "</tr>";
        $("#drug_use ").append(result);
        //console.log(result);
        $("#drug_use tr:last ").children("td").eq(1).children("input").val(name);
        $("#drug_use tr:last ").children("td").eq(0).children("input").val(i);
        i++;


    };

    function deleteDrug(obj) {
        console.log($(obj).parent().parent().text());
        var line=$(obj).parent().parent();
        line.remove();


    }
    function finish_diagnosis()
    {

        var clinic_id_number=$("#patient_clinic_id").val();
        var drug_list=$("#drug_use").children("tbody").children("tr");
        var patient_record_drug="";
        for(var k=0;k<drug_list.length;k++)
        {
            var tdArray=drug_list.eq(k).find("td");
            var drug_name=tdArray.eq(1).val();
            patient_record_drug=patient_record_drug+drug_name+",";

        }
        var order_info={"clinicId":clinic_id_number,"drug":patient_record_drug};


        $.ajax({
            type: 'POST',
            url: "ajax/finish_diagnosis",
            data: JSON.stringify (order_info), // or JSON.stringify ({name: 'jonas'}),
            success: function(d) { alert('data: ' + d); },
            contentType: "application/json",
            dataType: 'json'
        });
        console.log("diagnosis finish");
        window.location.href="/clinicDiagnosis/";
    }

    function search_drug()
    {
        var search_text=$("#search_drug").val();

        if (search_text!="")
        {
            {
                var tab="<table class='table table-bordered'><tr>" +
                                "<td>"+"药品名称"+"</td>"+
                                "<td>"+"规格"+"</td>"+
                                "<td>"+"厂家"+"</td>"+
                                "<td>"+"单价"+"</td>"+
                                "</tr>"
                        ;
                $.each(drug,function(id, item){
                    //如果包含则为table赋值
                    if(item.drug_name.indexOf(search_text)!=-1){
                        tab+="<tr align='center' ><td> <button class='btn btn-sm btn-link' onclick='druginfo_update(this)'>" +
                                ""+item.drug_name+"" + "</button> </td>" +
                                "<td>" +item.drug_spec+"</td>" +
                                "<td>"+item.drug_produce_company+"</td>" +
                                "<td>"+item.drug_per_prize+"</td>" +
                                "</tr>";
                    }
                });
                tab+="</tab>";
                $("#search_drug_result").html(tab);
                console.log("test");
            }
        }
        else
        {
            $("#search_drug_result").text("no relevant data");
        }

    };
    //页面加载
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
        if(order_data)
        {
            var dataArray=eval(order_data_json);
            $("#patient_name").val(dataArray.name);
            $("#patient_age").val(dataArray.age);
            $("#patient_gender").val(dataArray.gender);
            $("#patient_clinic_id").val(dataArray.clinic_id);
            console.log("finished");
        }

        $.ajax({
            //解析从后台返回的json数据
            url:"/post_drug_metadata",
            type:"post",
            success:function(data){
                drug = JSON.parse(data);
                //console.log(data_json);
                //console.log(drug);


            }
        });


    });

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
                <li><a href="../navbar-fixed-top/">版权</a></li>
                <li class="active"><a href="./">个人中心</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>



    <div class="col-md-12">

        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <p>
                    <div class="btn-toolbar">
                        <div class="btn-group">
                            <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-refresh">清空</span></button>
                            <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-save-file">保存</span></button>
                            <button class="btn btn-primary btn-sm" onclick="finish_diagnosis()"><span class="glyphicon glyphicon-ok">完诊</span></button>
                            <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-trash">作废</span></button>
                        </div>
                    </div>
                    </p>
                    <h4 class="text-center">普通处方签</h4>
                    <div class="panel-body">
                        <table class="table table-bordered table-striped">
                            <tbody>
                            <tr>
                                <td style="width: 20%">姓名</td>
                                <td style="width: 30%"><input type="text" placeholder="..." class="form-control flat" id="patient_name"/></td>
                                <td style="width: 20%">年龄</td>
                                <td style="width: 30%"><input type="text" placeholder="..." class="form-control flat" id="patient_age"/></td>
                            </tr>

                            <tr>
                                <td style="width: 20%">联系电话</td>
                                <td style="width: 30%"><input type="text" placeholder="..." class="form-control flat" id="patient_tel" /></td>
                                <td style="width: 20%">性别</td>
                                <td style="width: 30%"><input type="text" placeholder="..." class="form-control flat" id="patient_gender"/></td>

                            </tr>
                            </tbody>
                        </table>

                        <table class="table table-bordered table-striped table-condensed">
                            <tr>
                                <td style="width: 20%">医保卡号</td>
                                <td ><input type="text" placeholder="..." class="form-control flat" /></td>
                            </tr>
                            <tr>
                                <td>诊疗卡号</td>
                                <td>  <div class="row">
                                    <div class="col-md-8">
                                        <input type="text" placeholder="..." class="form-control flat" id="patient_clinic_id"/>
                                    </div>
                                    <div class="col-md-2">
                                        <button class="btn btn-sm btn-primary"    onclick="Search_clinic_id()"  >
                                            查找
                                        </button>
                                    </div>

                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td>初步诊断</td>
                                <td>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <input type="text" placeholder="..." class="form-control flat" />
                                        </div>
                                        <div class="col-md-2">
                                            <button class="btn btn-sm btn-primary" onclick="add_diagnosis()">
                                                添加
                                            </button>
                                        </div>

                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td>医嘱</td>
                                <td>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <input type="text" placeholder="..." class="form-control flat" />
                                        </div>
                                        <div class="col-md-2">
                                            <button class="btn btn-sm btn-primary" onclick="add_Disease()" >
                                                添加
                                            </button>
                                        </div>

                                    </div>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                        <div class="jumbotron " style="background-color: white">
                                <table class='table table-condensed'>
                                        <thead>
                                        <tr>
                                            <td>序</td>
                                            <td>药品名称</td>
                                            <td>每次</td>
                                            <td>量</td>
                                            <td>频率</td>
                                            <td>天数</td>
                                            <td>用法</td>
                                            <td>总量</td>
                                            <td>单位</td>
                                            <td>操作</td>
                                        </tr>
                                        </thead>

                                    <tbody id="drug_use">

                                    </tbody>
                                </table>

                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading">西药项目</div>
                    <div class="panel-body">
                        <table class="table table-bordered table-striped">
                            <tr>
                                <td >药品检索</td>
                                <td style="width: 75%">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search" id="search_drug">
                                     <span class="input-group-btn">
                                     <button type="button"  onclick="search_drug()" class="btn btn-primary"><span class="fui-search" ></span></button>
                                     </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>药品类型</td>
                                <td>
                                    <div class="form-group">
                                        <select multiple class="form-control" id="drug_type">
                                            <option>全部</option>
                                            <option>注射药</option>
                                            <option>口服药</option>
                                            <option>外用药</option>
                                            <option>其他</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div id="search_drug_result">
                            <table class="table table-bordered " >
                                <tr>
                                    <td>药品名称</td>
                                    <td>规格</td>
                                    <td>厂家</td>
                                    <td>单价</td>
                                </tr>
                            </table>
                        </div>
                    </div>
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

                    <p></p>


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

                        <input type="text" class="input-medium search-query" id="input_diagnosis">
                        <button class="btn btn-primary"  onclick="search_diagnosis()">检索</button>

                    </div>
                    <div id="search_diagnosis_result">

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


</body>
</html>