package com.example.SellerWeb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.SellerWeb.service.OrderService;
import com.example.SellerWeb.service.ProductService;
import com.example.SellerWeb.service.UserService;

@Controller
public class DashboardController {
    private final UserService userService;
    private final OrderService orderService;
    private final ProductService productService;

    public DashboardController(UserService userService, OrderService orderService, ProductService productService) {
        this.userService = userService;
        this.orderService = orderService;
        this.productService = productService;
    }

    @GetMapping("/admin")
    public String getDashBoard(Model model) {
        model.addAttribute("usersCount", this.userService.handleCountUser());
        model.addAttribute("productsCount", this.productService.handleCountProduct());
        model.addAttribute("ordersCount", this.orderService.handleCountOrder());
        return "admin/dashboard/show";
    }
}
