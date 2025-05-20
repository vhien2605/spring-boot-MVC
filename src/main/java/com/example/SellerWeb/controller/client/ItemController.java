package com.example.SellerWeb.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.SellerWeb.domain.Product;
import com.example.SellerWeb.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetail(@PathVariable("id") long prodId, Model model) {
        Product product = productService.findProductById(prodId);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    @PostMapping("/add-to-cart/{id}")
    public String postAddToCart(@PathVariable("id") long prodId, HttpServletRequest request,
            @RequestParam("quantity") Long qt) {
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        if (qt > 0) {
            this.productService.handleAddProductToCart(id, prodId, session, qt);
        }
        return "redirect:/home";
    }
}
