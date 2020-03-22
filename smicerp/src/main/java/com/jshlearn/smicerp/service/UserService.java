package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.User;

import java.util.List;

/**
 * @author 蔡明涛
 */
public interface UserService {
    /**
     * 确认用户信息
     * @param user 用户实体对象
     * @return int
     * @author 蔡明涛
     * @date 2020/3/12 21:38
     */
    int validateUser(User user) throws Exception;

    /**
     * 根据用户姓名获取用户信息
     * @param userName 用户名
     * @return com.jshlearn.smicerp.pojo.User
     * @author 蔡明涛
     * @date 2020/3/12 21:37
     */
    User getUserByName(String userName);

    /**
     * 根据用户名获取用户ID
     * @param userName 用户名
     * @return java.lang.Long
     * @author 蔡明涛
     * @date 2020/3/13 20:26
     */
    Long getUserIdByUserName(String userName);

    /**
     *  根据Id获取用户
     * @param userId 用户Id
     * @return com.jshlearn.smicerp.pojo.User
     * @author 蔡明涛
     * @date 2020/3/14 19:19
     */
    User getUserById(Long userId);

    /**
     * 保存用户
     * @param user
     * @return java.lang.Integer
     * @author 蔡明涛
     * @date 2020/3/14 20:13
     */
    Integer updateUser(User user);

    /**
     * 获取用户总数
     * @return int
     * @author 蔡明涛
     * @date 2020/3/15 15:57
     */
    int getUserCount();

    /**
     * 获取所有用户信息
     * @return java.util.List<com.jshlearn.smicerp.pojo.User>
     * @author 蔡明涛
     * @date 2020/3/21 23:19
     */
    List<User> getAll();
}
