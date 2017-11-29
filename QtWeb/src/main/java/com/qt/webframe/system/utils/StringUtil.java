package com.qt.webframe.system.utils;

import java.text.DateFormat;
import java.util.Date;

/**
 * @Desc
 * Created by Slash on 2017/6/8.
 */
public class StringUtil {

    public static String o2String(Object o) {
        return o == null ? "" : o.toString();
    }

    public static String dateTime2DateString(Date date) {
        return date==null?"":DateFormat.getDateInstance().format(date);
    }

    public static String dateTime2TimeString(Date date) {
        return date==null?"":DateFormat.getTimeInstance().format(date);
    }
}
