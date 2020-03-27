package com.jshlearn.smicerp.controller;

import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.pojo.Role;
import com.jshlearn.smicerp.service.RoleService;
import com.jshlearn.smicerp.utils.ErpCustomUtils;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description TODO
 * @ClassName RoleController
 * @Author 蔡明涛
 * @Date 2020/3/21 21:45
 **/
@Slf4j
@RestController
@RequestMapping("/role")
public class RoleController {
    @Resource
    private RoleService roleService;

    @PostMapping("/getRoleNames")
    public List<Map<String,String>> getRoleNames(){
        List<Role> roleList = roleService.getAll();
        List<Map<String,String>> mapList = new ArrayList<>();
        for (Role role : roleList) {
            Map<String,String> map = new HashMap<>(16);
            map.put("value",role.getType());
            map.put("text",role.getName());
            mapList.add(map);
        }
        Map<String,String> map = new HashMap<>(16);
        map.put("value","");
        map.put("text","全部");
        mapList.add(map);
        mapList.forEach(System.out::println);
        return mapList;
    }

    @GetMapping("/list")
    public ResultBean<Map<String,Object>> showRoleDetails(@RequestParam(PageConstants.SEARCH) String search,
                                                          @RequestParam(PageConstants.CURRENT_PAGE) Integer currentPage,
                                                          @RequestParam(PageConstants.PAGE_SIZE) Integer pageSize,
                                                          HttpServletRequest request){
        Role role = (Role) ErpCustomUtils.getClassObject(search, Role.class);
        Map<String,Object> pageRecords = roleService.selectPage(role,currentPage,pageSize);
        return ResultBeanUtil.success(pageRecords);
    }
}
