package com.motel.controller;

import com.motel.entity.Tenant;
import com.motel.service.HomeService;
import com.motel.service.RentDetailService;
import com.motel.service.TenantService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("tenant")

public class TenantController {
    @Autowired
    TenantService tenantService;
    @Autowired
    RentDetailService rentDetailService;
    @Autowired
    HomeService homeService ;
    @Autowired
    HttpSession session ;
@Autowired
SessionFactory factory ;
    @RequestMapping("index")
    public String index(ModelMap model, Integer offset, Integer maxResult){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        List<Tenant>list =tenantService.getActiveTenant(offset, maxResult);
        model.addAttribute("tenant" , list) ;
        return "tenant/index" ;
    }
    @RequestMapping("all")
    public String getAll(ModelMap model, Integer offset, Integer maxResult, HttpServletRequest request){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        int stt;
        try{
            String status  =request.getParameter("status");
            stt = Integer.parseInt(status);
        } catch(Exception e)  {
          stt= -1 ;
        }
        if(stt==-1){
        List<Tenant>list =tenantService.getAllTenant(offset, maxResult);
        model.addAttribute("status", stt);
        model.addAttribute("tenant" , list) ;
        return "tenant/showAllTenant" ;
        }
        else {
            List<Tenant>list =tenantService.getTenantByStatus(stt,offset, maxResult);
            model.addAttribute("status", stt);
            model.addAttribute("tenant" , list) ;
            return "tenant/showAllTenant" ;
        }
    }
    @RequestMapping("show_tenant/{CMND}")
    public String showTenant(ModelMap model, @PathVariable("CMND") String CMND){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session = factory.openSession();
        Tenant tenant =  (Tenant) session.get(Tenant.class, CMND);
        int numRent =  rentDetailService.countRentDetailOfATenant(CMND) ;
        model.addAttribute("tenant" , tenant) ;
        model.addAttribute("count", numRent);
        return "tenant/show_tenant";
    }
    @RequestMapping(value= "remove/{CMND}")
    public String removeRoom(ModelMap model, @PathVariable("CMND") String CMND,Integer offset, Integer maxResults) {
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        boolean check = tenantService.removeTenant(CMND);
        if (check) {
            List<Tenant> listTenant = tenantService.getAllTenant(offset, maxResults);
            model.addAttribute("tenant", listTenant);
            model.addAttribute("delete_message", "Xóa phòng thành công");
        } else {
            List<Tenant> listTenant = tenantService.getAllTenant(offset, maxResults);
            model.addAttribute("tenant", listTenant);
            model.addAttribute("delete_message", "Xóa phòng thất bại!");
        }
        return "tenant/index";
    }
    @RequestMapping(value= "update/{CMND}" , method=RequestMethod.GET)
    public String updateRoom(ModelMap model, @PathVariable("CMND") String CMND){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session =  factory.openSession();
        Tenant tenant  =  (Tenant) session.get(Tenant.class, CMND) ;
        model.addAttribute("tenant", tenant);
        model.addAttribute("CMND", tenant.getCMND());
        return "tenant/tenant_update" ;
    }
    @RequestMapping(value="update/{CMND}", method=RequestMethod.POST)
    public String updateRoom(ModelMap model, @PathVariable("CMND") String CMND, HttpServletRequest request , Integer offset, Integer maxResults){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session =  factory.openSession();
        Tenant tenant  =  (Tenant) session.get(Tenant.class, CMND) ;
        String name = request.getParameter("name");
        String date = request.getParameter("birthDay");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String numberPhone = request.getParameter("numberPhone");
        Date birthDay = java.sql.Date.valueOf(LocalDate.parse(date));
        tenant.setName(name);
        tenant.setBirthDay(birthDay);
        tenant.setGender(gender);
        tenant.setAddress(address);
        tenant.setNumberPhone(numberPhone);
        boolean check =  tenantService.updateTenant(tenant,session) ;
        model.addAttribute("tenant", tenant);
        if (check) {
            model.addAttribute("message", "Cập nhật thành công");
        } else {
            model.addAttribute("fmessage", "Cập nhật thất bại!");
        }
        return "tenant/tenant_update" ;
    }
} 

