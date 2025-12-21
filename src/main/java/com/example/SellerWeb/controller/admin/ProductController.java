package com.example.SellerWeb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.SellerWeb.domain.Product;
import com.example.SellerWeb.service.DeleteFileService;
import com.example.SellerWeb.service.ProductService;
import com.example.SellerWeb.service.UploadService;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

@Controller
public class ProductController {
    private final UploadService uploadService;
    private final ProductService productService;
    private final DeleteFileService deleteFileService;

    public ProductController(UploadService uploadService, ProductService productService,
            DeleteFileService deleteFileService) {
        this.uploadService = uploadService;
        this.productService = productService;
        this.deleteFileService = deleteFileService;
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetail(@PathVariable("id") long proId, Model model) {
        Product product = this.productService.findProductById(proId);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/create")
    public String getProductCreatePage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProduct(@ModelAttribute("newProduct") @Valid Product product, BindingResult bindingResult,
            @RequestParam("productFile") MultipartFile file) {
        System.out.println(product.getName());
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getObjectName() + " " + error.getDefaultMessage());
        }
        if (bindingResult.hasErrors()) {
            return "/admin/product/create";
        }
        String fileImageName = this.uploadService.handleSaveUploadFile(file, "product");
        product.setImage(fileImageName);
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product")
    public String getProducts(Model model) {
        List<Product> products = this.productService.findAllProduct();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/{id}/update")
    public String getUpdateProductPage(@PathVariable("id") Long prodId, Model model) {
        Product currentProduct = this.productService.findProductById(prodId);
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/{id}/update")
    public String postUpdateProduct(@PathVariable("id") Long id, Model model,
            @RequestParam("productFile") MultipartFile multipartFile,
            @ModelAttribute("newProduct") Product newProduct) {
        Product currentProduct = this.productService.findProductById(id);
        currentProduct.setName(newProduct.getName());
        currentProduct.setPrice(newProduct.getPrice());
        currentProduct.setDetailDesc(newProduct.getDetailDesc());
        currentProduct.setShortDesc(newProduct.getShortDesc());
        currentProduct.setQuantity(newProduct.getQuantity());
        currentProduct.setTarget(newProduct.getTarget());
        currentProduct.setFactory(newProduct.getFactory());
        String image = currentProduct.getImage();
        if (!multipartFile.isEmpty()) {
            this.deleteFileService.handleDeleteFile(currentProduct.getImage(), "product");
            String newImageName = this.uploadService.handleSaveUploadFile(multipartFile, "product");
            image = newImageName;
        }
        currentProduct.setImage(image);
        this.productService.handleSaveProduct(currentProduct);
        return "redirect:/admin/product/" + id;
    }

    @GetMapping("/admin/product/{id}/delete")
    public String getDeleteProductPage(@PathVariable("id") Long prodId, Model model) {
        model.addAttribute("Id", prodId);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/{id}/delete")
    public String postDeleteProduct(@PathVariable("id") Long prodId) {
        Product product = this.productService.findProductById(prodId);
        String imageName = product.getImage();
        this.deleteFileService.handleDeleteFile(imageName, "product");
        this.productService.deleteById(prodId);
        return "redirect:/admin/product";
    }
}
