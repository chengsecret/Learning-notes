package com.baizhi.dao;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDAO {

    List<User> findAll(@Param("start") Integer start,@Param("rows") Integer rows);

    Long findTotals();

    void save(User user);

    void delete(String id);

    User findOne(String id);

    void update(User user);

}
