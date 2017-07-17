/**
 *
 * Created by Slash on 2017/7/17.
 */
var layuiHelper = {

    LayerMsg: function () {
       return{
           title:"提示",
           icon:0,
           msg:"你没有输入内容",
           cb_Ok:"",
           cb_Cancel:"",
           show:function () {
               var msgJson=[];
               var cb_Ok=this.cb_Ok;
               var cb_Cancel=this.cb_Cancel;
               if(this.cb_Cancel==""){
                   msgJson={
                       title:this.title,
                       offset:'15%',
                       icon:this.icon,
                       btn:['确定'],
                       yes:function (index) {
                           if(cb_Ok!=undefined&&cb_Ok!=""){
                               cb_Ok();
                           }
                           layer.close();
                       }
                   }
               }else if(cb_Ok==undefined&&cb_Ok!=""&&cb_Cancel!=undefined&&cb_Cancel!=""){
                   msgJson={
                       title:this.title,
                       offset:'15%',
                       icon:this.icon,
                       btn:['取消'],
                       yes:function (index) {
                           if(cb_Cancel!=undefined&&cb_Cancel!=""){
                               cb_Cancel();
                           }
                           layer.close();
                       }
                   }
               }else{
                   msgJson={
                       title:this.title,
                       offset:'15%',
                       icon:this.icon,
                       btn:['确定','取消'],
                       yes:function (index) {
                           if(cb_Ok!=undefined&&cb_Ok!=""){
                               cb_Ok();
                           }
                           layer.close();
                       },btn2:function (index, layero) {
                           if(cb_Cancel!=undefined&&cb_Cancel!=""){
                               cb_Cancel();
                           }
                           layer.close();
                       }
                   }
               }
               var msg = this.msg;
               layui.use('layer',function () {
                   layui.layer.confirm(msg,msgJson);
               })
           }
       }
    },

    LayTable:function () {
        return{
            tablePanel:"",
            tableSkin:"",
            seqEnable:true,
            rowColor:[{ color: "#F8F8F8"}],
            column:[{
                title:"",
                code:"",
                width:80,
                style:"",
                visible:true,
                edit:{
                    show:true,
                    width:120,
                    type:"txt",     //select,radio,checkbox
                    data:[{
                        name:"",
                        value:""
                    }],
                    dataKey:{       //自定义数据集
                        nameKey:"",
                        valueKey:""
                    }
                },
                valueDeal:function (value) {
                    return value;
                }
            }],
            edit:"",
            editSetting:{
                flag:1,//0：编辑，1：新增
                splitChar:",",
                size:{
                    width:300,
                    height:400,
                    nameWidth:120
                },
                cb_OK:undefined
            },
            delete:"",
            data:[],
            pageIndex:1,
            pageSize:10,
            dataCount:0,
            selectDataByPageIndex:function (index) {

            },
            getRowData:function (index) {
                return this.data[index];
            },
            paging:layuiHelper.LayPaging(),
            createTable:function () {
                var tableID = "layuiTable"+layuiHelper.Common.getTimestamp();
                var layerMsg=layuiHelper.LayerMsg();
                var width=0;
                var colGroupHtml="";
                var theadHtml="";

                if(this.seqEnable){
                    width=50;
                    colGroupHtml="<col style='50'>";
                    theadHtml="<th>序号</th>";
                }
                var column=this.column;
                var column
            }
        }
    },
    LayPaging:function () {
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