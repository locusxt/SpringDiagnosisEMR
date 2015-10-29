<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <title>SpringMVC Demo 首页</title>

  <!-- 新 Bootstrap 核心 CSS 文件 -->
  <link rel="stylesheet" href="../static/css/bootstrap.css">
  <link rel="stylesheet"  href="../static/css/jquery-ui-1.10.4.custom.css">
  <style>
    .bg{background: url(../static/img/baiyunback.png)}
  </style>
  <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
  <script src="../static/js/jquery-1.11.3.js"></script>
  <script src="../static/js/jquery-ui-1.10.4.custom.js"></script>



  <script type="text/javascript">
    $(function() {
      $( "#dialog-form" ).dialog({
        autoOpen: false,
        buttons:{
          "Register": function(){
            $("#register-form").submit();
            $(this).dialog("close");
          },
          "Cancel": function(){
          $(this).dialog("close");
          }
        }
      });

      $( "#create-user" ).click(function() {
        $( "#dialog-form" ).dialog( "open" );
      });

    });

    function doctor(){
      document.loginform.action="/knowledge";
      document.loginform.submit();
    }
    function patient()
    {
      document.loginform.action="/diagnosis";
      document.loginform.submit();
    }
  </script>
</head>


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
        <button id="create-user" type="button" class="btn btn-link">注册</button>
        <li><a href="">建议</a></li>
        <li><a href="">关于</a></li>
      </ul>

    </div>
  </div>
</nav>
<body class="bg">

  <div class="container">
    <div class="row">

    </div>
    <div class="row">

    </div>
    <div class="row">

    </div>

    <div class="row">
      <div class="col-md-5"></div>
      <div class="col-md-3"></div>
      <div class="col-md-3">
        <div class="panel panel-info ">
          <div class="panel-heading">
            <h1 class="panel-title" align="center">医疗宝</h1>
          </div>
          <div class="panel-body">
            <form  name="loginform"  method="post" role="form">
              <div class="form-group">
                <label for="usernameid">EmailAccount:</label>
                <input type="text" class="form-control" id="usernameid" name="username" placeholder="Enter Name:"/>
              </div>

              <div class="form-group">
                <label for="passwordid">Password:</label>
                <input type="password" class="form-control" id="passwordid" name="password" placeholder="Enter Password:"/>
              </div>
              <div class="form-group">
                <button type="button" class="btn btn-primary btn-lg" onclick="doctor()">
                  我是医生
                </button>
                <button type="button" class="btn btn-primary btn-lg" onclick="patient()">
                  我来就诊
                </button>
              </div>
            </form>
          </div>
      </div>

      </div>

        <div id="dialog-form" title="Register">
          <form id= "register-form" action="/register" method="post" >
            <fieldset>
              <label for="Regname">用户名</label>
              <input type="text" name="username" id="Regname" class="form-control">
              <label for="Regpassword">密码</label>
              <input type="password" name="password" id="Regpassword"  class="form-control">

            </fieldset>
          </form>
        </div>
    </div>
</div>





<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->

</body>
</html>