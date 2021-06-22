package com.motel.service;

import com.motel.entity.Contract;
import com.motel.entity.rentDetail;

import java.util.Date;
import java.util.List;

public interface ContractService {
    public List<Contract> isAvailableContract(Integer offset, Integer maxResult) ;
    public List<Contract> allContract(Integer offset, Integer maxResult) ;
    public boolean insertContract(Contract contract) ;
    public boolean checkOutForContract(rentDetail rent, Date checkOutDate) ;
    public Contract getActiveContractInARoom(String roomId) ;
 }
