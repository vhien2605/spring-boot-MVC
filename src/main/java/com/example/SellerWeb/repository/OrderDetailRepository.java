package com.example.SellerWeb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.SellerWeb.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

}
