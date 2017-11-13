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
    <title>欢迎</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="icon" href="/static/image/code.png">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>欢迎使用金日盛CRM 1.0</legend>
</fieldset>
<blockquote class="layui-elem-quote">系统信息说明</blockquote>
<div class="layui-collapse" lay-accordion="" lay-filter="collapse">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">软件信息</h2>
        <div class="layui-colla-content layui-show">
            <table class="layui-table">
                <tr>
                    <td width="40%">软件名称</td>
                    <td width="60%">金日盛CRM</td>
                </tr>
                <tr>
                    <td>系统版本</td>
                    <td>v0.1</td>
                </tr>
                <tr>
                    <td>联系人</td>
                    <td>Qingtao</td>
                </tr>
                <tr>
                    <td>官网</td>
                    <td>暂无</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">服务器信息</h2>
        <div class="layui-colla-content">
            <table class="layui-table">
                <tr>
                    <td width="40%">服务器域名</td>
                    <td width="60%"></td>
                </tr>
                <tr>
                    <td>服务器标识</td>
                    <td></td>
                </tr>
                <tr>
                    <td>服务器操作系统</td>
                    <td></td>
                </tr>
                <tr>
                    <td>服务器解译引擎</td>
                    <td></td>
                </tr>
                <tr>
                    <td>服务器语言</td>
                    <td></td>
                </tr>
                <tr>
                    <td>服务器端口</td>
                    <td></td>
                </tr>
                <tr>
                    <td>服务器主机名</td>
                    <td></td>
                </tr>
                <tr>
                    <td>站点名称</td>
                    <td></td>
                </tr>
                <tr>
                    <td>目录物理路径</td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">数据库信息</h2>
        <div class="layui-colla-content">
            <table class="layui-table">
                <tr>
                    <td width="40%">数据库版本</td>
                    <td width="60%"></td>
                </tr>
                <tr>
                    <td>数据库名称</td>
                    <td></td>
                </tr>
                <tr>
                    <td>数据库大小</td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript" src="/static/frame/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['layer','element'], function () {
        var layer = layui.layer, element = layui.element;

        //监听折叠
        element.on('collapse(collapse)', function(data){
            layer.msg('展开状态：'+ data.show);
        });

        // you code ...


    });
</script>
</body>
</html>