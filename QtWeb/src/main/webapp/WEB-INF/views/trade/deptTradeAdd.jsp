<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>部门交易新增</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/frame/datatables/jquery.dataTables.min.css">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>部门交易新增</legend>
</fieldset>
<blockquote class="layui-elem-quote">部门交易新增</blockquote>
<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">交易编码</label>
        <div class="layui-input-inline">
            <input type="text" name="tradeNo" placeholder="请输入交易编码" lay-verify="tradeNo"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">交易编码长度为0到20位之间的英文数字组合</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">客户编码</label>
        <div class="layui-input-inline">
            <input id="btn_selectCust" type="text" name="customerNo" placeholder="请选择客户" lay-verify="customerNo"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">产品编码</label>
        <div class="layui-input-inline">
            <input id="btn_selectPro" type="text" name="productNo" placeholder="请选择产品" lay-verify="productNo"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">模块</label>
        <div class="layui-input-block">
            <textarea name="modules" placeholder="请输入模块,50以内汉字" lay-verify="modules" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">点数</label>
        <div class="layui-input-inline">
            <input type="number" name="count" placeholder="请输入点数" lay-verify="count"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">金额</label>
        <div class="layui-input-inline">
            <input id="amount" type="text" name="amount" placeholder="请输入金额" lay-verify="amount"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">免费服务期</label>
        <div class="layui-input-inline">
            <input type="text" name="freeServer" placeholder="请输入服务期" lay-verify="freeServer"
                   autocomplete="off"
                   class="layui-input" onclick="layui.laydate({elem: this})">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">产品序列号</label>
        <div class="layui-input-inline">
            <input type="text" name="serialNumber" placeholder="请输入产品序列号"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">CD-KEY</label>
        <div class="layui-input-inline">
            <input type="text" name="cdKey" placeholder="请输入cdKey"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">系统特征码</label>
        <div class="layui-input-inline">
            <input type="text" name="signatures" placeholder="请输入特征码"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">加密方式</label>
        <div class="layui-input-inline">
            <select name="encryptionType" placeholder="请输入加密方式">
                <option value=""></option>
                <option value="软加密">软加密</option>
                <option value="智能卡">智能卡</option>
            </select>
        </div>
        <label class="layui-form-label">凭证纸型</label>
        <div class="layui-input-inline">
            <select name="voucherPaperType" placeholder="请输入凭证纸型">
                <option value=""></option>
                <option value="KP-J101">KP-J101</option>
                <option value="KP-J103">KP-J103</option>
                <option value="KP-J105">KP-J105</option>
                <option value="KP-Z101">KP-Z101</option>
                <option value="KP-Z103">KP-Z103</option>
                <option value="KP-Z105">KP-Z105</option>
            </select>
        </div>
        <label class="layui-form-label">交易日期</label>
        <div class="layui-input-inline">
            <input type="text" name="tradeDate" placeholder="请输入交易日期" lay-verify="tradeDate"
                   autocomplete="off"
                   class="layui-input" onclick="layui.laydate({elem: this})">
        </div>
    </div>
    <div class="layui-input-block">
        <button class="layui-btn" lay-submit="" lay-filter="sub">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
    </div>
</form>
<div id="layer_Cust" class="hide" style="display: none;">
    <table id="dt_cust" class="layui-table datatable">
        <thead>
        <tr>
            <th>单选</th>
            <th>客户编码</th>
            <th>客户名称</th>
            <th>来源</th>
            <th>联系人</th>
            <th>电话</th>
            <th>手机</th>
            <th>Email</th>
            <th>地址</th>
            <th>创建时间</th>
        </tr>
        </thead>
    </table>
</div>
<div id="layer_Pro" class="hide" style="display: none;">
    <table id="dt_pro" class="layui-table dateTable">
        <thead>
        <tr>
            <th>单选</th>
            <th>产品编码</th>
            <th>产品名称</th>
            <th>版本</th>
            <th>创建时间</th>
        </tr>
        </thead>
    </table>
</div>
<script type="text/javascript" src="/static/frame/layui/layui.js"></script>
<script type="text/javascript" charset="utf8" src="/static/frame/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/static/frame/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/static/js/table-tool.js"></script>
<script type="text/javascript" src="/static/js/qt-tool.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'laydate'], function () {
        var $ = layui.jquery, form = layui.form, laydate = layui.laydate, layer = layui.layer;
        bindKeyEvent.Amount($("#amount"));
        form.verify({
            'tradeNo': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "交易编码不能为空";
                }
                if (!verify.isMaxLong(value, 20) || !verify.isLetterAndNumber(value)) {
                    return "输入的交易编码格式不正确";
                }
            },
            'customerNo': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "客户编码不能为空";
                }
                if (!verify.isMaxLong(value, 20) || !verify.isLetterAndNumber(value)) {
                    return "输入的客户编码格式不正确";
                }
            },
            'productNo': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "产品编码不能为空";
                }
                if (!verify.isMaxLong(value, 20) || !verify.isLetterAndNumber(value)) {
                    return "输入的产品编码格式不正确";
                }
            },
            'modules': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "模块不能为空";
                }
                if (!verify.isMaxLong(value, 100)) {
                    return "输入的模块格式不正确";
                }
            },
            'count': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "点数不能为空";
                }
            },
            'amount': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "金额不能为空";
                }
                if (!verify.isDouble(value)) {
                    return "输入的金额格式不正确";
                }
            },
            'freeServer': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "免费服务期不能为空";
                }
                if (!verify.isDate(value)) {
                    return "输入的免费服务期格式不正确";
                }
            },
            'tradeDate': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "交易日期不能为空";
                }
                if (!verify.isDate(value)) {
                    return "输入的交易日期格式不正确";
                }
            }
        });
        form.on('submit(sub)', function (data) {
            $.post("/tra/dept/addtra", {data: JSON.stringify(data.field)}, function (json, status) {
                if (status == "success") {
                    layer.msg(json.msg);
                    if (json.code == "200") {
                        setTimeout(function () {
                            location.href = json.jumpUrl;
                        }, 2000);
                    }
                }
            }, "json").error(function (response) {
                if (response.getResponseHeader("errCode") == "402") {
                    layer.msg(response.getResponseHeader("errMsg"));
                    setTimeout(function () {
                        window.parent.location.href = "/login.html";
                    }, 2000);
                    return false;
                }
                if (response.getResponseHeader("errCode") == "403") {
                    layer.msg(response.getResponseHeader("errMsg"));
                    setTimeout(function () {
                        location.href = "/sys_403.html";
                    }, 2000);
                    return false;
                }
            });
            return false;
        });
        var tableCust, tablePro;
        var initDtCust = function (searchString, successCallBack) {
            return $("#dt_cust").DataTable(dtConf1({
                "url": "/cust/dept/checkcustlist",
                "pages": 5,
                "orderColumn": 1,
                "data": {
                    "searchString": searchString
                },
                "createdRow": function (row, data, dataIndex) {
                    var value = data[1];
                    row.children[0].innerHTML = getDtRadioString(value, "custGroup");
                },
                "initComplete": successCallBack
            }));
        };
        var initDtPro = function (searchString, successCallBack) {
            return $("#dt_pro").DataTable(dtConf1({
                "url": "/pro/dept/checkdeptprolist",
                "pages": 5,
                "orderColumn": 1,
                "data": {
                    "searchString": searchString
                },
                "createdRow": function (row, data, dataIndex) {
                    var value = data[1];
                    row.children[0].innerHTML = getDtRadioString(value, "proGroup");
                },
                "initComplete": successCallBack
            }));
        };
        var showLayerCust = function () {
            layer.open({
                'type': 1,
                'area': ['1024px', 'auto'],
                'title': ['选择客户'],
                'content': $("#layer_Cust"),
                'btn': ['确定', '取消'],
                yes: function (index, layero) {
                    var hasSelected = false;
                    $("#dt_cust").find("tbody tr input[type='radio']").each(function () {
                        if ($(this).is(":checked")) {
                            hasSelected = true;
                            $("#btn_selectCust").val($(this).val());
                            layer.close(index);
                        }
                    });
                    if (!hasSelected) {
                        layer.tips('您需要选择一个客户', '#layer_Cust', {tips: 3});
                    }
                },
                'shadeClose': true,

            });
        }
        var showLayerPro = function () {
            layer.open({
                'type': 1,
                'area': 'auto',
                'title': ['选择产品'],
                'content': $("#layer_Pro"),
                'btn': ['确定', '取消'],
                yes: function (index, layero) {
                    var hasSelected = false;
                    $("#dt_pro").find("tbody tr input[type='radio']").each(function () {
                        if ($(this).is(":checked")) {
                            hasSelected = true;
                            $("#btn_selectPro").val($(this).val());
                            layer.close(index);
                        }
                    });
                    if (!hasSelected) {
                        layer.tips('您需要选择一个产品', '#layer_Pro', {tips: 3});
                    }
                },
                'shadeClose': true,

            });
        }
        $("#btn_selectCust").on('click', function () {
            if (tableCust == null) {
                tableCust = initDtCust(null, function () {
                    showLayerCust();
                });
                return;
            }
            showLayerCust();
        });
        $("#btn_selectPro").on('click', function () {
            if (tablePro == null) {
                tablePro = initDtPro(null, function () {
                    showLayerPro();
                });
                return;
            }
            showLayerPro();
        });

    })

</script>
</body>
</html>