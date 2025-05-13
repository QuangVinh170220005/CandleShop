package com.example.CandleShop.service;

import com.example.CandleShop.entity.Order;
import com.example.CandleShop.entity.Payment;
import com.example.CandleShop.entity.PaymentMethod;
import com.example.CandleShop.enums.PaymentStatus;
import com.example.CandleShop.repository.PaymentMethodRepository;
import com.example.CandleShop.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private OrderService orderService;
    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    @Transactional
    public Payment createPayment(Order order, PaymentMethod paymentMethod) {
        Payment payment = new Payment();
        payment.setOrder(order);
        payment.setPaymentMethod(paymentMethod);
        payment.setAmount(order.getFinalAmount());
        payment.setStatus("PENDING");
        payment.setCreatedAt(LocalDateTime.now());
        return paymentRepository.save(payment);
    }

    @Transactional
    public Payment updatePaymentStatus(Long paymentId, String status) {
        return getPayment(paymentId, status, paymentRepository, orderService);
    }
    public Payment save(Payment payment) {
        return paymentRepository.save(payment);
    }

    static Payment getPayment(Long paymentId, String status, PaymentRepository paymentRepository, OrderService orderService) {
        Payment payment = paymentRepository.findById(paymentId)
                .orElseThrow(() -> new RuntimeException("Payment not found"));
        payment.setStatus(status);
        payment.setUpdatedAt(LocalDateTime.now());

        if ("SUCCESS".equals(status)) {
            Order order = payment.getOrder();
            order.setPaymentStatus(PaymentStatus.PAID);
            orderService.save(order);
        }

        return paymentRepository.save(payment);
    }
    public Payment findByOrderId(Long orderId) {
        return (Payment) paymentRepository.findByOrderId(orderId);
    }

    public List<PaymentMethod> getAllActive() {
        return List.of();
    }
}
