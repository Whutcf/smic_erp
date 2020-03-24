package com.jshlearn.smicerp.controller;

import com.jshlearn.smicerp.pojo.UserBusiness;
import com.jshlearn.smicerp.service.UserBusinessService;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * @Description 业务字典初始化相关
 * @ClassName UserBusinessController
 * @Author 蔡明涛
 * @Date 2020/3/14 11:59
 **/
@Slf4j
@RestController
@RequestMapping("/userBusiness")
public class UserBusinessController {

    @Resource
    private UserBusinessService userBusinessService;

    @GetMapping("/getBasicData")
    public ResultBean<HashMap<String, List<UserBusiness>>> getBasicData(@RequestParam(value = "keyId") String keyId,
                                                                        @RequestParam(value = "type") String type) {
        List<UserBusiness> userBusinessList = userBusinessService.getBasicData(keyId,type);
        if (userBusinessList.size()>0){
            HashMap<String, List<UserBusiness>> map = new HashMap<>(100);
            map.put("userBusinessList",userBusinessList);
            return ResultBeanUtil.success(map);
        }else {
            log.info(">>>>>>>>>>>>该用户没有任何权限！");
            return null;
        }
    }

}
