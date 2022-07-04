package com.baizhi.service;

import com.baizhi.dao.UserDAO;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public void save(User user) {
        //生成主键
        user.setId(UUID.randomUUID().toString());
        userDAO.save(user);
    }

    @Override
    public void delete(String id) {
        userDAO.delete(id);
    }

    @Override
    public User findOne(String id) {
        return userDAO.findOne(id);
    }

    @Override
    public void update(User user) {
        userDAO.update(user);
    }

    @Override
    public Long findTotals() {
        return userDAO.findTotals();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<User> findAll(Integer page,Integer rows) {
        int start = (page-1)*rows;
        return userDAO.findAll(start,rows);
    }
}
