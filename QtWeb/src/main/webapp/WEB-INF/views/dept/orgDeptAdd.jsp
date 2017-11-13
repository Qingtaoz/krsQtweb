<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>组织部门新增</title>
    <link rel="stylesheet" href="/static/frame/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/frame/datatables/jquery.dataTables.min.css">
</head>
<body class="body">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>组织部门新增</legend>
</fieldset>
<blockquote class="layui-elem-quote">填写部门信息</blockquote>
<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">部门编号</label>
        <div class="layui-input-inline">
            <input type="text" name="deptNo" placeholder="请输入部门编号" lay-verify="deptNo"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">部门编码长度为1到20位之间的英文数字组合</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门名称</label>
        <div class="layui-input-inline">
            <input type="text" name="deptName" placeholder="请输入部门名称" lay-verify="deptName"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">部门名称长度为1到20位之间的中文</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门管理员</label>
        <div class="layui-input-inline">
            <input id="btn_selectManger" type="text" name="deptmanageruname" placeholder="请选择部门管理员"
                   lay-verify="deptmanageruname"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">选择部门管理员</div>
    </div>
    <div class="layui-input-block">
        <button class="layui-btn" lay-submit="" lay-filter="sub">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
    </div>
</form>
<div id="layer_table" class="hide" style="display: none;">
    <table id="dt_mUser" class="layui-table layui-input-block dateTable">
        <thead>
        <tr>
            <th>单选</th>
            <th>用户名</th>
            <th>昵称</th>
            <th>电话</th>
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
    layui.use(['form', 'layer'], function () {
        var $ = layui.jquery, form = layui.form, layer = layui.layer;
        form.verify({
            'deptNo': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "部门编码不能为空";
                }
                if (!verify.isMaxLong(value, 20) || !verify.isLetterAndNumber(value)) {
                    return "输入的部门编码格式不正确";
                }
            },
            'deptName': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "部门名称不能为空";
                }
                if (!verify.isMaxLong(value, 20) || !verify.isChinese(value)) {
                    return "输入的部门名称必须是中文";
                }
            },
            'deptmanageruname': function (value) {
                if (!verify.isNotEmpty(value)) {
                    return "部门管理员不能为空";
                }
            }
        });
        form.on('submit(sub)', function (data) {
            $.post("/org/dept/adddept", {data: JSON.stringify(data.field)}, function (json, status) {
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
        var table;
        var initDT = function (searchString, successCallBack) {
            return $("#dt_mUser").DataTable(dtConf1({
                "url": "/org/dept/getnodeptuserlist",
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
        var showLayer = function () {
            layer.open({
                'type': 1,
                'area': 'auto',
                'title': ['选择用户'],
                'content': $("#layer_table"),
                'btn': ['确定', '取消'],
                yes: function (index, layero) {
                    var hasSelected = false;
                    $("#dt_mUser").find("tbody tr input[type='radio']").each(function () {
                        if ($(this).is(":checked")) {
                            hasSelected = true;
                            $("#btn_selectManger").val($(this).val());
                            layer.close(index);
                        }
                    });
                    if (!hasSelected) {
                        layer.tips('您需要选择一个用户', '#layer_table', {tips: 3});
                    }
                },
                'shadeClose': true,

            });
        };
        $("#btn_selectManger").on('click', function () {
            if (table == null) {
                table = initDT(null, function () {
                    showLayer();
                });
                return;
            }
            showLayer();
        });
    })

</script>
</body>
</html>
