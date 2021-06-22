package com.motel.controller;

import com.motel.Serializer.LoginRequest;
import com.motel.entity.User;
import com.motel.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller

public class LoginController {
    @Autowired
    LoginService loginService ;
    @Autowired
    HttpSession session;

    @RequestMapping(value= "login", method = RequestMethod.GET)
    public String login(ModelMap model){
        model.addAttribute("loginRequest", new LoginRequest());
        return "login";
    }
    @RequestMapping(value="login", method = RequestMethod.POST)
    public String login(ModelMap model, @ModelAttribute("loginRequest") LoginRequest loginRequest){
        User user = loginService.checkLoginAdmin(loginRequest.getUsername(), loginRequest.getPassword());
        if (user == null) {
            model.addAttribute("message", "Vui lòng kiểm tra lại tài khoản và mật khẩu!");
            return "login";
        }
        session.setAttribute("loginSession", user);
        return "redirect:home/index.htm";
    }
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logoutAdmin(ModelMap model) {
        session.invalidate();
        return "redirect:login.htm";
    }
}
