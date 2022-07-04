package com.baizhi.dao;

import com.baizhi.entity.User;

import java.util.List;

public interface UserDAO {

    List<User> findAll();

    void save(User user);

    void delete(String id);

    User findOne(String id);

    void update(User user);

}
