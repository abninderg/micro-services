package com.microservices.services.address.controller;

import com.microservices.services.address.model.AddressDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WebController {
    private AddressDetails addressDetails;

    @Autowired
    public WebController(final AddressDetails addressDetails){
        this.addressDetails=addressDetails;
    }

    @GetMapping("/address")
    public String getAddressDetails(){
        return addressDetails.toString();
    }
}