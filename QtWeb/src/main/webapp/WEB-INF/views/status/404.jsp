<%--
Created by IntelliJ IDEA.
User: Slash
Date: 2017/5/18
Time: 22:33
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>404 你要的页面已经找不到了~</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="icon" href="/static/image/code.png">
</head>
<body class="body">

<div class="my-page-box">
    <h3>404</h3>
    <p class="msg">Page Not Found</p>
    <p class="text">对不起,没有找到您所需要的页面,可能是URL不确定,或者页面已被移除。</p>
    <div class="my-btn-box">
        <a class="layui-btn layui-btn-small" href="javascript:;">返回首页</a>
        <a class="layui-btn layui-btn-danger layui-btn-small " href="javascript:;">返回上页</a>
    </div>
</div>


<script type="text/javascript" src="/static/frame/layui/layui.js"></script>
<script type="text/javascript">

</script>
</body>
</html>