    /**
        * @Desc
        * Created by Slash on 2017/6/9.
        */

    var str = {};
var verify = {};
var bindKeyEvent = {};

//判断是否不为空
verify.isNotEmpty = function (value) {
    return value == "" ? false : true;
};

//判断是否小于长度
verify.isMaxLong = function (value, len) {
    return str.GetRealLenth(value) > len ? false : true;
};

//判断是否超过长度
verify.isMinShort = function (value, len) {
    return str.GetRealLenth(value) < len ? false : true;
};

//判断日期类型是否为YYYY-MM-DD格式的类型
verify.isDate = function (value) {
    var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

//判断日期类型是否为YYYY-MM-DD hh:mm:ss格式的类型
verify.isDateTime = function (value) {
    var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};
//判断日期类型是否为hh:mm:ss格式的类型
verify.isTime = function (value) {
    var reg = /^((20|21|22|23|[0-1]\d)\:[0-5][0-9])(\:[0-5][0-9])?$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

//判断输入的字符是否为英文字母
verify.isLetter = function (value) {
    var reg = /^[a-zA-Z]+$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

//判断输入的字符是否为整数
verify.isInteger = function (value) {
    var reg = /^[-+]?\d*$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

//判断输入的字符是否为双精度
verify.isDouble = function (value) {
    var reg = /^[-\+]?\d+(\.\d+)?$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

//判断输入的字符是否为:a-z,A-Z,0-9
verify.isString = function (value) {
    var reg = /^[a-zA-Z0-9_]+$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

//判断输入的字符是否为中文
verify.isChinese = function (value) {
    var reg = /^[\u0391-\uFFE5]+$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

//判断输入的EMAIL格式是否正确
verify.isEmail = function (value) {
    var reg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

//判断是否为手机号码
verify.isPhone = function (value) {
    var reg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

//判断是否为身份证
verify.isID = function (value) {
    var reg = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

//判断是否为字符数字组合
verify.isLetterAndNumber = function (value) {
    var reg = /^[A-Za-z0-9]+$/;
    var r = value.match(reg);
    if (r == null)
        return false;
    return true;
};

/**
 * 获取字符串实际长度
 * @param value
 * @returns {number}
 * @constructor
 */
str.GetRealLenth = function (value) {
    ///<summary>获得字符串实际长度，中文2，英文1</summary>
    ///<param name="str">要获得长度的字符串</param>
    var realLength = 0, len = value.length, charCode = -1;
    for (var i = 0; i < len; i++) {
        charCode = value.charCodeAt(i);
        if (charCode >= 0 && charCode <= 128)
            realLength += 1;
        else
            realLength += 2;
    }
    return realLength;
}
bindKeyEvent.Amount = function (obj) {
    obj.keyup(function () {
        var reg = $(this).val().match(/\d+\.?\d{0,2}/);
        var txt = '';
        if (reg != null) {
            txt = reg[0];
        }
        $(this).val(txt);
    }).change(function () {
        $(this).keypress();
        var v = $(this).val();
        if (/\.$/.test(v)) {
            $(this).val(v.substr(0, v.length - 1));
        }
    });
}