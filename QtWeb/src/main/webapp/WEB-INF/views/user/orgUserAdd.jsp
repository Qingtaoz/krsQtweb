<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>添加组织用户</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>添加组织用户</legend>
</fieldset>
<blockquote class="layui-elem-quote">填写用户信息</blockquote>
<form id="userInfo" class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="userName" placeholder="请输入用户名" required lay-verify="userName"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">用户名长度为1到20位之间的英文数字组合</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="passWord" placeholder="请输入密码" required lay-verify="passWord"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">密码长度在6到20位之间英文数字组合</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">昵称</label>
        <div class="layui-input-inline">
            <input type="text" name="nickName" placeholder="请输入昵称" required lay-verify="nickName"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">昵称长度为1到16位之间</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="tel" name="phoneNum" placeholder="请输入电话号码" autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" name="email" placeholder="请输入常用邮箱" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="radio" name="sex" value="1" title="男" checked>
            <input type="radio" name="sex" value="2" title="女">
        </div>
        <label class="layui-form-label">生日</label>
        <div class="layui-input-inline">
            <input type="text" name="birthDate" placeholder="请输入生日" autocomplete="off"
                   class="layui-input" onclick="layui.laydate({elem: this})">
        </div>
        <label class="layui-form-label">真实姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="realName" placeholder="请输入真实姓名"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地区</label>
        <div class="layui-input-inline">
            <select id="province" name="province" lay-filter="province">
                <option value="0">----选择省份----</option>
            </select>
        </div>
        <div class="layui-input-inline">
            <select id="city" name="city">
                <option value="0">----选择城市----</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <input type="text" name="address" placeholder="请输入地址"
                   autocomplete="off"
                   class="layui-input">
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
<script type="text/javascript" src="/static/frame/cityselect/city.min.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer', 'laydate'], function () {
        var $ = layui.jquery, form = layui.form(), layer = layui.layer, laydate = layui.laydate;
        $(function () {
            $("#province").empty();
            for (var i = 0; i < prolist.ps.length; i++) {
                $("#province").append("<option value='" + prolist.ps[i].pid + "'>" + prolist.ps[i].pname + "</option>");
            }
            form.render('select');
        });
        form.on('select(province)', function () {
            var pid = $("#province").val();
            $("#city").empty(); //清空城市列表
            for (var i = 0; i < prolist.ps.length; i++) {
                if (prolist.ps[i].pid == pid) {
                    for (var j = 0; j < prolist.ps[i].citys.length; j++) {
                        $("#city").append("<option value='" + prolist.ps[i].citys[j].cid + "'>" + prolist.ps[i].citys[j].cname + "</option>");
                    }
                }
            }
            form.render('select');
        });
        form.verify({
            'userName': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "用户名不能为空";
                }
                if (!verify.isMaxLong(value, 20) || !verify.isLetterAndNumber(value)) {
                    return "输入的用户名格式不正确";
                }
            },
            'passWord': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "密码不能为空";
                }
                if (!verify.isMinShort(value, 6) || !verify.isMaxLong(value, 20) || !verify.isLetterAndNumber(value)) {
                    return "输入的密码格式不正确";
                }
            },
            'nickName': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "昵称不能为空";
                }
                if (!verify.isMaxLong(value, 16)) {
                    return "输入的昵称格式不正确";
                }
            }
        });
        form.on('submit(sub)', function (data) {
            $.post("/org/user/adduser", {data: JSON.stringify(data.field)}, function (json, status) {
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
