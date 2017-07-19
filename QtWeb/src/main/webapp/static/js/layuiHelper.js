/**
 *
 * Created by Slash on 2017/7/17.
 */
var layuiHelper = {

    LayerMsg: function () {
        /*
         *   icon==0;感叹号
         *   icon==1;正确，打钩
         *   icon==2;错误，打叉
         *   icon==3;问号
         *   icon==4;加锁
         *   icon==5;生气表情
         *   icon==6;开心表情
         */
        return {
            title: "提示",
            icon: 0,
            msg: "你没有输入内容",
            cb_Ok: "",
            cb_Cancel: "",
            show: function () {
                var msgJson = [];
                var cb_Ok = this.cb_Ok;
                var cb_Cancel = this.cb_Cancel;
                if (this.cb_Cancel == "") {
                    msgJson = {
                        title: this.title,
                        offset: '15%',
                        icon: this.icon,
                        btn: ['确定'],
                        yes: function (index) {
                            if (cb_Ok != undefined && cb_Ok != "") {
                                cb_Ok();
                            }
                            layer.close();
                        }
                    }
                } else if (cb_Ok == undefined && cb_Ok != "" && cb_Cancel != undefined && cb_Cancel != "") {
                    msgJson = {
                        title: this.title,
                        offset: '15%',
                        icon: this.icon,
                        btn: ['取消'],
                        yes: function (index) {
                            if (cb_Cancel != undefined && cb_Cancel != "") {
                                cb_Cancel();
                            }
                            layer.close();
                        }
                    }
                } else {
                    msgJson = {
                        title: this.title,
                        offset: '15%',
                        icon: this.icon,
                        btn: ['确定', '取消'],
                        yes: function (index) {
                            if (cb_Ok != undefined && cb_Ok != "") {
                                cb_Ok();
                            }
                            layer.close();
                        }, btn2: function (index, layero) {
                            if (cb_Cancel != undefined && cb_Cancel != "") {
                                cb_Cancel();
                            }
                            layer.close();
                        }
                    }
                }
                var msg = this.msg;
                layui.use('layer', function () {
                    layui.layer.confirm(msg, msgJson);
                })
            }
        }
    },

    LayTable: function () {
        return {
            tablePanelID: "",
            tableSkin: "",
            seqEnable: true,
            rowColor: [{color: "#F8F8F8"}],
            column: [{
                title: "",
                code: "",
                width: 80,
                style: "",
                visible: true,
                edit: {
                    show: true,
                    width: 120,
                    type: "txt",     //select,radio,checkbox
                    data: [{
                        name: "",
                        value: ""
                    }],
                    dataKey: {       //自定义数据集
                        nameKey: "",
                        valueKey: ""
                    }
                },
                valueDeal: function (value) {
                    return value;
                }
            }],
            edit: "",
            editSetting: {
                flag: 1,//0：编辑，1：新增
                splitChar: ",",
                size: {
                    width: 300,
                    height: 400,
                    nameWidth: 120
                },
                cb_OK: undefined
            },
            delete: "",
            data: [],
            pageIndex: 1,
            pageSize: 10,
            dataCount: 0,
            selectDataByPageIndex: function (index) {

            },
            getRowData: function (index) {
                return this.data[index];
            },
            laypage: layuiHelper.LayPaging(),
            createTable: function () {
                var tableID = "layuiTable" + layuiHelper.Common.getTimestamp();
                var layerMsg = layuiHelper.LayerMsg();
                var width = 0;
                var colGroupHtml = "";
                var theadHtml = "";
                var ifContinue = true;
                if (this.seqEnable) {
                    width = 80;
                    colGroupHtml = "<col style='"+width+"'>";
                    theadHtml = "<th>序号</th>";
                }
                var column = this.column;
                for (var i = 0; i < column.length; i++) {
                    if (column[i].title == undefined) {
                        column[i].title = "";
                    }
                    if (column[i].code == undefined || column[i].code == "") {
                        layerMsg.msg = "第" + (i + 1) + "列的取值编码不能为空！";
                        layerMsg.show();
                        ifContinue = false;
                        break;
                    }
                    if (column[i].visible != undefined) {
                        if (column[i].visible == false) {
                            continue;
                        }
                    }
                    if (column[i].edit != undefined) {
                        if (this.edit == "") {
                            layerMsg.msg = "您启用了编辑列，却没有设置编辑保存事件";
                            layerMsg.show();
                            ifContinue = false;
                            break;
                        }
                    }
                    var columnWidth = column[i].width == undefined ? 80 : column[i].width;
                    width += columnWidth;
                    colGroupHtml += "<col width='" + columnWidth + "'>";
                    theadHtml += "<th style='" + (column[i].style == undefined ? "" : column[i].style) + "'>" + column[i].title + "</th>";
                }
                if (this.edit != "" || this.delete != "") {
                    width += 120;
                    colGroupHtml += "<col width='120'>";
                    theadHtml += "<th></th>";
                }
                var tbodyHtml = "";
                if (this.data != undefined && this.data != null && ifContinue) {
                    if (this.data.length > 0) {
                        for (var i = 0; i < this.data.length; i++) {
                            tbodyHtml += "<tr id='" + tableID + "tr_" + i + "'>";
                            if (this.seqEnable) {
                                tbodyHtml += "<td style='text-align:center;'>" + ((parseFloat(this.pageIndex) - 1) * this.pageSize + i + 1) + "</td>";
                            }
                            for (var j = 0; j < column.length; j++) {
                                if (column[j].visible != undefined) {
                                    if (column[j] == false) {
                                        continue;
                                    }
                                }
                                tbodyHtml += "<td style=\"cursor:pointer;word-break:normal|break-all|keep-all;" + (column[j].style == undefined ? "" : column[j].style) + "\">";
                                var value = "";
                                if (column[j].valueDeal != undefined) {
                                    value = column[j].valueDeal(this.data[i][column[j].code]);
                                } else {
                                    value = this.data[i][column[j].code];
                                }
                                tbodyHtml += (value == null ? "" : value) + "</td>";
                            }
                            if (this.edit != "" || this.delete != "") {
                                tbodyHtml += "<td>";
                                if (this.edit != "") {
                                    tbodyHtml += "<button class='layui-btn layui-btn-normal layui-btn-mini' onclick='" + this.edit + "(" + i + ")'><i class='layui-icon'>&#xe642;</i></button>";
                                }
                                if (this.delete != "") {
                                    tbodyHtml += "<button class='layui-btn layui-btn-normal layui-btn-mini' onclick='" + this.delete + "(" + i + ")'><i class='layui-icon'>&#xe640;</i></button>";
                                }
                                tbodyHtml += "</td>";
                            }
                            tbodyHtml += "</tr>";
                        }
                    }
                }
                if (this.laypage.pagePanelID == "") {
                    this.laypage.pagePanelID = new Date().getTime();
                }
                var html = "<div style='width:" + (width < 430 ? 430 : width) + "px'>"
                    + " <table id='" + tableID + "' class='layui-table' lay-skin='" + (this.tableSkin == "" ? "" : this.tableSkin) + "'>"
                    + "<colgroup>" + colGroupHtml + "</colgroup>"
                    + "<thead><tr>" + theadHtml + "</tr></thead>"
                    + "<tbody>" + tbodyHtml + "</tbody>"
                    + "</table>"
                    + "<div id='" + this.laypage.pagePanelID + "'></div></div>";
                if (ifContinue) {
                    $("#" + this.tablePanelID).html(html);
                    if (this.dataCount > 0) {
                        this.laypage.pageIndex = this.pageIndex;
                        this.laypage.pages = this.pageSize;
                        this.laypage.dataCount = this.dataCount;
                        this.laypage.selectDataByPageIndex = this.selectDataByPageIndex;
                        this.laypage.createPage();
                    }
                }
                if (this.rowColor != undefined) {
                    var rowColor = this.rowColor;
                    $("#" + this.tablePanelID + " tbody tr").mouseleave(function () {
                        $(this).css("background-color", "#ffffff");
                    });
                    $("#" + this.tablePanelID + " tbody tr").mousemove(function () {
                        var count = parseInt($(this).attr("id").split('_')[1]) + 1;
                        var length = rowColor.length;
                        var num = count - parseInt(count / length) * length;
                        $(this).css("backgroud-color", rowColor[num].color);
                    });
                }
            },
            createEditMode: function () {
                var flag = 1;//编辑模式 0：编辑，1：新增
                var dataIndex = 1;
                var layerMsg = layuiHelper.LayerMsg();
                var cb_OK = function () {

                };
                var size = {
                    width: 400,
                    height: 0,
                    nameWidth: 120
                }
                if (this.editSetting.flag != undefined || this.editSetting.flag != null || this.editSetting.flag != "") {
                    flag = this.editSetting.flag;
                }
                if (this.editSetting.dataIndex != undefined || this.editSetting.dataIndex != null || this.editSetting.dataIndex != "") {
                    dataIndex = this.editSetting.dataIndex;
                }
                if (this.editSetting.cb_OK != undefined) {
                    cb_OK = this.editSetting.cb_OK;
                }
                if (this.editSetting.size != undefined) {
                    if (this.editSetting.size.width != undefined) {
                        size.width = this.editSetting.size.width;
                    }
                    if (this.editSetting.size.height != undefined) {
                        size.height = this.editSetting.size.height;
                    }
                    if (this.editSetting.size.nameWidth != undefined) {
                        size.nameWidth = this.editSetting.size.nameWidth;
                    }
                }
                var editModeID = new Date().getTime();
                var column = this.column;
                var json = [];
                if (flag == 0) {
                    json = this.getRowData(dataIndex);
                }
                var maxValWidth = 0;
                var ifContinue = true;
                var editModeHtml = "<div id='editMode' style='margin-bottom:15px;'>";
                for (var i = 0; i < column.length; i++) {
                    if (column[i].edit != undefined) {
                        var show = true;
                        if (column[i].edit.show != undefined) {
                            if (column[i].edit.show != false) {
                                show = false;
                            }
                        }
                        if (show) {
                            var style = "width:120px";
                            if (column[i].edit.width != undefined) {
                                maxValWidth = column[i].edit.width > maxValWidth ? column[i].edit.width : maxValWidth;
                                style = "width:" + column[i].edit.width + "px;";
                            }
                            var type = "txt";
                            if (column[i].edit.type != undefined) {
                                if (column[i].edit.type != "txt" && column[i].edit.type != "select" && column[i].edit.type != "radio" && column[i].edit.type != "checkbox") {
                                    layerMsg.msg = "第" + (i + 1) + "列未能识别的编辑控件：" + column[i].edit.type;
                                    layerMsg.show();
                                    ifContinue = false;
                                    break;
                                }
                            } else {
                                type = column[i].edit.type;
                            }
                            editModeHtml += "<div class='layui-item' style='margin-top:15px; '>";
                            editModeHtml += "<label class='layui-form-label' style='width:" + size.nameWidth + "px;padding:9px 0;'>" + column[i].title + "：</label>";
                            if (type == "txt") {
                                editModeHtml += "<input id='" + editModeID + column[i].code + "' type='text' class='layui-input' placeholder='请输入" + column[i].title + "' style='" + style + "'" + (flag == 0 ? "value='" + json[column[i].code] + "'" : "") + " />";
                            } else if (type == "select" || type == "radio" || type == "checkbox") {
                                if (column[i].edit.data == undefined) {
                                    layerMsg.msg = "第" + (i + 1) + "列的编辑控件数据集错误！";
                                    layerMsg.show();
                                    ifContinue = false;
                                    break;
                                } else {
                                    if (type == "select") {
                                        editModeHtml += "<select id='" + editModeID + column[i].code + "' class='layui-input' style='" + style + "'>";
                                    } else if (type = "radio" || type == "checkbox") {
                                        editModeHtml += "<div class='layui-input-block layui-form' style='margin-left:" + (size.nameWidth + 5) + "px;" + style + "'>";
                                    }
                                    if (column[i].edit.data == undefined) {
                                        layerMsg.msg = "第" + (i + 1) + "行的编辑控件数据集没有赋值！";
                                        layerMsg.show();
                                        ifContinue = false;
                                        break;
                                    }
                                    for (var j = 0; j < column[i].edit.data.length; j++) {
                                        var valueKey = "Value";
                                        var nameKey = "Name";
                                        if (column[i].edit.data[j] == undefined) {
                                            continue;
                                        }
                                        if (column[i].edit.dataKey != undefined) {
                                            valueKey = column[i].edit.dataKey.valueKey;
                                            nameKey = column[i].edit.dataKey.nameKey;
                                            if (valueKey == undefined || nameKey == undefined) {
                                                layerMsg.msg = "第" + (i + 1) + "列的编辑控件下拉框的选项数据集自定义取值字段的设置不正确！";
                                                layerMsg.show();
                                                ifContinue = false;
                                                break;
                                            }
                                        }
                                        if (type == "select") {
                                            editModeHtml += "<option value='" + column[i].edit.data[j][valueKey] + "' " + (flag == 0 ? (json[column[i].code] == column[i].edit.data[j][valueKey] ? "selected='selected'" : "") : "") + " >" + column[i].edit.data[j][nameKey] + "</option>";
                                        } else if (type == "radio" || type == "checkbox") {
                                            editModeHtml += "<input type='" + type + "' name='" + editModeID + column[i].code + "' value='" + column[i].edit.data[j][valueKey] + "' title='" + column[i].edit.data[j][nameKey] + "' " + (flag == 0 ? (json[column[i].code] == column[i].edit.data[j][valueKey] ? " checked " : "") : "") + " >";
                                        }
                                    }
                                    if (type == "select") {
                                        editModeHtml += "</select>";
                                    } else if (type == "radio" || type == "checkbox") {
                                        editModeHtml += "</div>";
                                    }
                                }
                            }
                            editModeHtml += "</div>";
                        }
                    }
                }
                editModeHtml += "</div>";
                if (ifContinue) {
                    var tips = flag == 0 ? "编辑" : "新增";
                    var area = this.editSetting.size.width + "px";
                    if (this.editSetting.size.height > 0) {
                        area = [this.editSetting.size.width + "px", this.editSetting.size.height + "px"];
                    }
                    var splitChar = ",";
                    if (this.editSetting.splitChar != undefined) {
                        splitChar = this.editSetting.splitChar;
                    }
                    layer.open({
                        offset: ['12%', '30%'],
                        area: area,
                        title: tips,
                        type: 1,
                        content: editModeHtml,
                        btnAlign: 'c',
                        btn: ['确认', '取消'],
                        yes: function (index, layero) {
                            var rtnJson = {};
                            for (var i = 0; i < column.length; i++) {
                                var thisValue = "";
                                var type = "txt";
                                if (column[i].edit != undefined) {
                                    if (column[i].edit.type != undefined) {
                                        type = column[i].edit.type;
                                    }
                                }
                                if (type == "txt" || type == "select") {
                                    thisValue = $("#" + editModeID + column[i].code).val();
                                } else if (type == "radio" || type == "checkbox") {
                                    var checkObj = $("input[name='" + editModeID + "']");
                                    for (var j = 0; j < checkObj.length; j++) {
                                        if (checkObj[j].checked) {
                                            if (thisValue != "") {
                                                thisValue += splitChar;
                                                thisValue += $(checkObj[j].val());
                                            }
                                        }
                                    }
                                }
                                if (thisValue != undefined) {
                                    if (flag == 0) {
                                        json[column[i].code] = thisValue;
                                    }
                                    rtnJson[column[i].code] = thisValue;
                                }
                            }
                            if (cb_OK() != undefined) {
                                if (flag == 0) {
                                    cb_OK(json);
                                } else {
                                    cb_OK(rtnJson);
                                }
                            }
                            layer.close(index);
                        }, btn2: function (index, layero) {

                        },
                        end: function () {

                        }
                    });

                    layui.use('form', function () {
                        var form = layui.form();
                        form.render();
                    });
                }
            }
        }
    },
    LayPaging: function () {
        return {
            pagePanelID: "",
            pageIndex: 1,
            pageSize: 10,
            dataCount: 0,
            selectDataByPageIndex: function (pageIndex) {

            },
            refresh: function () {
                this.selectDataByPageIndex(this.pageIndex);
            },
            createPage: function () {
                $("#" + this.pagePanelID).css("width", "100%");
                $("#" + this.pagePanelID).css("text-align", "right");
                var pageSelect = this.selectDataByPageIndex;
                var pageID = this.pagePanelID;
                var pageIndex = this.pageIndex;
                var pageSize = Math.ceil(this.dataCount / this.pageSize);
                layui.use(['laypage', 'layer'], function () {
                    var layPage = layui.laypage;
                    var layer = layui.layer;
                    layPage({
                        cont: pageID,
                        curr: pageIndex,
                        pages: pageSize,
                        groups: 5,
                        jump: function (obj, first) {
                            if (!first) {
                                pageSelect(obj.curr);
                            }
                        }
                    });
                });
            }
        }
    },
    Common: {
        //获取当前时间
        getCurrTime: function () {
            return new Date();
        },
        //获取当前时间毫秒数
        getTimestamp: function () {
            return new Date().valueOf();
        },
        //获取url中的指定参数的值，如果参数不存在，返回空字串
        //paramName:参数名称
        getParam: function (paramName) {
            paramValue = "";
            isFound = false;
            paramName = paramName.toLowerCase();
            if (location.search.indexOf("?") == 0 && location.search.indexOf("=") > 1) {
                arrSource = unescape(location.search).substring(1, location.search.length).split("&");
                i = 0;
                while (i < arrSource.length && !isFound) {
                    if (arrSource[i].indexOf("=") > 0) {
                        if (arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase()) {
                            paramValue = arrSource[i].toLowerCase().split(paramName + "=")[1];
                            paramValue = arrSource[i].substr(paramName.length + 1, paramValue.length);
                            isFound = true;
                        }
                    }
                    i++;
                }
            }
            return paramValue;
        },
        // 修改url指定参数的方法,url,参数名，参数值
        changeURLArg: function (url, arg, arg_val) {
            var pattern = arg + '=([^&]*)';
            var replaceText = arg + '=' + arg_val;
            if (url.match(pattern)) {
                var tmp = '/(' + arg + '=)([^&]*)/gi';
                tmp = url.replace(eval(tmp), replaceText);
                return tmp;
            } else {
                if (url.match('[\?]')) {
                    return url + '&' + replaceText;
                } else {
                    return url + '?' + replaceText;
                }
            }
            return url + '\n' + arg + '\n' + arg_val;
        }
    }//一般工具类结束
};