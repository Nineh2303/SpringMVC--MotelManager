package com.motel.controller;

import com.motel.entity.Home;
import com.motel.service.HomeService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("motel")
public class MotelController {
    @Autowired
    HomeService homeService ;
    @Autowired
    SessionFactory factory ;
    @Autowired
    HttpSession session ;
    @RequestMapping("index")
    public String home(ModelMap model , Integer offset, Integer maxResult) {
//        if (session.getAttribute("loginSession") == null) {
//            return "redirect:/login.htm";
//        }
        List<Home> listhome = homeService.getAllHome(offset,maxResult) ;
        model.addAttribute("home", listhome) ;
        return "motel/index" ;
    }
    @RequestMapping(value= "insert" , method= RequestMethod.GET)
    public String insertHome(ModelMap model) {
        model.addAttribute("insertHome", new Home() );
        return "motel/home_form" ;
    }
    @RequestMapping(value="insert" , method= RequestMethod.POST)
    public String insertHome(ModelMap model, @ModelAttribute("insertHome") Home home ){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        boolean check =  homeService.insertHome(home) ;
        if (check) {
            model.addAttribute("success_message", "Thêm mới thành công!");
        } else {
            model.addAttribute("fail_message", "Thêm mới thất bại!");
        }
        return "motel/home_form" ;
    }
    @RequestMapping(value="update/{homeId}", method = RequestMethod.GET)
    public String updateHome(ModelMap model , @PathVariable("homeId") String homeId){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session = factory.openSession();
        Home home = (Home) session.get(Home.class, homeId) ;
        model.addAttribute("home" , home) ;
        return "motel/update_form" ;
    }
    @RequestMapping(value="update/{homeId}", method = RequestMethod.POST)
    public String updateHome(ModelMap model , @ModelAttribute("updateHome") Home home,Integer offset, Integer maxResult){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        boolean check = homeService.updateHome(home) ;
        if (check) {
            model.addAttribute("update_message", "Cập nhật thành công!");
            List<Home> listhome = homeService.getAllHome(offset,maxResult) ;
            model.addAttribute("home", listhome) ;
        } else {
            model.addAttribute("update_message", "Cập nhật thất bại!");
            List<Home> listhome = homeService.getAllHome(offset,maxResult) ;
            model.addAttribute("home", listhome) ;
        }
        return "motel/index" ;
    }
    @RequestMapping(value="remove/{homeId}")
    public String removeHome(ModelMap model, @PathVariable("homeId") String homeId,Integer offset, Integer maxResult) {
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        boolean check = homeService.removeHome(homeId);
        if (check) {
            model.addAttribute("delete_message", "Xóa thành công!");
            List<Home> listhome = homeService.getAllHome(offset,maxResult) ;
            model.addAttribute("home", listhome) ;
        } else {
            model.addAttribute("delete_message", "Xóa thất bại!");
            List<Home> listhome = homeService.getAllHome(offset,maxResult) ;
            model.addAttribute("home", listhome) ;
        }
        return "motel/index" ;
    }
}
