package com.example.SellerWeb.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.SellerWeb.domain.CartDetail;
import com.example.SellerWeb.domain.Order;
import com.example.SellerWeb.service.CartService;
import com.example.SellerWeb.service.OrderService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {
    private final CartService cartService;
    private final OrderService orderService;

    public CartController(CartService cartService, OrderService orderService) {
        this.cartService = cartService;
        this.orderService = orderService;
    }

    @GetMapping("/cart")
    public String getCartPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        List<CartDetail> cartDetails = cartService.getAllCartDetail(session);
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalCartPrice", this.cartService.getTotalSumOfCart(cartDetails));
        return "client/cart/show";
    }

    @PostMapping("/delete-from-cart/{id}")
    public String postDeleteFromCart(@PathVariable("id") Long cartDetailId, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.cartService.handleDeleteCartDetailFromCart(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckout(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        List<CartDetail> cartDetails = cartService.getAllCartDetail(session);
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalCartPrice", this.cartService.getTotalSumOfCart(cartDetails));
        return "client/cart/checkout";
    }

    @PostMapping("/place-order")
    public String postPlaceOrder(HttpServletRequest request, @RequestParam("name") String targetName,
            @RequestParam("address") String targetAddress, @RequestParam("phone") String targetPhone) {
        HttpSession session = request.getSession(false);
        this.cartService.handlePlaceOrder(session, targetName, targetAddress, targetPhone);
        return "redirect:/cart/thankyou";
    }

    @GetMapping("/cart/thankyou")
    public String getThanksPage() {
        return "client/cart/thankyou";
    }

    @GetMapping("order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        List<Order> orders = this.orderService.getAllOrderByUser(session);
        model.addAttribute("orders", orders);
        return "client/cart/history";
    }

}
