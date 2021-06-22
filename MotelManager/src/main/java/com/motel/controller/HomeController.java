package com.motel.controller;


import com.motel.service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("home")
public class HomeController {
    @Autowired
    LoginService loginService;
    @Autowired
    HttpSession session ;

    @RequestMapping("index")
        public String home() {
        if (session.getAttribute("loginSession") != null) {
            return "home";
        }
        return "redirect:/login.htm";

    }
}
