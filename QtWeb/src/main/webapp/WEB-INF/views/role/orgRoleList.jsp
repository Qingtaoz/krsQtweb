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

<div id="layTable1" >

</div>

<script type="text/javascript" src="/static/frame/layui/layui.js"></script>
<script type="text/javascript" src="/static/frame/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/static/js/qt-tool.js"></script>
<script type="text/javascript" src="/static/js/LayuiHelp_2.0.0.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'laydate'], function () {
        var $ = layui.jquery, form = layui.form(), layer = layui.layer, laydate = layui.laydate;
        var table1 = LayuiHelp.TableLayui();
        var Message = LayuiHelp.MessageLayui();
        var Edit = function () {
            
        };
        var Delete = function () {

        };
        var SelectDataByPageIndex = function (PageIndex) {
            //每次查询获得的数据集--当前页的数据
            var Data = [
                { Name: "张三", Sex: "1", Sex1: "1", Sex2: "1", Age: "15", Record: "测试" },
                { Name: "李四", Sex: "1", Sex1: "1", Sex2: "1", Age: "18", Record: "测试" },
                { Name: "王五", Sex: "1", Sex1: "1", Sex2: "1", Age: "26", Record: "测试" },
                { Name: "韩梅梅", Sex: "0", Sex1: "1", Sex2: "1", Age: "16", Record: "测试" },
                { Name: "张三", Sex: "1", Sex1: "1", Sex2: "1", Age: "15", Record: "测试" },
                { Name: "李四", Sex: "1", Sex1: "1", Sex2: "1", Age: "18", Record: "测试" },
                { Name: "王五", Sex: "1", Sex1: "1", Sex2: "1", Age: "26", Record: "测试" },
                { Name: "韩梅梅", Sex: "0", Sex1: "1", Sex2: "1", Age: "16", Record: "测试" },
                { Name: "张三", Sex: "1", Sex1: "1", Sex2: "1", Age: "15", Record: "测试" },
                { Name: "李四", Sex: "1", Sex1: "1", Sex2: "1", Age: "18", Record: "测试" }
            ];
            table1.SumDateCounte = 100; //总数据的行数
            table1.data = Data;
            table1.PageIndex = PageIndex; //当前页码
            table1.CreateTableFrame(); //创建table

        };
        var tableInit = function () {
            table1.TablePanel = "layTable1";
            table1.Edit="Edit";
            table1.Delete="Delete";
            table1.SelectDataByPageIndex=SelectDataByPageIndex;
            table1.Column = [
                { txtName: "姓名", valueCode: "Name", width: 80, Edit: "" },
                { txtName: "性别--下拉框测试",
                    valueCode: "Sex",
                    width: 80,
                    valueDeal: function (value) {
                        if (value == 0) {
                            return "女";
                        } else {
                            return "男";
                        }
                    }, Edit: {
                    Type: "select",
                    Data: [
                        { Name2: "男", Value: 1 },
                        { Name2: "女", Value: 0 },
                    ],
                    DateKey: { ValueKey: "Value", NameKey: "Name2" }
                }
                },
                { txtName: "性别--单选按钮测试",
                    valueCode: "Sex1",
                    width: 80,
                    valueDeal: function (value) {
                        if (value == 0) {
                            return "女";
                        } else {
                            return "男";
                        }
                    }, Edit: {
                    Type: "radio",
                    Width:150,
                    Data: [
                        { Name2: "男", Value: 1 },
                        { Name2: "女", Value: 0 },
                    ],
                    DateKey: { ValueKey: "Value", NameKey: "Name2" }
                }
                },
                { txtName: "性别--复选框测试",
                    valueCode: "Sex2",
                    width: 80,
                    valueDeal: function (value) {
                        if (value == 0) {
                            return "女";
                        } else {
                            return "男";
                        }
                    }, Edit: {
                    Type: "checkbox",
                    Width: 200,
                    Data: [
                        { Name2: "男", Value: 1 },
                        { Name2: "女", Value: 0 },
                    ],
                    DateKey: { ValueKey: "Value", NameKey: "Name2" }
                }
                },
                { txtName: "年龄", valueCode: "Age", width: 80, Edit: "" },
                { txtName: "备注", valueCode: "Record", width: 80 }
            ];
        };
        $(function () {
            tableInit();
            SelectDataByPageIndex(1);
        })
    });
</script>
</body>
</html>
