package com.motel.Serializer;

import com.motel.entity.Bill;
import com.motel.entity.Service;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class BillId  implements Serializable {

   private Bill bill ;

    private Service service ;

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
}
