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
<button id="btnInit" class="layui-btn layui-btn-primary">ok</button>
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
        var Message = layuiHelper.LayerMsg();
        var Edit = function () {
            table1.createEditMode();
        };
        var Delete = function () {

        };
        var SelectDataByPageIndex = function (PageIndex) {
            //每次查询获得的数据集--当前页的数据
            var Data = [
                {Name: "张三", Sex: "1", Sex1: "1", Sex2: "1", Age: "15", Record: "测试"},
                {Name: "李四", Sex: "1", Sex1: "1", Sex2: "1", Age: "18", Record: "测试"},
                {Name: "王五", Sex: "1", Sex1: "1", Sex2: "1", Age: "26", Record: "测试"},
                {Name: "韩梅梅", Sex: "0", Sex1: "1", Sex2: "1", Age: "16", Record: "测试"},
                {Name: "张三", Sex: "1", Sex1: "1", Sex2: "1", Age: "15", Record: "测试"},
                {Name: "李四", Sex: "1", Sex1: "1", Sex2: "1", Age: "18", Record: "测试"},
                {Name: "王五", Sex: "1", Sex1: "1", Sex2: "1", Age: "26", Record: "测试"},
                {Name: "韩梅梅", Sex: "0", Sex1: "1", Sex2: "1", Age: "16", Record: "测试"},
                {Name: "张三", Sex: "1", Sex1: "1", Sex2: "1", Age: "15", Record: "测试"},
                {Name: "李四", Sex: "1", Sex1: "1", Sex2: "1", Age: "18", Record: "测试"}
            ];
            table1.dataCount = 100; //总数据的行数
            table1.data = Data;
            table1.pageIndex = PageIndex; //当前页码
            table1.createTable(); //创建table

        };
        var tableInit = function () {
            table1.tablePanelID = "layTable1";
            table1.edit = "Edit";
            table1.delete = "Delete";
            table1.seqEnable = true;
            table1.selectDataByPageIndex = SelectDataByPageIndex;
            table1.column = [
                {title: "姓名", code: "Name", width: 80, edit: ""},
                {
                    title: "性别--下拉框测试",
                    code: "Sex",
                    width: 180,
                    valueDeal: function (value) {
                        if (value == 0) {
                            return "女";
                        } else {
                            return "男";
                        }
                    }, edit: {
                    type: "select",
                    data: [
                        {Name2: "男", Value: 1},
                        {Name2: "女", Value: 0},
                    ],
                    dataKey: {valueKey: "Value", nameKey: "Name2"}
                }
                },
                {
                    title: "性别--单选按钮测试",
                    code: "Sex1",
                    width: 180,
                    valueDeal: function (value) {
                        if (value == 0) {
                            return "女";
                        } else {
                            return "男";
                        }
                    }, edit: {
                    type: "radio",
                    Width: 150,
                    data: [
                        {Name2: "男", Value: 1},
                        {Name2: "女", Value: 0},
                    ],
                    dateKey: {valueKey: "Value", nameKey: "Name2"}
                }
                },
                {
                    title: "性别--复选框测试",
                    code: "Sex2",
                    width: 180,
                    valueDeal: function (value) {
                        if (value == 0) {
                            return "女";
                        } else {
                            return "男";
                        }
                    }, edit: {
                    type: "checkbox",
                    Width: 200,
                    data: [
                        {Name2: "男", Value: 1},
                        {Name2: "女", Value: 0},
                    ],
                    dateKey: {valueKey: "Value", nameKey: "Name2"}
                }
                },
                {title: "年龄", code: "Age", width: 80, edit: ""},
                {title: "备注", code: "Record", width: 80}
            ];
        };
        $("#btnInit").on('click', function () {
            tableInit();
            SelectDataByPageIndex(1);
        });
//        $(function () {
//            tableInit();
//            SelectDataByPageIndex(1);
//        })
    });
</script>
</body>
</html>
