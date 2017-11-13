<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>组织交易列表</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/frame/datatables/jquery.dataTables.min.css">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>组织交易列表</legend>
</fieldset>
<blockquote class="layui-elem-quote">组织交易列表</blockquote>
<div id="dt_trade" class="dt_wrapper">
    <div class="my-btn-box dtToolBar">
        <span class="fl">
            <div class="layui-btn-group">
                <button class="layui-btn btnAdd">新增</button>
                <button class="layui-btn layui-btn-disabled btnCheck">查看</button>
                <button class="layui-btn layui-btn-disabled btnEdit">修改</button>
                <button class="layui-btn layui-btn-danger layui-btn-disabled btnDelete">删除</button>
            </div>
        </span>
        <span class="fr">
        <span class="layui-form-label">搜索条件：</span>
        <div class="layui-input-inline">
            <input id="input_search" type="text" autocomplete="off" placeholder="搜索交易编码或名称" class="layui-input">
        </div>
        <button id="btn_table_search" class="layui-btn mgl-20">查询</button>
    </span>
    </div>
    <table class="layui-table dateTable">
        <thead>
        <tr>
            <th><input type="checkbox" class="my-checkbox"/></th>
            <th>交易编码</th>
            <th>客户</th>
            <th>产品</th>
            <th>模块</th>
            <th>点数</th>
            <th>金额</th>
            <th>服务期</th>
            <th>序列号</th>
            <th>CD-Key</th>
            <th>特征码</th>
            <th>加密方式</th>
            <th>凭证纸行</th>
            <th>交易日期</th>
        </tr>
        </thead>
    </table>
</div>
<script type="text/javascript" src="/static/frame/layui/layui.js"></script>
<script type="text/javascript" charset="utf8" src="/static/frame/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/static/frame/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/static/js/table-tool.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer'], function () {
        var $ = layui.jquery, form = layui.form, layer = layui.layer;
        var table;
        var initDT = function (searchString) {
            return $(".dateTable").DataTable(dtConf1({
                "url": "/tra/org/checktralist",
                "pages": 5,
                "orderColumn": 1,
                "data": {
                    "searchString": searchString
                },
                "createdRow": function (row, data, dataIndex) {
                    var value = data[1];
                    row.children[0].innerHTML = getDtCheckboxString(value);
                }
            }));
        };
        table = initDT();
        $("#btn_table_search").on("click", function () {
            if (table)
                table.destroy();
            table = initDT($("#input_search").val());
        });
    });
</script>
</body>
</html>
