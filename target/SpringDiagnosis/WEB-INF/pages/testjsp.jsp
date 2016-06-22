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

<!-- Static navbar -->
<div class="navbar navbar-default navbar-static-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
      </button>
      <a class="navbar-brand" href="#">Flat UI</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#contact">Contact</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li class="dropdown-header">Nav header</li>
            <li><a href="#">Separated link</a></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="../navbar/">Default</a></li>
        <li class="active"><a href="./">Static top</a></li>
        <li><a href="../navbar-fixed-top/">Fixed top</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-body">
    <form class="form-horizontal" role="form" >
      <div class="form-group col-md-12">
        <label for="height" class=" col-md-2 control-label" >身高</label>
        <div class="col-md-3">
          <input type="text" class="form-control" id="height"
                 placeholder="...">
        </div>
        <div class="col-md-1">
          cm
        </div>

        <label for="weight" class="col-md-2 control-label" >体重</label>
        <div class="col-md-3">
          <input type="text" class="form-control" id="weight"
                 placeholder="...">
        </div>
        <div class="col-md-2">
          kg
        </div>

        <label for="width" class="col-md-2 control-label" >腰围</label>
        <div class="col-md-3">
          <input type="text" class="form-control" id="width"
                 placeholder="...">
        </div>
        <div class="col-md-2">
          cm
        </div>

      </div>

      <form class="form-horizontal" role="form" >
        <div class="form-group col-md-12">
          <label for="height2" class=" col-md-2 control-label" >身高</label>
          <div class="col-md-3">
            <input type="text" class="form-control" id="height2"
                   placeholder="...">
          </div>
          <div class="col-md-1">
            cm
          </div>

          <label for="weight2" class="col-md-2 control-label" >体重</label>
          <div class="col-md-3">
            <input type="text" class="form-control" id="weight2"
                   placeholder="...">
          </div>
          <div class="col-md-2">
            kg
          </div>

          <label for="width2" class="col-md-2 control-label" >腰围</label>
          <div class="col-md-3">
            <input type="text" class="form-control" id="width2"
                   placeholder="...">
          </div>
          <div class="col-md-2">
            cm
          </div>

        </div>
      <div class="form-group">
        <label for="PhysicalExam" class="col-md-2 control-label" >体格检查</label>
        <div class="col-md-6">
          <input type="text" class="form-control" id="PhysicalExam"
                 placeholder="...">
        </div>
        <div class="col-md-1">
          <button type="button" class=" btn btn-primary " onclick="add_Symptom()">
            <span class="glyphicon glyphicon-plus"></span>
          </button>
        </div>
      </div>
      <div class="form-group">
        <label for="FirstDiagnosis" class="col-md-2 control-label" style="color: orangered" >*初步诊断</label>
        <div class="col-md-3">
          <input type="text" class="form-control" id="FirstDiagnosis"
                 placeholder="...">
        </div>
        <div class="col-md-1">
          <button type="button" class=" btn btn-primary " onclick="add_diagnosis()">
            <span class="glyphicon glyphicon-plus"></span>
          </button>
        </div>
        <label for="OtherDiagnosis" class="col-md-2 control-label" >其他诊断</label>
        <div class="col-md-3">
          <input type="text" class="form-control" id="OtherDiagnosis"
                 placeholder="...">
        </div>
        <div class="col-md-1">
          <button type="button" class=" btn btn-primary " onclick="add_diagnosis()">
            <span class="glyphicon glyphicon-plus"></span>
          </button>
        </div>
      </div>
    </form>
  </div>

</div>



<!-- 模态框（Modal） -->



</body>
</html>			