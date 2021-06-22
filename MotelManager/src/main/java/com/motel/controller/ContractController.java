package com.motel.controller;

import com.motel.entity.Bill;
import com.motel.entity.Contract;
import com.motel.entity.rentDetail;
import com.motel.service.ContractService;
import com.motel.service.RentDetailService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("contract")
public class ContractController {
    @Autowired
    SessionFactory factory ;
    @Autowired
    RentDetailService rentDetailService ;
    @Autowired
    ContractService contractService;
    @Autowired
    HttpSession session ;
    @RequestMapping("index")
    public String availableContract(ModelMap model,Integer offset, Integer maxResult){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session = factory.openSession();
        List<Contract> list  = contractService.isAvailableContract(offset, maxResult);
        model.addAttribute("contract" , list) ;
        return "contract/index" ;
    }
    @RequestMapping("/all")
    public String allContract(ModelMap model,Integer offset, Integer maxResult){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session = factory.openSession();
        List<Contract> list  = contractService.allContract(offset, maxResult);
        int status ;
        model.addAttribute("contract" , list) ;
        return "contract/all-contract" ;
    }
    @RequestMapping("contractId={contractId}")
    public String showRentDetail(ModelMap model, @PathVariable("contractId") String contractId){
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        List<rentDetail> list = rentDetailService.getRentDetailFromContractId(contractId);
        model.addAttribute("rent" , list) ;
        return "rent/rentOfContract";
    }
}
