package com.example.SellerWeb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.SellerWeb.domain.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUserId(Long id);
}
