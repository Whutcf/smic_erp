package com.jshlearn.smicerp.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

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
}
