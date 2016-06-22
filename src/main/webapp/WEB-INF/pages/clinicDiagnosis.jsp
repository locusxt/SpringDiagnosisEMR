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




    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->

    <script src="../static/js/jquery-1.11.3.js"></script>
    <script src="../static/flatui/flat-ui.min.js"></script>
</head>
<body>
<div class="text-center">
    <h1>门诊医生工作站</h1>
</div>

<div class="row"><nav class="navbar navbar-inverse" role="navigation">
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
                <li><a href="">${username}</a></li>
                <li><a href="">打印</a></li>
                <li><a href="">诊断</a></li>

            </ul>


        </div>
    </div>
</nav>
</div>

<div class="row">
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover">
                    <caption>候诊病人</caption>
                    <thead>
                    <tr>
                        <th>挂号单</th>
                        <th>门诊号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>费用类型</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>100</td>
                        <td>16012001</td>
                        <td>张三</td>
                        <td>男</td>
                        <td>23</td>
                        <td>公费</td>
                    </tr>
                    <tr>
                        <td>101</td>
                        <td>16012002</td>
                        <td>司马光</td>
                        <td>女</td>
                        <td>48</td>
                        <td>自费</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover">
                    <caption>正在就诊病人</caption>
                    <thead>
                    <tr>
                        <th>挂号单</th>
                        <th>门诊号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>费用类型</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>99</td>
                        <td>16012000</td>
                        <td>张宇</td>
                        <td>男</td>
                        <td>11</td>
                        <td>自费</td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-8">
        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form class="form-horizontal">
                            <div class="form-group form-group-sm">
                                <label class="col-sm-2 control-label"  for="patientName">姓名</label>
                                <div class="col-sm-2">
                                    <input class="form-control" type="text" value="张宇" id="patientName"  readonly>
                                </div>
                                <label class="col-sm-2 control-label" for="patientAge">年龄</label>
                                <div class="col-sm-2">
                                    <input class="form-control" type="text" value="11" id="patientAge"  readonly>
                                </div>
                                <label class="col-sm-2 control-label" for="payType">付费类型</label>
                                <div class="col-sm-2">
                                    <input class="form-control" type="text" value="自费" id="payType" readonly>
                                </div>
                            </div>

                            <div class="form-group form-group-sm">
                                <label class="col-sm-2 control-label" for="diagnosisID">门诊号</label>
                                <div class="col-sm-2">
                                    <input class="form-control" type="text" value="16012000" id="diagnosisID" readonly>
                                </div>
                                <label class="col-sm-2 control-label" for="payID">挂号单</label>
                                <div class="col-sm-2">
                                    <input class="form-control" type="text" value="99" id="payID" readonly>
                                </div>
                                <label class="col-sm-2 control-label" for="patientIndex">索引</label>
                                <div class="col-sm-2">
                                    <input class="form-control" type="text" value="1001" id="patientIndex" readonly>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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

        <div class="panel panel-default">
            <div class="panel-body">
                <form role="form">
                    <div class="form-group">
                        <label for="diagnosisHistory">既往史</label>
                        <button type="button" class="btn btn-default">添加</button>
                        <button type="button" class="btn btn-default">删除</button>
                        <textarea class="form-control" rows="3" id="diagnosisHistory"></textarea>
                    </div>
                </form>
                <form role="form">
                    <div class="form-group">
                        <label for="symptom">患者主诉</label>
                        <button type="button" class="btn btn-default">添加</button>
                        <button type="button" class="btn btn-default">删除</button>
                        <textarea class="form-control" rows="3" id="symptom"></textarea>
                    </div>
                </form>
                <form role="form">
                    <div class="form-group ">
                        <label for="physicalSign">体征描述</label>
                        <button type="button" class="btn btn-default">添加</button>
                        <button type="button" class="btn btn-default">删除</button>
                        <button type="button" class="btn btn-default">申请</button>
                        <textarea class="form-control" rows="3" id="physicalSign"></textarea>
                    </div>
                </form>
                <form role="form">
                    <div class="form-group">
                        <label for="labExam">实验学&影像学检查</label>
                        <button type="button" class="btn btn-default">添加</button>
                        <button type="button" class="btn btn-default">删除</button>
                        <button type="button" class="btn btn-default">申请</button>
                        <textarea class="form-control" rows="3" id="labExam"></textarea>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
</body>
</html>