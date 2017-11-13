<%--
  Created by IntelliJ IDEA.
  User: Slash
  Date: 2017/5/18
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.qt.webframe.system.common.SysParams" %>
<%@ page import="com.qt.webframe.system.pojoweb.WebMenu" %>
<%@ page import="java.util.List" %>
<%@ page import="com.qt.webframe.system.session.UserSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    UserSession userSession = ((UserSession) session.getAttribute(SysParams.CURRENT_USER));
    List<WebMenu> menus = userSession.getMenus();
    String userNickName = userSession.getUserNickName();
    StringBuilder sbMenuTop = new StringBuilder();
    StringBuilder sbMenuLeft = new StringBuilder();
    Boolean bm1 = true;
    for (WebMenu wm1 :
            menus) {
        if (bm1) {
            sbMenuTop.append("            <li class=\"layui-nav-item layui-this\" data-menuid=\"" + wm1.getId() + "\">\n" +
                    "                <a href=\"javascript:;\" >" + wm1.getName() + "</a>\n" +
                    "            </li>");
            sbMenuLeft.append("                <div class=\"submenus\" data-menuid=\"" + wm1.getId() + "\">");

        } else {
            sbMenuTop.append("            <li class=\"layui-nav-item\" data-menuid=\"" + wm1.getId() + "\">\n" +
                    "                <a href=\"javascript:;\" >" + wm1.getName() + "</a>\n" +
                    "            </li>");
            sbMenuLeft.append("                <div class=\"submenus none\" data-menuid=\"" + wm1.getId() + "\">");
        }
        for (WebMenu wm2 :
                wm1.getSubMenus()) {
            sbMenuLeft.append("                <li class=\"layui-nav-item layui-nav-itemed\" >\n" +
                    "                    <a href=\"javascript:;\">" + wm2.getName() + "</a>\n" +
                    "                    <dl class=\"layui-nav-child\">");
            for (WebMenu wm3 :
                    wm2.getSubMenus()) {
                sbMenuLeft.append("                        <dd><a href=\"javascript:;\" href-url=\"" + wm3.getUrl() + "\">" + wm3.getName() + "</a>\n" +
                        "                        </dd>");
            }
            sbMenuLeft.append("                    </dl>\n" +
                    "                </li>");
        }
        sbMenuLeft.append("                </div>");
        bm1 = false;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>主页</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="icon" href="/static/image/code.png">
</head>
<body>

<!-- admin -->
<div class="layui-layout layui-layout-admin"> <!-- 添加skin-1类可手动修改主题为纯白，添加skin-2类可手动修改主题为蓝白 -->
    <!-- header -->
    <div class="layui-header my-header">
        <a href="index.html">
            <!--<img class="my-header-logo" src="/static/" alt="logo">-->
            <div class="my-header-logo">金日盛CRM</div>
        </a>
        <div class="my-header-btn">
            <button class="layui-btn layui-btn-small btn-nav"><i class="layui-icon">&#xe654;</i></button>
        </div>
        <ul class="layui-nav" lay-filter="side-left">
            <%=sbMenuTop.toString()%>
        </ul>
        <ul class="layui-nav my-header-user-nav" lay-filter="side-right">
            <li class="layui-nav-item">
                <a class="name" href="javascript:;"><i class="layui-icon">&#xe629;</i>主题</a>
                <dl class="layui-nav-child">
                    <dd data-skin="0"><a href="javascript:;">默认</a></dd>
                    <dd data-skin="1"><a href="javascript:;">纯白</a></dd>
                    <dd data-skin="2"><a href="javascript:;">蓝白</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a class="name" href="javascript:;"><%=userNickName%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a class="btn-logout" href="#"><i class="layui-icon">&#x1006;</i>退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <!-- side -->
    <div class="layui-side my-side">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="side">
                <%=sbMenuLeft.toString()%>
            </ul>
        </div>
    </div>
    <!-- body -->
    <div class="layui-body my-body">
        <div class="layui-tab layui-tab-card my-tab" lay-filter="card" lay-allowClose="true">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="0"><span>欢迎页</span></li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe id="iframe" src="<%=basePath%>sys_welcome.html" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <div class="layui-footer my-footer">
        <p>2017 © 沈阳金日盛软件科技有限公司</p>
    </div>
</div>
<script type="text/javascript" src="/static/frame/layui/layui.js"></script>
<script type="text/javascript" src="/static/js/main.js"></script>
<script type="text/javascript">
    layui.use(['element', 'layer'], function () {
        var $ = layui.jquery, element = layui.element, layer = layui.layer;
        $(".btn-logout").on("click", function () {
            $.post("/sys/logout", function (json, status) {
                if (status == "success") {
                    layer.msg(json.msg);
                    if (json.code == "200") {
                        setTimeout(function () {
                            location.href = "<%=basePath%>" + json.jumpUrl;
                        }, 2000);
                    }
                    return false;
                }
                layer.msg(status);
                setTimeout(function () {
                    location.href = "<%=basePath%>sys_403.html";
                }, 2000);
            }, "json");
        });
    })
</script>
</body>
</html>
