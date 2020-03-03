package com.bzh.project.service;


import com.bzh.project.mapper.UserMapper;
import com.bzh.project.model.User;
import org.springframework.stereotype.Service;

@Service
public class UserService  {

    private final UserMapper userMapper;

    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User get(Integer id) {
        User user = new User();
        user.setId(id);
        return userMapper.get(user);
    }
}
