package com.jshlearn.smicerp.utils;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description 日期工具类
 * @ClassName DateUtil
 * @Author 蔡明涛
 * @date 2020.03.01 10:57
 */
public class DateUtils {

    /**
     * @Description 将传入的时间戳转化成String类型的日期
     * @Param time 毫秒数
     * @return java.lang.String
     * @Author 蔡明涛
     * @Date 2020.03.01 11:12
     **/
    public static String getDate(long time){
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        Instant instant = Instant.ofEpochMilli(time);
        LocalDateTime dateTime = LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
        return timeFormatter.format(dateTime);
    }

    /**
     * @Description 获取指定日期格式的当前时间
     * @return java.lang.String
     * @Author 蔡明涛
     * @Date 2020.03.01 11:36
     **/
    public static String getCurrentDateTime() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    /**
     * 获取当天日期
     * @return java.lang.String
     * @author 蔡明涛
     * @date 2020.03.01 17:37
     **/
    public static String getCurrentDate(){
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    /**
     * 获取每月的第一天
     * @param today 当天的日期 LocalDate.now()
     * @return java.lang.String
     * @author 蔡明涛
     * @date 2020/3/22 17:25
     */
    public static String getFirstDayOfMonth(LocalDate today){
        LocalDate firstDay = LocalDate.of(today.getYear(),today.getMonth(),1);
        return firstDay.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public static String getLastDayOfMonth(LocalDate today){
        LocalDate lastDay = today.with(TemporalAdjusters.lastDayOfMonth());
        return lastDay.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    /**
     *  根据传入的参数获取倒退i个月的月份 ex. 2020-03
     * @param i 几个月
     * @return java.util.List<java.lang.String>
     * @author 蔡明涛
     * @date 2020/3/22 17:38
     */
    public static List<String> getMonthsFromNow(Long i){
        LocalDate today = LocalDate.now();
        List<String> monthList = new ArrayList<>();
        for (long j = i-1; j >= 0; j--) {
            monthList.add(today.minusMonths(j).format(DateTimeFormatter.ofPattern("yyyy-MM")));
        }
        return  monthList;
    }

}
