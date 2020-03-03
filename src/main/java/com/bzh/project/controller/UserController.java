package com.bzh.project.controller;


import com.bzh.project.model.User;
import com.bzh.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
//@Controller
public class UserController {

    @Autowired
    private UserService userService;

//    @ResponseBody
    @RequestMapping("/get")
    public String get(Integer id){
        User user = userService.get(id);
        return user.toString();
    }
}
