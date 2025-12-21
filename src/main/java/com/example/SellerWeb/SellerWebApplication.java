package com.example.SellerWeb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication()
public class SellerWebApplication {
    public static void main(String[] args) {
         SpringApplication.run(SellerWebApplication.class, args);
         System.out.println("server is running at http:://localhost:8080");
    }
}
