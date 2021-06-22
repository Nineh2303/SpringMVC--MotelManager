package com.motel.Serializer;

import com.motel.entity.Contract;
import com.motel.entity.Tenant;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

public class rentDetailId implements Serializable {


    private String contractId;

    private String CMND;

    public String getContractId() {
        return contractId;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }

    public String getCMND() {
        return CMND;
    }

    public void setCMND(String CMND) {
        this.CMND = CMND;
    }
}
