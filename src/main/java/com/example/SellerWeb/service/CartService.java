package com.example.SellerWeb.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.SellerWeb.domain.Cart;
import com.example.SellerWeb.domain.CartDetail;
import com.example.SellerWeb.domain.Order;
import com.example.SellerWeb.domain.OrderDetail;
import com.example.SellerWeb.domain.User;
import com.example.SellerWeb.repository.CartDetailRepository;
import com.example.SellerWeb.repository.CartRepository;
import com.example.SellerWeb.repository.OrderDetailRepository;
import com.example.SellerWeb.repository.OrderRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class CartService {

    private final CartDetailRepository cartDetailRepository;
    private final CartRepository cartRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public CartService(CartDetailRepository cartDetailRepository, UserService userService,
            CartRepository cartRepository, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.cartRepository = cartRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
    }

    public List<CartDetail> getAllCartDetail(HttpSession session) {
        Long userId = (Long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(userId);
        if (currentUser != null) {
            Cart cart = this.cartRepository.findByUser(currentUser);
            if (cart != null) {
                return cart.getCartDetails();
            } else {
                return new ArrayList<CartDetail>();
            }
        }
        return null;
    }

    public long getTotalSumOfCart(List<CartDetail> cartDetails) {
        long sum = 0;
        for (CartDetail cartDetail : cartDetails) {
            sum += cartDetail.getProduct().getPrice() * cartDetail.getQuantity();
        }
        return sum;
    }

    // Item trong cart là 1 cart detail
    public void handleDeleteCartDetailFromCart(Long id, HttpSession session) {
        CartDetail deletedCartDetail = this.cartDetailRepository.findById(id).get();
        Cart cart = deletedCartDetail.getCart();
        this.cartDetailRepository.delete(deletedCartDetail);
        if (cart.getSum() > 1) {
            cart.setSum(cart.getSum() - 1);
            this.cartRepository.save(cart);
            session.setAttribute("cartSum", cart.getSum());
        } else {
            this.cartRepository.delete(cart);
            session.setAttribute("cartSum", 0);
        }
    }

    public void handlePlaceOrder(HttpSession session, String receiverName, String receiverAddress,
            String receiverPhone) {
        Long userId = (Long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(userId);
        // handle create order detail
        Cart cart = this.cartRepository.findByUser(currentUser);
        if (cart != null) {
            double totalPrice = 0;
            List<CartDetail> cartDetails = cart.getCartDetails();
            // handle create new order
            Order newOrder = new Order();
            newOrder.setUser(currentUser);
            newOrder.setReceiverName(receiverName);
            newOrder.setReceiverAddress(receiverAddress);
            newOrder.setReceiverPhone(receiverPhone);
            newOrder.setStatus("Pending");
            for (CartDetail cartDetail : cartDetails) {
                totalPrice += cartDetail.getQuantity() * cartDetail.getPrice();
                newOrder.setTotalPrice(totalPrice);
            }
            newOrder = this.orderRepository.save(newOrder);
            // handle create OrderDetail
            for (CartDetail cartDetail : cartDetails) {
                // setter for new CartDetail instance
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setPrice(cartDetail.getPrice());
                orderDetail.setQuantity(cartDetail.getQuantity());
                orderDetail.setOrder(newOrder);
                orderDetail.setProduct(cartDetail.getProduct());
                this.orderDetailRepository.save(orderDetail);
                // delete CartDetail
                this.cartDetailRepository.delete(cartDetail);
            }
            // delete cart
            this.cartRepository.delete(cart);
            // update session for render cart info
            session.setAttribute("cartSum", 0);
        }
    }
}
