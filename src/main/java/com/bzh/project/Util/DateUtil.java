package com.bzh.project.Util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    private static String date;
    public DateUtil() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd--HH-mm-ss");//设置日期格式
        this.setDate(df.format(new Date()));
    }

    private void setDate(String date) {
        DateUtil.date = date;
    }

    public String getDate() {
        return date;
    }

}
