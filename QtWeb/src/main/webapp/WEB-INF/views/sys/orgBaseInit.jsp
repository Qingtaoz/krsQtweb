<%@ page import="com.qt.webframe.system.common.SysParams" %>
<%@ page import="com.qt.webframe.system.session.UserSession" %>
<%@ page import="java.io.PrintWriter" %>
<%--
  Created by IntelliJ IDEA.
  User: Slash
  Date: 2017/5/31
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (((UserSession)session.getAttribute(SysParams.CURRENT_USER)).getOrgName()!=null){
        PrintWriter writer = response.getWriter();
        writer.print("<html><script>window.location.href=\"/status_success.html\";</script></html>");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>基础信息设置</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="icon" href="/static/image/code.png">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>创建一个组织并分配管理员用户</legend>
</fieldset>
<blockquote class="layui-elem-quote">创建一个组织并分配管理员用户</blockquote>
<form id="orgAndManger" class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">组织名称</label>
        <div class="layui-input-inline">
            <input type="text" name="orgName" placeholder="请输入组织名称" lay-verify="orgName"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="mangerName" placeholder="请输入用户名" lay-verify="managerName"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="managerPassWord" placeholder="请输入密码" lay-verify="managerPassWord"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">昵称</label>
        <div class="layui-input-inline">
            <input type="text" name="managerNickName" placeholder="请输入昵称" lay-verify="managerNickName"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="sub">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="/static/frame/layui/layui.js"></script>
<script type="text/javascript" src="/static/js/qt-tool.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer'], function () {
        var $ = layui.jquery, form = layui.form(), layer = layui.layer;
        form.verify({
            'orgName': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "组织名称不能为空"
                }
            },
            'managerName': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "管理者用户名不能为空"
                }
            },
            'managerPassWord': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "管理者密码不能为空"
                }
            },
            'managerNickName': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "管理者昵称不能为空"
                }
            }
        });
        // 提交监听
        form.on('submit(sub)', function (data) {
            $.post("/sys/org/addorgandmanager", {data:JSON.stringify(data.field)}, function (json, status) {
                if (status == "success") {
                    layer.msg(json.msg);
                    if (json.code == "200") {
                        setTimeout(function () {
                            location.href = json.jumpUrl;
                        }, 2000);
                    }
                    return false;
                }
            }, "json").error(function (response) {
                if (response.getResponseHeader("errCode") == "402"){
                    layer.msg(response.getResponseHeader("errMsg"));
                    setTimeout(function () {
                        window.parent.location.href = "/login.html";
                    },2000);
                    return false;
                }
                if (response.getResponseHeader("errCode") == "403"){
                    layer.msg(response.getResponseHeader("errMsg"));
                    setTimeout(function () {
                        location.href = "/sys_403.html";
                    },2000);
                    return false;
                }
            });
            return false;
        })
    })
</script>
</body>
</html>

