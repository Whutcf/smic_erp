package com.jshlearn.smicerp.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Description 通用工具类
 * @ClassName CommonUtils
 * @Author 蔡明涛
 * @Date 2020/3/14 18:47
 **/
public class CommonUtils {

    /**
     * 获取一个字符创的MD5
     * @param msg 传入的字符串
     * @return java.lang.String
     * @author 蔡明涛
     * @date 2020/3/14 19:11
     */
    public static String md5Encryp(String msg) throws NoSuchAlgorithmException {
        // 生成一个MD5加密计算摘要
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        // 计算md5函数
        md5.update(msg.getBytes());
        return new BigInteger(1, md5.digest()).toString(16);
    }

    /**
     * 利用set去重
     * @param list 带重复数据的list
     * @return java.util.List<org.apache.poi.ss.formula.functions.T>
     * @author 蔡明涛
     * @date 2020/3/26 19:55
     */
    public static List<String> distinctListWithSet(List<String> list){
        if (null != list &&list.size()>0){
            Set<String> set = new HashSet<>(list);
            return new ArrayList<>(set);
        }
        return null;
    }

    /**
     * 保持原有顺序去重方法1
     * @param list 带重复数据的list
     * @return java.util.List<org.apache.poi.ss.formula.functions.T>
     * @author 蔡明涛
     * @date 2020/3/26 19:57
     */
    public static List<String> delRepeatWithTreeSet(List<String> list){
        return new ArrayList<>(new TreeSet<>(list));
    }

    /**
     * 保持原有顺序去重方法二
     * @param list 带重复数据的list
     * @return java.util.List<org.apache.poi.ss.formula.functions.T>
     * @author 蔡明涛
     * @date 2020/3/26 19:57
     */
    public static List<String> delRepeatWithLinkedHashSet(List<String> list){
        return new ArrayList<>(new LinkedHashSet<>(list));
    }

    /**
     * 利用Java8的特性去重
     * @param list 重复list
     * @return java.util.List<org.apache.poi.ss.formula.functions.T>
     * @author 蔡明涛
     * @date 2020/3/26 20:03
     */
    public static List<String> delRepeatWithJava8(List<String> list){
      return list.stream().distinct().collect(Collectors.toList());
    }
}
