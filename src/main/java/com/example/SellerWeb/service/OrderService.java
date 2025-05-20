package com.example.SellerWeb.service;

import java.net.http.HttpClient;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.SellerWeb.domain.Order;
import com.example.SellerWeb.domain.OrderDetail;
import com.example.SellerWeb.repository.OrderDetailRepository;
import com.example.SellerWeb.repository.OrderRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> getAllOrders() {
        return this.orderRepository.findAll();
    }

    public Order findOrderById(Long id) {
        return this.orderRepository.findById(id).get();
    }

    public void handleUpdateOrder(Order newOrder, Order formOrder) {
        newOrder.setStatus(formOrder.getStatus());
        this.orderRepository.save(newOrder);
    }

    public void handleDeleteOrderById(Long id) {
        Order order = this.findOrderById(id);
        // delete all orderdetail
        List<OrderDetail> orderDetails = order.getOrderDetails();
        for (OrderDetail od : orderDetails) {
            this.orderDetailRepository.deleteById(od.getId());
        }
        // delete order
        this.orderRepository.deleteById(id);
    }

    public long handleCountOrder() {
        return this.orderRepository.count();
    }

    public List<Order> getAllOrderByUser(HttpSession session) {
        Long userId = (Long) session.getAttribute("id");
        return this.orderRepository.findByUserId(userId);
    }
}
