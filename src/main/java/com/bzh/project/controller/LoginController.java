package com.bzh.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Enumeration;

@Controller
public class LoginController {

    @RequestMapping("/login")
    public String login() {
        System.out.println("class LoginController login method");
        return "login";
    }

    @RequestMapping("/admin/login")
    public String adminLogin() {
        System.out.println("class LoginController adminLogin method");
        return "admin/login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        Enumeration em = session.getAttributeNames();
        while(em.hasMoreElements()) {
            session.removeAttribute(em.nextElement().toString());
        }
        return "redirect:/login";
    }

}
