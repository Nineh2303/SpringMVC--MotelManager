package com.motel.service;

import com.motel.entity.BillDetail;
import com.motel.entity.rentDetail;

import java.util.List;

public interface RentDetailService {
    List<rentDetail> getAllRentDetail(Integer offset, Integer maxResult);
    List<rentDetail> getRentDetailByStatus(int status);

    boolean insertDetail(rentDetail rentDetail);

    List<rentDetail> getRentDetailFromContractId(String contractId);

    boolean updateRent(rentDetail rent);

    int countRentDetailOfATenant(String tenantId);
}