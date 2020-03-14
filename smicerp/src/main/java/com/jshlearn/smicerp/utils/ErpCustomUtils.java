package com.jshlearn.smicerp.utils;

import com.jshlearn.smicerp.constants.BusinessConstants;
import com.jshlearn.smicerp.pojo.Log;
import com.jshlearn.smicerp.pojo.User;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Date;

/**
 * @Description Erp系统定制工具类
 * @ClassName ObjectUtils
 * @Author 蔡明涛
 * @Date 2020/3/13 20:02
 **/
public class ErpCustomUtils {

    /**
     * 判断一个对象所有属性为空，针对的是对象不为空，但是没有任何属性
     * @param obj 实体对象
     * @return boolean
     * @author 蔡明涛
     * @date 2020/3/13 20:03
     */
    public static boolean isEmptyField(Object obj){
        Field[] fields = obj.getClass().getDeclaredFields();
        for(Field field : fields){
            // 设置私有属性可以访问
            field.setAccessible(true);
            // 获取对象该属性的值
            Object val = null;
            try {
                val = field.get(obj);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
            // 判断是否是静态属性
            boolean isStatic = Modifier.isStatic(field.getModifiers());
            // 只要有一个属性为null 该对象就不为空值对象
            if (!isStatic && val != null){
                return false;
            }
        }
        return true;
    }

    public static Log initialLog(HttpServletRequest request){
        Log logInfo = new Log();
        User user = (User) request.getSession().getAttribute("user");
        if (!StringUtils.isEmpty(user)){
            logInfo.setUserId(user.getId());
        }
        logInfo.setClientIp(HttpUtils.getIpAddress(request));
        logInfo.setCreateTime(new Date());
        logInfo.setStatus(BusinessConstants.USER_OPERATION_SUCCESS);
        return logInfo;
    }
}
