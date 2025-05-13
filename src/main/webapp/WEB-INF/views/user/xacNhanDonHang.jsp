<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác nhận đơn hàng - Candle Shop</title>
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .order-confirmation {
            max-width: 800px;
            margin: 0 auto;
        }
        .order-header {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .order-items {
            margin-bottom: 30px;
        }
        .order-item {
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        .order-summary {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<jsp:include page="layouts/nav.jsp" />

<div class="container my-5">
    <div class="order-confirmation">
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success text-center mb-4">${successMessage}</div>
        </c:if>

        <div class="text-center mb-4">
            <i class="bi bi-check-circle-fill text-success" style="font-size: 4rem;"></i>
            <h2 class="mt-3">Cảm ơn bạn đã đặt hàng!</h2>
            <p class="text-muted">Đơn hàng của bạn đã được xác nhận.</p>
        </div>

        <div class="order-header">
            <div class="row">
                <div class="col-md-6">
                    <h5>Thông tin đơn hàng</h5>
                    <p>Mã đơn hàng: <strong>${order.orderNumber}</strong></p>
                    <p>Ngày đặt: <strong><fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm" /></strong></p>
                    <p>Trạng thái: <strong>${order.orderStatus}</strong></p>
                    <p>Trạng thái thanh toán: <strong>${order.paymentStatus}</strong></p>
                </div>
                <div class="col-md-6">
                    <h5>Thông tin giao hàng</h5>
                    <p>Người nhận: <strong>${order.shippingName}</strong></p>
                    <p>Số điện thoại: <strong>${order.shippingPhone}</strong></p>
                    <p>Địa chỉ: <strong>${order.shippingAddress}</strong></p>
                </div>
            </div>
        </div>

        <h5>Chi tiết đơn hàng</h5>
        <div class="order-items">
            <c:forEach items="${order.orderItems}" var="item">
                <div class="order-item">
                    <div class="row">
                        <div class="col-md-8">
                            <h6>${item.product.name}</h6>
                            <p class="text-muted">Kích thước: ${item.productSize.size}</p>
                            <p class="text-muted">Số lượng: ${item.quantity}</p>
                        </div>
                        <div class="col-md-4 text-end">
                            <p><fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/> x ${item.quantity}</p>
                            <p class="fw-bold"><fmt:formatNumber value="${item.subtotal}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="order-summary">
            <div class="row mb-2">
                <div class="col-6">Tạm tính:</div>
                <div class="col-6 text-end"><fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></div>
            </div>
            <div class="row mb-2">
                <div class="col-6">Phí vận chuyển:</div>
                <div class="col-6 text-end"><fmt:formatNumber value="${order.shippingFee}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></div>
            </div>
            <c:if test="${order.discountAmount > 0}">
                <div class="row mb-2">
                    <div class="col-6">Giảm giá:</div>
                    <div class="col-6 text-end">-<fmt:formatNumber value="${order.discountAmount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></div>
                </div>
            </c:if>
            <hr>
            <div class="row fw-bold">
                <div class="col-6">Tổng cộng:</div>
                <div class="col-6 text-end"><fmt:formatNumber value="${order.finalAmount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></div>
            </div>
        </div>

        <div class="text-center mt-5">
            <a href="/" class="btn btn-primary">Tiếp tục mua sắm</a>
            <a href="/user/orders" class="btn btn-outline-secondary ms-2">Xem đơn hàng của tôi</a>
        </div>
    </div>
</div>

<jsp:include page="layouts/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
