package com.baizhi.service;

import com.baizhi.entity.User;

import java.util.List;

public interface UserService {

    List<User>  findAll(Integer page,Integer rows);

    Long findTotals();

    void save(User user);

    void delete(String id);

    User findOne(String id);

    void update(User user);

}
