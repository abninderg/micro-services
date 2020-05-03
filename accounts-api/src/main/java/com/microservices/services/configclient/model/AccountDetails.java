package com.microservices.services.configclient.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties("account-details")
@Getter
@Setter
public class AccountDetails {

    private String firstName;
    private String sortCode;
    private String accountNumber;

    @Override
    public String toString() {
        return "AccountDetails{" +
                "firstName='" + firstName + '\'' +
                ", sortCode='" + sortCode + '\'' +
                ", accountNumber='" + accountNumber + '\'' +
                '}';
    }
}
