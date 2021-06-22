package com.motel.controller;


import com.motel.entity.Service;
import com.motel.service.serviceService;
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
@RequestMapping("service")

public class ServiceController {
    @Autowired
    SessionFactory factory ;
    @Autowired
    serviceService serviceService;
    @Autowired
    HttpSession session ;

    @RequestMapping("index")
    public String index(ModelMap model){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        List<Service> service =  serviceService.getAllService();
        model.addAttribute("service" , service) ;
        return "service/index" ;
    }
    @RequestMapping(value= "insert", method = RequestMethod.GET)
    public String  insert(ModelMap model){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
            model.addAttribute("insertService" , new Service()) ;
            return "service/service_form" ;
    }
    @RequestMapping(value= "insert", method = RequestMethod.POST)
    public String  insert(ModelMap model, @ModelAttribute("insertService") Service service){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        model.addAttribute("service" , new Service()) ;
        boolean check = serviceService.insertService(service);
        if (check) {
            model.addAttribute("message", "Thêm mới thành công!");
        } else {
            model.addAttribute("fmessage", "Thêm mới thất bại!");
        }
        return "service/service_form";
    }
    @RequestMapping(value ="update/{serviceId}" , method =  RequestMethod.GET)
    public String updateService(ModelMap model , @PathVariable("serviceId") String serviceId) {
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session = factory.openSession();
        Service service =  (Service) session.get(Service.class, serviceId) ;
        model.addAttribute("service", service);
        return "service/service_update";
    }
    @RequestMapping(value="update/{serviceId}", method=RequestMethod.POST)
    public String updateService(ModelMap model, @ModelAttribute("updateService") Service service){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        boolean check = serviceService.updateService(service) ;
        if(check) {
            model.addAttribute("message" , "Cập nhật thành công") ;
        }
        else{
            model.addAttribute("fupdate_message" , "Cập nhật thất bại ") ;
        }
        model.addAttribute("service", service);
        return "service/service_update" ;
    }


    @RequestMapping(value="changeStatus/{serviceId}")
    public String changeStatusService(ModelMap model , @PathVariable("serviceId") String serviceId){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        boolean check = serviceService.changeStatusService(serviceId);
        if (check) {
            model.addAttribute("message", "Cập nhật thành công!");
        } else {
            model.addAttribute("fmessage", "Cập nhật thất bại!");
        }

        List<Service> service =  serviceService.getAllService();
        model.addAttribute("service" , service) ;
        return "service/index" ;

    }
}
