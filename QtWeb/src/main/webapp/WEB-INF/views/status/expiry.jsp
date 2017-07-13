<%--
  Created by IntelliJ IDEA.
  User: Slash
  Date: 2017/6/12
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录超时</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>登录超时</legend>
</fieldset>
<blockquote class="layui-elem-quote">请重新登录</blockquote>
</body>
<script type="text/javascript" src="/static/frame/layui/layui.js"></script>
<script>
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.msg("登录超时，请重新登录。")
        setTimeout(function () {
            window.parent.location.href = "/login.html";
        }, 2000);
    });
</script>
</html>
