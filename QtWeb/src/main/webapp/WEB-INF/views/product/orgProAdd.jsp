<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>产品新增</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>产品新增</legend>
</fieldset>
<blockquote class="layui-elem-quote">产品新增</blockquote>
<form id="proInfo" class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">产品编码</label>
        <div class="layui-input-inline">
            <input type="text" name="productNo" placeholder="请输入产品编码" required lay-verify="productNo"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">产品编码长度为0到20位之间的英文数字组合</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">产品名称</label>
        <div class="layui-input-inline">
            <input type="text" name="productName" placeholder="请输入产品名称" required lay-verify="productName"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">产品名称长度为0到20位之间</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">版本</label>
        <div class="layui-input-inline">
            <input type="text" name="version" placeholder="请输入版本" lay-verify="version"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">版本长度为0到16位之间</div>
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
<script type="text/javascript" src="/static/frame/cityselect/city.min.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'laydate'], function () {
        var $ = layui.jquery, form = layui.form, layer = layui.layer;
        form.verify({
            'productNo': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "产品编码不能为空";
                }
                if (!verify.isMaxLong(value, 20) || !verify.isLetterAndNumber(value)) {
                    return "输入的产品编码格式不正确";
                }
            },
            'productName': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "产品名称不能为空";
                }
                if (!verify.isMaxLong(value, 20)) {
                    return "输入的产品名称格式不正确";
                }
            },
            'version': function (value) {
                if (!verify.isMaxLong(value, 16)) {
                    return "输入的版本格式不正确";
                }
            }
        });
        form.on('submit(sub)', function (data) {
            $.post("/pro/org/addpro", {data: JSON.stringify(data.field)}, function (json, status) {
                if (status == "success") {
                    layer.msg(json.msg);
                    if (json.code == "200") {
                        setTimeout(function () {
                            location.href = json.jumpUrl;
                        }, 2000);
                    }
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
        });
    });
</script>
</body>
</html>
