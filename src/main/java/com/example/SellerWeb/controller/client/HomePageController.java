package com.example.SellerWeb.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

import com.example.SellerWeb.domain.Product;
import com.example.SellerWeb.service.ProductService;

@Controller
public class HomePageController {
    private final ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/home")
    public String getHomePage(Model model) {
        List<Product> productList = productService.findAllProduct();
        model.addAttribute("productList", productList);
        return "client/homepage/show";
    }

}
