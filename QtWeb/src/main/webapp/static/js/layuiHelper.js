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
            tablePanelID:"",
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
                type:1,//0：编辑，1：新增
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
                var ifContinue=true;
                if(this.seqEnable){
                    width=50;
                    colGroupHtml="<col style='50'>";
                    theadHtml="<th>序号</th>";
                }
                var column=this.column;
                for(var i=0;i<column.length;i++){
                    if (column[i].title==undefined){
                        column[i].title="";
                    }
                    if(column[i].code==undefined||column[i].code==""){
                        layerMsg.msg="第" + (i + 1) + "列的取值编码不能为空！";
                        layerMsg.show();
                        ifContinue=false;
                        break;
                    }
                    if(column[i].visible!=undefined){
                        if(column[i].visible==false){
                            continue;
                        }
                    }
                    if(column[i].edit!=undefined){
                        if(this.edit==""){
                            layerMsg.msg="您启用了编辑列，却没有设置编辑保存事件";
                            layerMsg.show();
                            ifContinue=false;
                            break;
                        }
                    }
                    var columnWidth=column[i].width==undefined?80:column[i].width;
                    width+=columnWidth;
                    colGroupHtml+="<col width='"+columnWidth+"'>";
                    theadHtml+="<th style='"+(column[i].style==undefined?"":column[i].style)+"'>"+column[i].title+"</th>";
                }
                if(this.edit!=""||this.delete!=""){
                    width+=120;
                    colGroupHtml+="<col width='120'>";
                    theadHtml+="<th></th>";
                }
                var tbodyHtml="";
                if(this.data!=undefined&&this.data!=null&&ifContinue){
                    if(this.data.length>0){
                        for(var i=0;i<this.data.length;i++){
                            tbodyHtml+="<tr id='"+tableID+"tr_"+i+"'>";
                            if(this.seqEnable){
                                tbodyHtml+="<td style='text-align:center;'>"+((parseFloat(this.pageIndex)-1)*this.pageSize+i+1)+"</td>";
                            }
                            for(var j=0;j<column.length;j++){
                                if(column[j].visible!=undefined){
                                    if(column[j]==false){
                                        continue;
                                    }
                                }
                                tbodyHtml+="<td style=\"cursor:pointer;word-break:normal|break-all|keep-all;"+(column[j].style==undefined?"":column[j].style)+"\">";
                                var value="";
                                if(column[j].valueDeal!=undefined){
                                    value=column[j].valueDeal(this.data[i][column[j].code]);
                                }else{
                                    value=this.data[i][column[j].code];
                                }
                                tbodyHtml+=(value==null?"":value)+"</td>";
                            }
                            if(this.edit!=""||this.delete!=""){
                                tbodyHtml+="<td>";
                                if(this.edit!=""){
                                    tbodyHtml+="<button class='layui-btn layui-btn-normal layui-btn-mini' onclick='"+this.edit+"("+i+")'><i class='layui-icon'>&#xe642;</i></button>";
                                }
                                if(this.delete!=""){
                                    tbodyHtml+="<button class='layui-btn layui-btn-normal layui-btn-mini' onclick='"+this.delete+"("+i+")'><i class='layui-icon'>&#xe640;</i></button>";
                                }
                                tbodyHtml+="</td>";
                            }
                            tbodyHtml+="</tr>";
                        }
                    }
                }
                if(this.laypage.pagePanelID==""){
                    this.laypage.pagePanelID=new Date().getTime();
                }
                var html="<div style='width:"+(width<430?430:width)+"px;'>"
                +"<table id='"+tableID+"' class='layui-table' lay-skin='"+this.tableSkin==""?"":this.tableSkin+"'> "
                +"<colgroup" +colGroupHtml +"</colgroup>"
                +"<thead><tr>"+theadHtml+"</tr></thead>"
                +"<tbody>"+tbodyHtml+"</tbody>"
                +"</table>"
                +"<div id='"+this.laypage.pagePanelID+"'></div></div>";
                if(ifContinue){
                    $("#"+this.tablePanelID).html(html);
                    if(this.dataCount>0){
                        this.laypage.pageIndex=this.pageIndex;
                        this.laypage.pages=this.pageSize;
                        this.laypage.dataCount=this.dataCount;
                        this.laypage.selectDataByPageIndex=this.selectDataByPageIndex;
                        this.laypage.createPage();
                    }
                }
                if(this.rowColor!=undefined){
                    var rowColor=this.rowColor;
                    $("#"+this.tablePanelID+" tbody tr").mouseleave(function () {
                        $(this).css("background-color","#ffffff");
                    });
                    $("#"+this.tablePanelID+" tbody tr").mousemove(function () {
                        var count=parseInt($(this).attr("id").split('_')[1])+1;
                        var length=rowColor.length;
                        var num=count-parseInt(count/length)*length;
                        $(this).css("backgroud-color",rowColor[num].color);
                    });
                }
            },
            createEditMode:function () {
                var type = 1;//编辑模式 0：编辑，1：新增
                var dataIndex = 1;
                var cb_OK = function () {

                };
                var size={
                    width:400,
                    height:0,
                    nameWidth:120
                }
                if(this.editSetting.type!=undefined||this.editSetting.type!=null||this.editSetting.type!=""){
                    type=this.editSetting.type;
                }
                if(this.editSetting.dataIndex!=undefined||this.editSetting.dataIndex!=null||this.editSetting.dataIndex!=""){
                    dataIndex=this.editSetting.dataIndex;
                }
                if(this.editSetting.cb_OK!=undefined){
                    cb_OK=this.editSetting.cb_OK;
                }
                if(this.editSetting.size!=undefined){
                    if(this.editSetting.size.width!=undefined){
                        size.width = this.editSetting.size.width;
                    }
                    if(this.editSetting.size.height!=undefined){
                        size.height = this.editSetting.size.height;
                    }
                    if(this.editSetting.size.nameWidth!=undefined){
                        size.nameWidth = this.editSetting.size.nameWidth;
                    }
                }
                var editModeID = new Date().getTime();
                var Column = this.column;
                var json=[];
                if(type==0){
                    json=this.getRowData(dataIndex);
                }
                var maxValWidth=0;
                var ifContinue=true;
                var editModeHtml="<div id='editMode_"+editModeID+"' style='margin-bottom:15px;'>";

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