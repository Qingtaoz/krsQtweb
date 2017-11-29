<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>组织部门列表</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/frame/datatables/jquery.dataTables.min.css">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>组织部门列表</legend>
</fieldset>
<blockquote class="layui-elem-quote">组织部门列表</blockquote>
    <table id="dtDeptList" lay-filter="test">

    </table>
<script type="text/javascript" src="/static/frame/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer','table'], function () {
        var $ = layui.jquery, form = layui.form, layer = layui.layer,table = layui.table;
        table.render({
            elem:'#dtDeptList',
            cols: [[
                {checkbox: true,field:'deptid',title:'ID'}, //其它参数在此省略
                {field:'deptno',title:'部门编码',width:'100'},
                {field:'deptname',title:'部门名称',width:'120'},
                {title:'操作', fixed: 'right', width:150, align:'center', toolbar: '#barDemo'}
                ]],
            page:true,
            url:'/org/dept/getdeptlist',
            done:function (resp, curr, count) {
                var i=0;
            }
        });
    });
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-mini" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>

    <!-- 这里同样支持 laytpl 语法，如： -->
    <%--{{#  if(d.auth > 2){ }}--%>
    <a class="layui-btn layui-btn-mini" lay-event="check">审核</a>
    <%--{{#  } }}--%>
</script>
</body>
</html>
