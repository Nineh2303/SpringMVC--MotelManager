package com.motel.controller;

import com.motel.entity.*;
import com.motel.service.BillService;
import com.motel.service.RentDetailService;
import com.motel.service.RoomService;
import com.motel.service.serviceService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("bill")

public class BillController {
    @Autowired
    SessionFactory factory;
    @Autowired
    com.motel.service.serviceService serviceService;
    @Autowired
    RoomService roomService;
    @Autowired
    BillService billService;
    @Autowired
    HttpSession session ;
    @RequestMapping("index")
    public String index(ModelMap model, HttpServletRequest request) {
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session = factory.openSession();
        try {
            String tDate = request.getParameter("toDate");
            String fDate = request.getParameter("fromDate");
            Date toDate = java.sql.Date.valueOf(LocalDate.parse(tDate));
            Date fromDate = java.sql.Date.valueOf(LocalDate.parse(fDate));
            System.out.println(toDate);
            System.out.println(fromDate);
            List<Bill> list = billService.searchBillByDate(fromDate, toDate);
            model.addAttribute("bill", list);
            return "bill/index";
        } catch (Exception e) {

            String hql = "from Bill";
            Query query = session.createQuery(hql);
            List<Bill> list = query.list();
            model.addAttribute("bill", list);
            return "bill/index";
        }

    }

    @RequestMapping(value = "create-bill/{roomId}")
    public String createBill(ModelMap model, @PathVariable("roomId") String roomId, RedirectAttributes red) {
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session = factory.openSession();
        Contract contract = roomService.getActiveContractFromRoomId(roomId);
        Room room = (Room) session.get(Room.class, roomId);
        if (contract == null) {
            red.addAttribute("roomId", roomId).addFlashAttribute("message", "Phòng chưa có hợp đồng thuê , không thể tạo hoá đơn");
            return "redirect:/room/showroom/{roomId}.htm";
        }
        List<Service> service = serviceService.getActiveService();
        model.addAttribute("service", service);
        model.addAttribute("roomId", roomId);
        return "bill/createBill";
    }


    @RequestMapping(value = "create-bill/{roomId}", method = RequestMethod.POST)
    public String createBill(ModelMap model, @PathVariable("roomId") String roomId, HttpServletRequest request) {
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        Bill bill = new Bill();
        Room room = (Room) session.get(Room.class, roomId);
        float total = room.getPrice();
        Contract contract = roomService.getActiveContractFromRoomId(roomId);
        String date = request.getParameter("date");
        Date payDate = java.sql.Date.valueOf(LocalDate.parse(date));
        String billId = "Hoadon_" + roomId + "_" + date;
        bill.setContract(contract);
        bill.setBillId(billId);
        bill.setStatus(0);
        bill.setDate(payDate);
        try {
            session.save(bill);
            t.commit();
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("fmessage", "Thêm hoá đơn thất bại");
            model.addAttribute("roomId", roomId);
            return "bill/createBill";
        } finally {
            session.close();
        }
        List<Service> service = serviceService.getActiveService();
        for (Service ser : service) {
            Session sessionTwo = factory.openSession();
            Transaction tran = sessionTwo.beginTransaction();
            String attr = ser.getServiceId();
            String value = request.getParameter(attr); //
            float val = Float.parseFloat(value);
            if (val >0) {
                float price = val * ser.getPrice();
                total += price;
                BillDetail billD = new BillDetail();
                billD.setBill(bill);
                billD.setService(ser);
                billD.setCount(val);
                billD.setPrice(ser.getPrice());
                billD.setTotal(val*ser.getPrice());
                try {
                    sessionTwo.save(billD);
                    tran.commit();
                } catch (Exception e) {
                    tran.rollback();
                    model.addAttribute("service", service);
                    model.addAttribute("roomId", roomId);
                    model.addAttribute("fmessage", "Thêm hoá đơn thất bại");
                    return "bill/createBill";
                } finally {
                    sessionTwo.close();
                }
            }
        }
        Session sessionTwo = factory.openSession();
        Transaction tran = sessionTwo.beginTransaction();
        try {

            bill.setMoney(total);
            sessionTwo.update(bill);
            tran.commit();
        } catch (Exception e) {
            tran.rollback();
            model.addAttribute("fail", "Thêm hoá đơn thất bại");
            model.addAttribute("service", service);
            model.addAttribute("roomId", roomId);
            return "bill/createBill";
        } finally {
            sessionTwo.close();
        }
        model.addAttribute("message", "Thêm hoá đơn thành công   ");
        model.addAttribute("service", service);
        model.addAttribute("roomId", roomId);
        return "bill/createBill";
    }

    @RequestMapping(value = "bill-detail/{billId}")
    public String billDetail(ModelMap model, @PathVariable("billId") String billId) {
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session = factory.openSession();
        Bill bill = (Bill) session.get(Bill.class, billId);
        Room room = (Room) session.get(Room.class, bill.getContract().getRoomId());
        List<BillDetail> list = billService.getAllServiceOffTheBill(billId);
        model.addAttribute("bill", bill);
        model.addAttribute("price", room.getPrice());
        model.addAttribute("list", list);
        return "bill/show";
    }

    @RequestMapping(value = "payment/{billId}")
    public String payForBill(ModelMap model, @PathVariable("billId") String billId, RedirectAttributes red) {
        if (session.getAttribute("loginSession") == null) {
            return "redirect:/login.htm";
        }
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        Bill bill = (Bill) session.get(Bill.class, billId);
        if (bill.getStatus() == 1) {
            red.addAttribute("billId", billId).addFlashAttribute("message", "Hoá đơn thanh toán thành công");
            return "redirect:/bill/bill-detail/{billId}.htm";
        } else {
            try {
                bill.setStatus(1);
                session.update(bill);
                t.commit();
                red.addAttribute("billId", billId).addFlashAttribute("message", "Hoá đơn thanh toán thành công");
                return "redirect:/bill/bill-detail/{billId}.htm";
            } catch (Exception e) {
                t.rollback();
                red.addAttribute("billId", billId).addFlashAttribute("message", "Hoá đơn thanh toán thất bại");
                return "redirect:/bill/bill-detail/{billId}.htm";
            } finally {
                session.close();
            }
        }
    }
}

