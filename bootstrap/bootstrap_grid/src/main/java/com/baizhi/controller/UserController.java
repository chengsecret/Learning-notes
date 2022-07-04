package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping("edit")
    @ResponseBody//将控制器方法返回值转为json 并响应给对应请求  底层不再使用fastjson jackson
    public Map<String, Object> edit(User user, String oper) {
        System.out.println("user: " + user);
        //System.out.println("dept: " + user.getDept().getId() );
        Map<String, Object> map = new HashMap<>();
        try {
            if ("add".equals(oper)) {//添加
                userService.save(user);
            }
            if ("edit".equals(oper)) {//修改
                userService.update(user);
            }
            if ("del".equals(oper)) {//删除
                userService.delete(user.getId());
            }
            map.put("status", true);
            map.put("msg", "更新用户信息成功!");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", false);
            map.put("msg", "更新用户信息失败!!!");
        }
        return map;
    }


    /**
     * 修改的方法
     */
    @RequestMapping("update")
    @ResponseBody//将控制器方法返回值转为json 并响应给对应请求  底层不再使用fastjson jackson
    public Map<String, Object> update(User user) {
        System.out.println("user: " + user);
        Map<String, Object> map = new HashMap<>();
        try {
            userService.update(user);
            map.put("status", true);
            map.put("msg", "更新用户信息成功!");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", false);
            map.put("msg", "更新用户信息失败!!!");
        }
        return map;
    }


    /**
     * 根据id查询一个方法
     */
    @RequestMapping("findOne")
    @ResponseBody
    public User findOne(String id) {
        return userService.findOne(id);
    }

    /**
     * 根据id删除的方法
     */
    @RequestMapping("delete")
    @ResponseBody//将控制器方法返回值转为json 并响应给对应请求  底层不再使用fastjson jackson
    public Map<String, Object> delete(String id) {
        System.out.println("id: " + id);
        Map<String, Object> map = new HashMap<>();
        try {
            userService.delete(id);
            map.put("status", true);
            map.put("msg", "删除用户信息成功!");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", false);
            map.put("msg", "删除用户信息失败!!!");
        }
        return map;
    }

    /**
     * 保存用户方法
     */
    @RequestMapping("save")
    @ResponseBody//将控制器方法返回值转为json 并响应给对应请求  底层不再使用fastjson jackson
    public Map<String, Object> save(User user) {
        System.out.println("user: " + user);
        Map<String, Object> map = new HashMap<>();
        try {
            userService.save(user);
            map.put("status", true);
            map.put("msg", "保存用户成功!");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", false);
            map.put("msg", "保存用户信息失败!!!");
        }
        return map;
    }

    /**
     * 查询所有
     */
    @RequestMapping("findAll")
    @ResponseBody
    public Map<String, Object> findAll(Integer page, Integer rows) {
        Map<String, Object> map = new HashMap<>();

        //当前页数据
        List<User> lists = userService.findAll(page, rows);
        //总条数
        Long totals = userService.findTotals();
        //总页数
        Long totalPage = totals % rows == 0 ? totals / rows : totals / rows + 1;

        map.put("page", page);
        map.put("rows", lists);
        map.put("total", totalPage);
        map.put("records", totals);

        return map;
    }
}
