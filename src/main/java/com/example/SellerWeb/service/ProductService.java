package com.example.SellerWeb.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.SellerWeb.domain.Cart;
import com.example.SellerWeb.domain.CartDetail;
import com.example.SellerWeb.domain.Product;
import com.example.SellerWeb.domain.User;
import com.example.SellerWeb.repository.CartDetailRepository;
import com.example.SellerWeb.repository.CartRepository;
import com.example.SellerWeb.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.cartRepository = cartRepository;
        this.userService = userService;
    }

    public void handleSaveProduct(Product product) {
        this.productRepository.save(product);
    }

    public List<Product> findAllProduct() {
        return this.productRepository.findAll();
    }

    public Product findProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(Long id, Long productId, HttpSession session, Long qt) {
        User user = this.userService.getUserById(id);
        if (user != null) {
            // check user đã có cart chưa. Nếu chưa thì create
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                cart = new Cart();
                cart.setUser(user);
                cart.setSum(0);
                this.cartRepository.save(cart);
            }

            // tạo cartdetail và save
            Product product = this.findProductById(productId);
            CartDetail cartDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
            if (cartDetail == null) {
                cartDetail = new CartDetail();
                cartDetail.setQuantity(qt);
                cartDetail.setCart(cart);
                cartDetail.setProduct(product);
                cartDetail.setPrice(product.getPrice());
                // Chỉ update số lượng sum của cart khi có new product
                cart.setSum(cart.getSum() + 1);
                session.setAttribute("cartSum", cart.getSum());
                this.cartRepository.save(cart);
            } else {
                cartDetail.setQuantity(cartDetail.getQuantity() + qt);
            }
            this.cartDetailRepository.save(cartDetail);
        }
    }

    public long handleCountProduct() {
        return this.productRepository.count();
    }
}
