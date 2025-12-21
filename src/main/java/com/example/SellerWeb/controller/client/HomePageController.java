package com.example.SellerWeb.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/shop")
    public String getProduct(
            Model model,
            @RequestParam(required = false) String target,
            @RequestParam(required = false) Double maxPrice,
            @RequestParam(required = false) String keyword) {
        if (maxPrice == null)
            maxPrice = Double.MAX_VALUE;

        List<Product> productList;

        if (keyword != null && !keyword.isBlank()) {
            productList = productService.searchByName(keyword);
        } else if (target != null) {
            productList = productService.findByTargetAndPrice(target, maxPrice);
        } else {
            productList = productService.findByPrice(maxPrice);
        }

        model.addAttribute("productList", productList);
        return "client/homepage/shop";
    }

}
