package com.example.SellerWeb.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.SellerWeb.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product findById(long id);

    Product save(Product product);

    Page<Product> findAll(Pageable page);

    void deleteById(long id);
}