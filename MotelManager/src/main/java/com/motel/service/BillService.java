package com.motel.service;

import com.motel.entity.Bill;
import com.motel.entity.BillDetail;

import java.util.Date;
import java.util.List;

public interface BillService {
    List<BillDetail> getAllServiceOffTheBill(String billId);
    List<Bill>  searchBillByDate (Date fromDate , Date toDate);

}
