<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>部门客户新增</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>部门客户新增</legend>
</fieldset>
<blockquote class="layui-elem-quote">部门客户新增</blockquote>
<form id="deptCustomInfo" class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">客户编码</label>
        <div class="layui-input-inline">
            <input type="text" name="customerno" placeholder="请输入客户编码" required lay-verify="customerno"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">客户编码长度为0到20位之间的英文数字组合</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">客户名称</label>
        <div class="layui-input-inline">
            <input type="text" name="customername" placeholder="请输入客户名称" required lay-verify="customername"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">客户名称长度为0到50位之间</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">客户来源</label>
        <div class="layui-input-inline">
            <input type="text" name="custfrom" placeholder="请输入客户来源" required lay-verify="custfrom"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">客户来源长度为0到20位之间</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系人</label>
        <div class="layui-input-inline">
            <input type="text" name="relax" placeholder="请输入联系人" required lay-verify="relax"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">联系人长度为0到20位之间</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-inline">
            <input type="text" name="telphone" placeholder="请输入联系电话" required lay-verify="telphone"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">联系电话为座机电话号码</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机</label>
        <div class="layui-input-inline">
            <input type="text" name="phone" placeholder="请输入手机" lay-verify="phone"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">Email</label>
        <div class="layui-input-inline">
            <input type="text" name="email" placeholder="请输入邮箱" lay-verify="email"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <textarea name="address" placeholder="请输入客户详细地址" class="layui-textarea" required
                      lay-verify="address"></textarea>
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
    layui.use(['form', 'layer', 'laydate'], function () {
        var $ = layui.jquery, form = layui.form(), layer = layui.layer;
        form.verify({
            'customerno': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "客户编码不能为空";
                }
                if (!verify.isMaxLong(value, 20)) {
                    return "输入的客户编码格式不正确";
                }
            },
            'customername': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "客户名称不能为空";
                }
                if (!verify.isMaxLong(value, 50)) {
                    return "输入的客户名称格式不正确";
                }
            },
            'custfrom': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "客户来源不能为空";
                }
                if (!verify.isMaxLong(value, 20)) {
                    return "输入的客户来源格式不正确";
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
            'address': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "地址不能为空";
                }
                if (!verify.isMaxLong(value, 200)) {
                    return "输入的地址格式不正确";
                }
            }
        });
        form.on('submit(sub)', function (data) {
            $.post("/cust/dept/adddeptcust", {data: JSON.stringify(data.field)}, function (json, status) {
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


    });
</script>
</body>
</html>