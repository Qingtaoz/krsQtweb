<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>部门服务新增</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/frame/datatables/jquery.dataTables.min.css">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>部门服务新增</legend>
</fieldset>
<blockquote class="layui-elem-quote">部门服务新增</blockquote>
<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">服务编码</label>
        <div class="layui-input-inline">
            <input type="text" name="serverNo" placeholder="请输入服务编码" lay-verify="serverNo"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">服务编码长度为0到20位之间的英文数字组合</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">交易编码</label>
        <div class="layui-input-inline">
            <input id="btn_selectTrade" type="text" name="tradeNo" placeholder="请输入交易编码" lay-verify="tradeNo"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">开始日期</label>
        <div class="layui-input-inline">
            <input type="text" name="startDate" placeholder="请输入开始日期" lay-verify="startDate"
                   autocomplete="off"
                   class="layui-input" onclick="layui.laydate({elem: this})">
        </div>
        <label class="layui-form-label">完成日期</label>
        <div class="layui-input-inline">
            <input type="text" name="endDate" placeholder="请输入结束日期" lay-verify="endDate"
                   autocomplete="off"
                   class="layui-input" onclick="layui.laydate({elem: this})">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">服务类型</label>
        <div class="layui-input-inline">
            <input type="text" name="serverType" placeholder="请输入服务类型" lay-verify="serverType"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">服务内容</label>
        <div class="layui-input-block">
            <textarea name="content" placeholder="请输入服务内容,100以内汉字" lay-verify="content"
                      class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">金额</label>
        <div class="layui-input-inline">
            <input id="amount" type="text" name="amount" placeholder="请输入金额"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">有效期</label>
        <div class="layui-input-inline">
            <input type="text" name="validityDate" placeholder="请输入有效期"
                   autocomplete="off"
                   class="layui-input" onclick="layui.laydate({elem: this})">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">服务人</label>
        <div class="layui-input-inline">
            <input id="btn_selectUser" type="text" name="servUsername" placeholder="请输入服务人" lay-verify="servUsername"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">联系人</label>
        <div class="layui-input-inline">
            <input type="text" name="relax" placeholder="请输入联系人" required lay-verify="relax"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-inline">
            <input type="text" name="telphone" placeholder="请输入联系电话" required lay-verify="telphone"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea name="remark" placeholder="请输入备注,100以内汉字"
                      class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-input-block">
        <button class="layui-btn" lay-submit="" lay-filter="sub">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>
<div id="layer_Trade" class="hide" style="display: none;">
    <table id="dt_trade" class="layui-table datatable">
        <thead>
        <tr>
            <th>单选</th>
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
<div id="layer_User" class="hide" style="display: none;">
    <table id="dt_user" class="layui-table dateTable">
        <thead>
        <tr>
            <th>单选</th>
            <th>用户名</th>
            <th>昵称</th>
            <th>电话</th>
            <th>邮箱</th>
            <th>性别</th>
            <th>生日</th>
            <th>真实姓名</th>
            <th>省份</th>
            <th>城市</th>
            <th>地址</th>
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
            'serverNo': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "服务编码不能为空";
                }
                if (!verify.isMaxLong(value, 20) || !verify.isLetterAndNumber(value)) {
                    return "输入的服务编码格式不正确";
                }
            },
            'tradeNo': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "交易编码不能为空";
                }
                if (!verify.isMaxLong(value, 20) || !verify.isLetterAndNumber(value)) {
                    return "输入的交易编码格式不正确";
                }
            },
            'startDate':function(value){
                if(!verify.isNotEmpty(value)){
                    return "开始日期不能为空";
                }
                if(!verify.isDate(value)){
                    return "输入的开始日期格式不正确";
                }
            },
            'endDate':function(value){
                if(!verify.isNotEmpty(value)){
                    return "完成日期不能为空";
                }
                if(!verify.isDate(value)){
                    return "输入的完成日期格式不正确";
                }
            },
            'serverType': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "服务类型不能为空";
                }
                if (!verify.isMaxLong(value, 50)) {
                    return "输入的服务类型格式不正确";
                }
            },
            'content': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "服务内容不能为空";
                }
                if (!verify.isMaxLong(value, 200)) {
                    return "输入的服务内容不正确";
                }
            },
            'servUsername': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "服务人员不能为空";
                }
            },
            'relax': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "联系人不能为空";
                }
                if (!verify.isMaxLong(value, 16)) {
                    return "输入的联系人格式不正确";
                }
            },
            'telphone': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "电话不能为空";
                }
                if (!verify.isMaxLong(value, 16)) {
                    return "输入的电话格式不正确";
                }
            },
        });
        form.on('submit(sub)', function (data) {
            $.post("/serv/dept/addserv", {data: JSON.stringify(data.field)}, function (json, status) {
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
        var tableTrade, tableUser;
        var initDtTrade = function (searchString, successCallBack) {
            return $("#dt_trade").DataTable(dtConf1({
                "url": "/tra/dept/checkdepttralist",
                "pages": 5,
                "orderColumn": 1,
                "data": {
                    "searchString": searchString
                },
                "createdRow": function (row, data, dataIndex) {
                    var value = data[1];
                    row.children[0].innerHTML = getDtRadioString(value, "traGroup");
                },
                "initComplete": successCallBack
            }));
        };
        var initDtUser = function (searchString, successCallBack) {
            return $("#dt_user").DataTable(dtConf1({
                "url": "/dept/user/checkdeptuserslist",
                "pages": 5,
                "orderColumn": 1,
                "data": {
                    "searchString": searchString
                },
                "createdRow": function (row, data, dataIndex) {
                    var value = data[1];
                    row.children[0].innerHTML = getDtRadioString(value, "userGroup");
                },
                "initComplete": successCallBack
            }));
        };
        var showLayerTrade = function () {
            layer.open({
                'type': 1,
                'area': ['1024px', 'auto'],
                'title': ['选择交易'],
                'content': $("#layer_Trade"),
                'btn': ['确定', '取消'],
                yes: function (index, layero) {
                    var hasSelected = false;
                    $("#dt_trade").find("tbody tr input[type='radio']").each(function () {
                        if ($(this).is(":checked")) {
                            hasSelected = true;
                            $("#btn_selectTrade").val($(this).val());
                            layer.close(index);
                        }
                    });
                    if (!hasSelected) {
                        layer.tips('您需要选择一个交易', '#layer_Trade', {tips: 3});
                    }
                },
                'shadeClose': true,

            });
        }
        var showLayerUser = function () {
            layer.open({
                'type': 1,
                'area': ['1024px', 'auto'],
                'title': ['选择产品'],
                'content': $("#layer_User"),
                'btn': ['确定', '取消'],
                yes: function (index, layero) {
                    var hasSelected = false;
                    $("#dt_user").find("tbody tr input[type='radio']").each(function () {
                        if ($(this).is(":checked")) {
                            hasSelected = true;
                            $("#btn_selectUser").val($(this).val());
                            layer.close(index);
                        }
                    });
                    if (!hasSelected) {
                        layer.tips('您需要选择一个用户', '#layer_User', {tips: 3});
                    }
                },
                'shadeClose': true,

            });
        }
        $("#btn_selectTrade").on('click', function () {
            if (tableTrade == null) {
                tableTrade = initDtTrade(null, function () {
                    showLayerTrade();
                });
                return;
            }
            showLayerTrade();
        });
        $("#btn_selectUser").on('click', function () {
            if (tableUser == null) {
                tableUser = initDtUser(null, function () {
                    showLayerUser();
                });
                return;
            }
            showLayerUser();
        });

    })

</script>
</body>
</html>