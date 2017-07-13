/**
 * Created by Administrator on 2017/2/27 0027.
 */
// 表格选中 checkbox
$('.dateTable').on('click', 'tbody tr input[type="checkbox"]', function () {
    var obj = $(this).parent().parent();
    if (this.checked) {
        obj.addClass('selected');
    } else {
        obj.removeClass('selected');
    }
    dtToolBarView($(this).parents('.dateTable')[0]);
});

// 全选和反选
$('.dateTable').on('click', 'thead tr input[type="checkbox"]', function () {
    var obj = $(".dateTable tbody input[type='checkbox']:checkbox");
    var allTr = $(".dateTable tbody tr");
    if (this.checked) {
        obj.prop("checked", true);
        allTr.addClass('selected');
    } else {
        obj.prop("checked", false);
        allTr.removeClass('selected');
    }
    dtToolBarView($(this).parents('.dateTable')[0]);
});
//表格工具条显示
var dtToolBarView = function (elemDt) {
    var dtWrapper = $(elemDt).parents('.dt_wrapper')[0];
    var dtToolBar = $(dtWrapper).find('.dtToolBar')[0];
    if (dtToolBar == null) {
        return;
    }
    var count = 0;
    $(elemDt).find('tbody tr input[type="checkbox"]').each(function () {
        if (this.checked) {
            count++;
        }
    });
    var btnAdd = $(dtToolBar).find('.btnAdd')[0];
    var btnCheck = $(dtToolBar).find('.btnCheck')[0];
    var btnEdit = $(dtToolBar).find('.btnEdit')[0];
    var btnDist = $(dtToolBar).find('.btnDist')[0];
    var btnDelete = $(dtToolBar).find('.btnDelete')[0];
    if (count == 0) {
        $(btnAdd).removeClass('layui-btn-disabled');
        $(btnCheck).addClass('layui-btn-disabled');
        $(btnEdit).addClass('layui-btn-disabled');
        $(btnDist).addClass('layui-btn-disabled');
        $(btnDelete).addClass('layui-btn-disabled');
    } else if (count == 1) {
        $(btnAdd).removeClass('layui-btn-disabled');
        $(btnCheck).removeClass('layui-btn-disabled');
        $(btnEdit).removeClass('layui-btn-disabled');
        $(btnDist).removeClass('layui-btn-disabled');
        $(btnDelete).removeClass('layui-btn-disabled');
    } else {
        $(btnAdd).removeClass('layui-btn-disabled');
        $(btnCheck).addClass('layui-btn-disabled');
        $(btnEdit).addClass('layui-btn-disabled');
        $(btnDist).removeClass('layui-btn-disabled');
        $(btnDelete).removeClass('layui-btn-disabled');
    }
}

// 删除公共方法   deleteAll(ids,请求url,操作成功跳转url,操作失败跳转url)
function deleteAll(ids, url, sUrl, eUrl) {
    // ids不能为空
    if (ids == null || ids == '') {
        layer.msg('请选择要删除的数据', {time: 2000});
        return false;
    } else {
        layer.confirm('确认删除选中数据?', {
            title: '删除',
            btn: ['确认', '取消'] // 可以无限个按钮
        }, function (index, layero) {
            // 确认
            $.post(url, {ids: ids}, function (res) {
                // 大于0表示删除成功
                if (res.status > 0) {
                    // 提示信息并跳转
                    layer.msg(res.msg, {time: 2000}, function () {
                        location.href = sUrl;
                    })
                } else {
                    // 提示信息并跳转
                    layer.msg(res.msg, {time: 2000}, function () {
                        location.href = eUrl;
                    })
                }
            });
        }, function (index) {
            // 关闭
            layer.close(index);
        });
    }
}

// 转换时间戳为日期时间(时间戳,显示年月日时分,加8小时显示正常时间区)
function UnixToDate(unixTime, isFull, timeZone) {
    if (unixTime == '' || unixTime == null) {
        return '';
    }
    if (typeof (timeZone) == 'number') {
        unixTime = parseInt(unixTime) + parseInt(timeZone) * 60 * 60;
    }
    var time = new Date(unixTime * 1000);
    var ymdhis = "";
    var year, month, date, hours, minutes, seconds;
    if (time.getUTCFullYear() < 10) {
        year = '0' + time.getUTCFullYear();
    } else {
        year = time.getUTCFullYear();
    }
    if ((time.getUTCMonth() + 1) < 10) {
        month = '0' + (time.getUTCMonth() + 1);
    } else {
        month = (time.getUTCMonth() + 1);
    }
    if (time.getUTCDate() < 10) {
        date = '0' + time.getUTCDate();
    } else {
        date = time.getUTCDate();
    }
    ymdhis += year + "-";
    ymdhis += month + "-";
    ymdhis += date;
    if (isFull === true) {
        if (time.getUTCHours() < 10) {
            hours = '0' + time.getUTCHours();
        } else {
            hours = time.getUTCHours();
        }
        if (time.getUTCMinutes() < 10) {
            minutes = '0' + time.getUTCMinutes();
        } else {
            minutes = time.getUTCMinutes();
        }
        if (time.getUTCSeconds() < 10) {
            seconds = '0' + time.getUTCSeconds();
        } else {
            seconds = time.getUTCSeconds();
        }
        ymdhis += " " + hours + ":";
        ymdhis += minutes;
        // ymdhis += seconds;
    }
    return ymdhis;
}

// 批量删除 返回需要的 ids
function getIds(o, str) {
    var obj = o.find('tbody tr td:first-child input[type="checkbox"]:checked');
    var list = '';
    obj.each(function (index, elem) {
        list += $(elem).attr(str) + ',';
    });
    // 去除最后一位逗号
    list = list.substr(0, (list.length - 1));
    return list;
}


//////////////////DataTables 管道///////////////////////////////////////////////////////////////////////////////
//
// DataTables 管道加载方法. To be used to the `ajax` option of DataTables
//
$.fn.dataTable.pipeline = function (opts) {
    // 配置选项
    var conf = $.extend({
        pages: 5,     // 要缓存的页数
        url: '',      // 请求url
        data: null,   // 发送给服务器的数据
        method: 'GET' // Ajax HTTP 请求方法
    }, opts);

    // 缓存库用的私有变量
    var cacheLower = -1;
    var cacheUpper = null;
    var cacheLastRequest = null;
    var cacheLastJson = null;

    return function (request, drawCallback, settings) {
        var ajax = false;
        var requestStart = request.start;
        var drawStart = request.start;
        var requestLength = request.length;
        var requestEnd = requestStart + requestLength;

        if (settings.clearCache) {
            // API requested that the cache be cleared
            ajax = true;
            settings.clearCache = false;
        }
        else if (cacheLower < 0 || requestStart < cacheLower || requestEnd > cacheUpper) {
            // outside cached data - need to make a request
            ajax = true;
        }
        else if (JSON.stringify(request.order) !== JSON.stringify(cacheLastRequest.order) ||
            JSON.stringify(request.columns) !== JSON.stringify(cacheLastRequest.columns) ||
            JSON.stringify(request.search) !== JSON.stringify(cacheLastRequest.search)
        ) {
            // properties changed (ordering, columns, searching)
            ajax = true;
        }

        // Store the request for checking next time around
        cacheLastRequest = $.extend(true, {}, request);

        if (ajax) {
            // Need data from the server
            if (requestStart < cacheLower) {
                requestStart = requestStart - (requestLength * (conf.pages - 1));

                if (requestStart < 0) {
                    requestStart = 0;
                }
            }

            cacheLower = requestStart;
            cacheUpper = requestStart + (requestLength * conf.pages);

            request.start = requestStart;
            request.length = requestLength * conf.pages;

            // Provide the same `data` options as DataTables.
            if ($.isFunction(conf.data)) {
                // As a function it is executed with the data object as an arg
                // for manipulation. If an object is returned, it is used as the
                // data object to submit
                var d = conf.data(request);
                if (d) {
                    $.extend(request, d);
                }
            }
            else if ($.isPlainObject(conf.data)) {
                // As an object, the data given extends the default
                $.extend(request, conf.data);
            }

            settings.jqXHR = $.ajax({
                "type": conf.method,
                "url": conf.url,
                "data": request,
                "dataType": "json",
                "cache": false,
                "success": function (json) {
                    cacheLastJson = $.extend(true, {}, json);

                    if (cacheLower != drawStart) {
                        json.data.splice(0, drawStart - cacheLower);
                    }
                    if (requestLength >= -1) {
                        json.data.splice(requestLength, json.data.length);
                    }

                    drawCallback(json);
                }
            });
        }
        else {
            json = $.extend(true, {}, cacheLastJson);
            json.draw = request.draw; // Update the echo for each response
            json.data.splice(0, requestStart - cacheLower);
            json.data.splice(requestLength, json.data.length);

            drawCallback(json);
        }
    }
};

// Register an API method that will empty the pipelined data, forcing an Ajax
// fetch on the next draw (i.e. `table.clearPipeline().draw()`)
$.fn.dataTable.Api.register('clearPipeline()', function () {
    return this.iterator('table', function (settings) {
        settings.clearCache = true;
    });
});

///////////////DataTables初始化属性自定义////////////////////////////////////////////////////////////////
//管道式，中文，服务器模式，禁用搜索，禁用页行，第一列禁用排序,post请求
var dtConf1 = function (opts) {
    return $.extend({
        "processing": true,
        "serverSide": true,
        "lengthChange": false,
        "searching": false,
        "autoWidth": true,
        "order": [[opts.orderColumn, 'asc']],
        "columnDefs": [
            {"orderable": false, "targets": '_all'},
            {"orderable": true, "targets": opts.orderColumn}
        ],
        "ajax": $.fn.dataTable.pipeline({
            url: opts.url,
            pages: opts.pages,
            method: "GET",
            data: opts.data
        }),
        "language": {
            "decimal": "",
            "emptyTable": "No data available in table没有数据",
            "info": "第 _START_ 到 _END_ 条数据，共 _TOTAL_ 条数据",
            "infoEmpty": "共 0 条数据",
            "infoFiltered": "(在 _MAX_ 条数据过滤)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "每页显示 _MENU_ 行",
            "loadingRecords": "数据加载中...",
            "processing": "数据请求中...",
            "search": "搜索:",
            "zeroRecords": "没有发现匹配数据",
            "paginate": {
                "first": "首页",
                "last": "尾页",
                "next": "下一页",
                "previous": "上一页"
            },
            "aria": {
                "sortAscending": ": 正序排列",
                "sortDescending": ": 倒序排列"
            }
        }
    }, opts);
};

//////////////// js方法 ////////////////////////////////////////////////////////////
var getDtCheckboxString = function (value) {
    return "<input type=\"checkbox\" class=\"my-checkbox\" value=\"" + value + "\">";
}
var getDtRadioString = function (value, groupName) {
    return "<input type=\"radio\" name=\"" + groupName + "\" class=\"my-checkbox\" value=\"" + value + "\" >";
}