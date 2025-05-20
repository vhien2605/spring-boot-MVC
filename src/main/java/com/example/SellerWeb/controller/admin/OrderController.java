package com.example.SellerWeb.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.SellerWeb.domain.Order;
import com.example.SellerWeb.domain.OrderDetail;
import com.example.SellerWeb.service.OrderService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrders(Model model) {
        List<Order> orders = this.orderService.getAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getViewOrderDetail(Model model, @PathVariable("id") Long id) {
        Order order = this.orderService.findOrderById(id);
        List<OrderDetail> orderDetails = order.getOrderDetails();
        model.addAttribute("orderDetails", orderDetails);
        model.addAttribute("orderId", id);
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/{id}/update")
    public String getUpdateOrderPage(@PathVariable("id") Long orderId, Model model) {
        Order order = orderService.findOrderById(orderId);
        model.addAttribute("newOrder", order);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/{id}/update")
    public String postUpdateOrder(@PathVariable("id") Long id, @ModelAttribute("newOrder") Order formOrder) {
        Order newOrder = this.orderService.findOrderById(id);
        this.orderService.handleUpdateOrder(newOrder, formOrder);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/{id}/delete")
    public String getDeleteOrderPage(@PathVariable("id") Long id, Model model) {
        model.addAttribute("Id", id);
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/{id}/delete")
    public String postDeleteOrder(@PathVariable("id") Long id, Model model) {
        this.orderService.handleDeleteOrderById(id);
        return "redirect:/admin/order";
    }
}
