package com.example.CandleShop.controller.admin;

import com.example.CandleShop.entity.Order;
import com.example.CandleShop.enums.OrderStatus;
import com.example.CandleShop.enums.PaymentStatus;
import com.example.CandleShop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/admin/orders")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @GetMapping
    public String listOrders(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) OrderStatus status,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate,
            Model model) {

        LocalDateTime fromDateTime = fromDate != null ? fromDate.atStartOfDay() : null;
        LocalDateTime toDateTime = toDate != null ? toDate.atTime(23, 59, 59) : null;

        Page<Order> orderPage = orderService.getOrdersByFilters(
                status, fromDateTime, toDateTime, page, size
        );

        model.addAttribute("orders", orderPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", orderPage.getTotalPages());
        model.addAttribute("orderStatuses", OrderStatus.values());
        model.addAttribute("selectedStatus", status);
        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);

        return "admin/orders/list_orders";
    }

    @GetMapping("/{id}")
    public String viewOrderDetail(@PathVariable Long id, Model model) {
        Order order = orderService.getOrderById(id);
        if (order == null) {
            return "redirect:/admin/orders";
        }

        model.addAttribute("order", order);
        model.addAttribute("orderStatuses", OrderStatus.values());
        model.addAttribute("paymentStatuses", PaymentStatus.values());

        return "admin/orders/order_detail";
    }


    @PostMapping("/{id}/update-status")
    public String updateOrderStatus(
            @PathVariable Long id,
            @RequestParam OrderStatus orderStatus,
            @RequestParam(required = false) PaymentStatus paymentStatus) {

        try {
            // Cập nhật trạng thái đơn hàng
            orderService.updateOrderStatus(id, orderStatus);

            // Cập nhật trạng thái thanh toán nếu có
            if (paymentStatus != null) {
                // Giả sử bạn có phương thức này trong OrderService
                // Nếu không, bạn cần tạo phương thức này
                orderService.updatePaymentStatus(id, paymentStatus);
            }

            // Chuyển hướng về trang chi tiết đơn hàng
            return "redirect:/admin/orders/" + id;
        } catch (Exception e) {
            // Xử lý lỗi nếu cần
            return "redirect:/admin/orders/" + id + "?error=" + e.getMessage();
        }
    }

}
