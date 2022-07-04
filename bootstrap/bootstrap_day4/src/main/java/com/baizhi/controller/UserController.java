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


    /**
     * 修改的方法
     */
    @RequestMapping("update")
    @ResponseBody//将控制器方法返回值转为json 并响应给对应请求  底层不再使用fastjson jackson
    public Map<String,Object> update(User user){
        System.out.println("user: "+user);
        Map<String, Object> map = new HashMap<>();
        try{
            userService.update(user);
            map.put("status",true);
            map.put("msg","更新用户信息成功!");
        }catch (Exception e){
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","更新用户信息失败!!!");
        }
        return  map;
    }


    /**
     * 根据id查询一个方法
     */
    @RequestMapping("findOne")
    @ResponseBody
    public User findOne(String id){
        return  userService.findOne(id);
    }

    /**
     * 根据id删除的方法
     */
    @RequestMapping("delete")
    @ResponseBody//将控制器方法返回值转为json 并响应给对应请求  底层不再使用fastjson jackson
    public Map<String,Object> delete(String  id){
        System.out.println("id: "+id);
        Map<String, Object> map = new HashMap<>();
        try{
            userService.delete(id);
            map.put("status",true);
            map.put("msg","删除用户信息成功!");
        }catch (Exception e){
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","删除用户信息失败!!!");
        }
        return  map;
    }

    /**
     * 保存用户方法
     */
    @RequestMapping("save")
    @ResponseBody//将控制器方法返回值转为json 并响应给对应请求  底层不再使用fastjson jackson
    public Map<String,Object> save(User user){
        System.out.println("user: "+user);
        Map<String, Object> map = new HashMap<>();
        try{
            userService.save(user);
            map.put("status",true);
            map.put("msg","保存用户成功!");
        }catch (Exception e){
            e.printStackTrace();
            map.put("status",false);
            map.put("msg","保存用户信息失败!!!");
        }
        return  map;
    }

    /**
     * 查询所有
     */
    @RequestMapping("findAll")
    @ResponseBody
    public List<User> findAll(Model model){
        return userService.findAll();
    }
}
