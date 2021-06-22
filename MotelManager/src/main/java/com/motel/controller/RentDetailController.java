package com.motel.controller;

import com.motel.entity.Contract;
import com.motel.entity.Room;
import com.motel.entity.Tenant;
import com.motel.entity.rentDetail;
import com.motel.service.ContractService;
import com.motel.service.RentDetailService;
import com.motel.service.RoomService;
import com.motel.service.TenantService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("rent_detail")
public class RentDetailController {

    @Autowired
    SessionFactory factory;
    @Autowired
    RentDetailService rentDetailService;
    @Autowired
    TenantService tenantService;
    @Autowired
    ContractService contractService;
    @Autowired
    RoomService roomService;
    @Autowired
    HttpSession session;

    @RequestMapping("index")
    public String index(ModelMap model, HttpServletRequest request) {
        int status;
        try {
            String stt = request.getParameter("status");
            status = Integer.parseInt(stt);
        } catch (Exception e) {
            status = -1;
        }
        if (status == -1) {
            Session session = factory.openSession();
            String hql = "from rentDetail";
            Query query = session.createQuery(hql);
            List<rentDetail> list = query.list();
            model.addAttribute("rent", list);
            return "rent/index";
        } else {
            List<rentDetail> list = rentDetailService.getRentDetailByStatus(status) ;
            model.addAttribute("rent", list);
            return "rent/index";
        }
    }
    @RequestMapping("/show/rent-id={rentId}")
    public String showDetail(ModelMap model, @PathVariable("rentId") String rentId) {
        Session session = factory.openSession();
        rentDetail rent = (rentDetail) session.get(rentDetail.class, rentId);
        model.addAttribute("rent", rent);
        return "rent/showRentDetail";
    }

    @RequestMapping("check-out/rent-id={rentId}")
    public String checkOut(ModelMap model, @PathVariable("rentId") String rentId) {
        Session session = factory.openSession();
        rentDetail rent = (rentDetail) session.get(rentDetail.class, rentId);
        Date checkOut = rent.getCheckOutDate();
        if (checkOut != null) {
            model.addAttribute("message", "Phiếu thuê này đã hết hạn");
            model.addAttribute("rent", rent);
            return "rent/checked";
        }
        model.addAttribute("rent", rent);
        return "rent/checkout";
    }

    @RequestMapping(value = "check-out/rent-id={rentId}", method = RequestMethod.POST)
    public String checkOut(ModelMap model, HttpServletRequest request, @PathVariable("rentId") String rentId) {
        boolean isCheckout = false;

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        String date = request.getParameter("checkOutDate");
        rentDetail rent = (rentDetail) session.get(rentDetail.class, rentId);
        Date checkOut = rent.getCheckOutDate();
        if (checkOut != null) {
            model.addAttribute("update-message", "Phiếu thuê này đã trả phòng");
            isCheckout = true;
            model.addAttribute("check", isCheckout);
            return "rent/showRentDetail";
        }
        if (date.isEmpty()) {
            model.addAttribute("rent", rent);
            model.addAttribute("message", "Vui lòng nhập vào một ngày");
            return "rent/checkout";
        } else {
            Date checkOutDate = java.sql.Date.valueOf(LocalDate.parse(date));
            rent.setCheckOutDate(checkOutDate);
            rent.setStatus(0);
            boolean updateRent = rentDetailService.updateRent(rent);
            if (!updateRent) {
                model.addAttribute("rent", rent);
                model.addAttribute("update_message", " Cập nhật thất bại ");
                return "rent/showRentDetail";
            }

            boolean checkOutContract = contractService.checkOutForContract(rent, checkOutDate);
            boolean checkOutTenant = tenantService.checkOutForTenant(rent);
            Room room = (Room) session.get(Room.class, rent.getContract().getRoomId());
            session.close();
            boolean roomStatus = roomService.updateStatusRoom(room);

            if (checkOutTenant && checkOutContract && roomStatus) {

                model.addAttribute("rent", rent);
                model.addAttribute("message", " Cập nhật thành công ");
                return "rent/showRentDetail";
            } else {
                model.addAttribute("rent", rent);
                model.addAttribute("fmessage", " Cập nhật thất bại ");
                return "rent/showRentDetail";
            }
        }
    }

}
