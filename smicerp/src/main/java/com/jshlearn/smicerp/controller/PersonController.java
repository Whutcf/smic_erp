package com.jshlearn.smicerp.controller;

import com.jshlearn.smicerp.constants.ExceptionConstants;
import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.pojo.Person;
import com.jshlearn.smicerp.service.LogService;
import com.jshlearn.smicerp.service.PersonService;
import com.jshlearn.smicerp.utils.ErpCustomUtils;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @Description TODO
 * @ClassName PersonController
 * @Author 蔡明涛
 * @Date 2020/3/21 20:33
 **/
@Slf4j
@RestController
@RequestMapping("/person")
public class PersonController {
    @Resource
    private PersonService personService;

    @Resource
    private LogService logService;

    @GetMapping("/list")
    public ResultBean<Map<String, Object>> showPersonDetails(@RequestParam(PageConstants.SEARCH) String search,
                                                             @RequestParam(PageConstants.CURRENT_PAGE) Integer currentPage,
                                                             @RequestParam(PageConstants.PAGE_SIZE) Integer pageSize,
                                                             HttpServletRequest request) {
        Person person = (Person) ErpCustomUtils.getClassObject(search, Person.class);
        Map<String, Object> pageRecords = personService.selectPage(person, currentPage, pageSize);
        return ResultBeanUtil.success(pageRecords);
    }

    @PostMapping("/add")
    public ResultBean<Person> add(@RequestParam(PageConstants.INFO) String info, HttpServletRequest request) {
        Person person = (Person) ErpCustomUtils.getClassObject(info, Person.class);
        int i = personService.savePerson(person);
        if (i == -1){
            return ResultBeanUtil.error(ExceptionConstants.PERSON_ADD_FAILED_CODE,"该用户已经有"+person.getType()+"角色");
        }
        return i > 0 ? ResultBeanUtil.success() : ResultBeanUtil.error(ExceptionConstants.PERSON_ADD_FAILED_CODE, ExceptionConstants.PERSON_ADD_FAILED_MSG);
    }

    @PostMapping("/update")
    public ResultBean<Person> update(@RequestParam(PageConstants.INFO) String info, @RequestParam(PageConstants.ID) Long id, HttpServletRequest request) {
        Person person = (Person) ErpCustomUtils.getClassObject(info, Person.class);
        boolean flag = personService.updatePerson(id,person.getType());
        return flag  ? ResultBeanUtil.success() : ResultBeanUtil.error(ExceptionConstants.PERSON_EDIT_FAILED_CODE, ExceptionConstants.PERSON_EDIT_FAILED_MSG);
    }

    // TODO 删除接口需要等财务相关模块完成
}
