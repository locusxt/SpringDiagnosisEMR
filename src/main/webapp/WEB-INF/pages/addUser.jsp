<%--
  Created by IntelliJ IDEA.
  User: daibinding
  Date: 15/10/15
  Time: 上午9:34
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <title>SpringMVC 添加用户</title>
  <!-- 新 Bootstrap 核心 CSS 文件 -->
  <link rel="stylesheet" href="../static/css/bootstrap.css">
  <link rel="stylesheet"  href="../static/css/bootstrap-theme.css">
  <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
  <script src="../static/js/jquery-1.11.3.js"></script>
  <script src="../static/js/bootstrap.js"></script>
  <![endif]-->
</head>
<body>
<div class="container">
  <h1>SpringMVC 添加用户</h1>
  <hr/>
  <form:form action="/adduserPost" method="post" commandName="user" role="form">
    <div class="form-group">
      <label for="name">name:</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name:"/>
    </div>

    <div class="form-group">
      <label for="password">Password:</label>
      <input type="text" class="form-control" id="password" name="password" placeholder="Enter Password:"/>
    </div>
    <div class="form-group">
      <button type="submit" class="btn btn-sm btn-success">提交</button>
    </div>
  </form:form>
</div>


</body>
</html>
