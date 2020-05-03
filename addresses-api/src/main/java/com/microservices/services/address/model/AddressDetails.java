package com.microservices.services.address.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties("address-details")
@Getter
@Setter

public class AddressDetails {
    private String firstLine;
    private String postCode;

    @Override
    public String toString() {
        return "AddressDetails{" +
                "firstLine='" + firstLine + '\'' +
                ", postCode='" + postCode + '\'' +
                '}';
    }
}
