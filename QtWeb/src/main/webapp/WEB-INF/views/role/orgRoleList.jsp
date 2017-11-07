<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>组织角色列表</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>组织角色列表</legend>
</fieldset>
<blockquote class="layui-elem-quote">组织角色列表</blockquote>
<div id="layTable1">

</div>

<script type="text/javascript" src="/static/frame/layui/layui.js"></script>
<script type="text/javascript" src="/static/frame/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/static/js/qt-tool.js"></script>
<script type="text/javascript" src="/static/js/layuiHelper.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'laydate'], function () {
        var $ = layui.jquery, form = layui.form(), layer = layui.layer, laydate = layui.laydate;
        var table1 = layuiHelper.LayTable();
        var Edit = function () {

        };
        var Delete = function () {

        };
        var tableInit = function () {
            table1.tablePanelID = "layTable1";
            table1.edit = "Edit";
            table1.delete = "Delete";
            table1.serverMode=true;
            table1.ajax.url = "/org/role/checkorgroleslist";
            table1.ajax.data ="";
            table1.checkBoxEnable = true;
            table1.seqEnable = false;
            table1.column = [
                {title:"角色等级",code:"roleLevel",width:60,valueDeal:function (value) {
                    if(value==0){
                        return "系统层";
                    }else if(value==1){
                        return "组织层";
                    }else if(value==2){
                        return "部门层";
                    }else{
                        return "未知";
                    }
                }},
                {title:"角色编码",code:"roleNo",width:80},
                {title:"角色名称",code:"roleName",width:80},
                {title:"创建时间",code:"createDatetime",width:100,valueDeal:function (value) {
                    return value;
                }}
            ];
            table1.ajaxInit();
            table1.createTable();
        };
        $(function () {
            tableInit();
        });
        if(table1.checkBoxEnable){
            //全选
            form.on('checkbox(allChoose)', function(data){
                var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                child.each(function(index, item){
                    item.checked = data.elem.checked;
                });
                form.render('checkbox');
            });
        }
    });
</script>
</body>
</html>
