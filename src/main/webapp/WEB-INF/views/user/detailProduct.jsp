<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name}- Candle Shop</title>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        brown: {
                            600: '#8b5a2b',
                            700: '#6d4621',
                        }
                    }
                }
            }
        }
    </script>
    <style>
        /* detailProduct.css */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            margin-top: 20%;
            background-color: #fff;
            color: #333;
        }

        .container {
            max-width: 1800px; /* Tăng kích thước tối đa lên nhiều */
            width: 95%; /* Sử dụng 95% chiều rộng của trang */
            margin: 0 auto;
            padding: 0 10px; /* Giảm padding hai bên */
        }

        /* Product Details */
        .product-details {
            display: flex;
            gap: 80px; /* Điều chỉnh khoảng cách */
            margin: 20px 0;
        }

        /* Product Gallery */
        .product-gallery {
            flex: 1.5; /* Tăng tỷ lệ */
            display: flex;
            gap: 20px;
            min-width: 650px; /* Thêm chiều rộng tối thiểu */
        }

        .thumbnail-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
            width: 100px; /* Cố định chiều rộng */
        }

        .thumbnail {
            width: 100px; /* Tăng kích thước */
            height: 100px; /* Cố định chiều cao */
            border: 1px solid #ddd;
            padding: 3px;
            cursor: pointer;
            opacity: 0.7;
            transition: all 0.3s ease;
        }

        .thumbnail.active {
            border-color: #8b5a2b;
            opacity: 1;
        }

        .thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Đảm bảo ảnh lấp đầy không gian */
        }

        .main-image {
            flex: 1;
            border-radius: 8px;
            overflow: hidden;
            width: 550px; /* Cố định chiều rộng */
            height: 550px; /* Cố định chiều cao */
        }

        .main-image img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Đảm bảo ảnh lấp đầy không gian */
            display: block;
        }

        /* Product Info */
        .product-info {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 15px;
            max-width: 800px; /* Thêm kích thước tối đa */
        }

        .product-title {
            font-size: 36px; /* Tăng kích thước */
            font-weight: 700;
            color: #333;
            margin-bottom: 5px;
        }

        .rating {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 5px;
        }

        .stars {
            color: #ffc107;
            font-size: 20px; /* Tăng kích thước */
        }

        .rating-value {
            font-weight: 600;
            font-size: 18px;
        }

        .review-count {
            color: #777;
            font-size: 18px;
        }

        .description {
            line-height: 1.6;
            color: #555;
            margin-bottom: 10px;
            font-size: 18px; /* Tăng kích thước */
        }

        /* Size Options */
        .size-options {
            display: flex;
            gap: 15px;
            margin: 15px 0;
        }

        .size-option {
            padding: 12px 25px; /* Tăng padding */
            background-color: #f0f0f0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px; /* Tăng kích thước */
            transition: all 0.3s ease;
            min-width: 110px; /* Thêm chiều rộng tối thiểu */
            text-align: center;
        }

        .size-option.active {
            background-color: #8b5a2b;
            color: white;
        }

        /* Price */
        .price-container {
            display: flex;
            align-items: center;
            gap: 20px;
            margin: 20px 0;
        }

        .current-price {
            font-size: 32px; /* Tăng kích thước */
            font-weight: 700;
            color: #8b5a2b;
        }

        .original-price {
            font-size: 24px; /* Tăng kích thước */
            color: #999;
            text-decoration: line-through;
        }

        /* Add to Cart */
        .add-to-cart-container {
            display: flex;
            align-items: center;
            gap: 25px;
            margin-top: 20px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 4px;
            height: 50px; /* Tăng chiều cao */
        }

        .quantity-btn {
            width: 50px; /* Tăng kích thước */
            height: 50px;
            background: none;
            border: none;
            font-size: 24px; /* Tăng kích thước */
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .quantity {
            width: 50px; /* Tăng kích thước */
            text-align: center;
            font-size: 20px; /* Tăng kích thước */
            font-weight: 600;
            border: none;
            background: none;
            outline: none;
        }

        .add-to-cart-btn {
            flex: 1;
            padding: 14px 30px; /* Tăng padding */
            background-color: #8b5a2b;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 20px; /* Tăng kích thước */
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            height: 50px; /* Thêm chiều cao cố định */
            display: flex;
            align-items: center;
            justify-content: center;
            max-width: 400px; /* Giới hạn chiều rộng tối đa */
        }

        .add-to-cart-btn:hover {
            background-color: #6d4621;
        }

        /* Favorite Products Section */
        .favorite-products {
            padding: 50px 0;
            background-color: #fff;
        }

        .section-title {
            text-align: center;
            font-size: 34px; /* Tăng kích thước */
            font-weight: 700;
            margin-bottom: 5px;
            color: #333;
        }

        .section-subtitle {
            text-align: center;
            font-size: 18px; /* Tăng kích thước */
            color: #777;
            margin-bottom: 40px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .product-card {
            border-radius: 8px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .product-card a {
            text-decoration: none;
            color: inherit;
        }

        .product-card .product-image {
            width: 100%;
            height: 250px; /* Tăng chiều cao và cố định */
            object-fit: cover; /* Đảm bảo ảnh lấp đầy không gian */
        }

        .product-card .product-info {
            padding: 15px;
            text-align: center;
        }

        .product-card .product-name {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
            color: #333;
        }

        .product-card .product-price {
            font-size: 18px;
            font-weight: 700;
            color: #8b5a2b;
        }

        .see-all-container {
            text-align: center;
            margin-top: 25px;
        }

        .see-all-btn {
            display: inline-block;
            padding: 12px 30px; /* Tăng padding */
            background-color: #f0f0f0;
            color: #333;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 600;
            font-size: 18px; /* Tăng kích thước */
            transition: all 0.3s ease;
        }

        .see-all-btn:hover {
            background-color: #e0e0e0;
        }

        /* Benefits Section */
        .benefits-section {
            padding: 40px 0;
            background-color: #f9f9f9;
        }

        .benefits-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 20px;
        }

        .benefit-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .benefit-item:hover {
            background-color: #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .benefit-icon {
            width: 50px; /* Tăng kích thước */
            height: 50px;
            background-color: #f0f0f0;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #8b5a2b;
            font-size: 22px; /* Tăng kích thước */
        }

        .benefit-content h3 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 3px;
            color: #333;
        }

        .benefit-content p {
            font-size: 16px;
            color: #777;
        }

        /* Responsive */
        @media (max-width: 1400px) {
            .container {
                width: 98%;
            }

            .product-gallery {
                min-width: 550px;
            }

            .main-image {
                width: 450px;
                height: 450px;
            }
        }

        @media (max-width: 992px) {
            .product-details {
                flex-direction: column;
                align-items: center;
            }

            .product-gallery {
                min-width: auto;
                width: 100%;
                max-width: 650px;
            }

            .main-image {
                width: 100%;
                height: 500px;
            }

            .product-info {
                max-width: 650px;
                width: 100%;
            }

            .product-grid {
                grid-template-columns: repeat(3, 1fr);
            }

            .benefits-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 768px) {
            .product-gallery {
                gap: 10px;
            }
            .thumbnail-list {
                width: 80px;
            }
            .thumbnail {
                width: 80px;
                height: 80px;
            }

            .main-image {
                height: 400px;
            }

            .product-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .benefits-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 576px) {
            .thumbnail-list {
                width: 60px;
            }

            .thumbnail {
                width: 60px;
                height: 60px;
            }

            .main-image {
                height: 350px;
            }

            .product-grid {
                grid-template-columns: 1fr;
            }

            .benefits-grid {
                grid-template-columns: 1fr;
            }
        }
        .action-buttons {
            margin-top: 2rem;
        }
    </style>
</head>

<body>
<!-- Header -->
<jsp:include page="layouts/nav.jsp" />

<div class="container">
    <div class="product-details">
        <!-- Product Gallery -->
        <div class="product-gallery">
            <div class="thumbnail-list">
                <c:forEach items="${images}" var="image" varStatus="status">
                    <div class="thumbnail ${status.index == 0 ? 'active' : ''}">
                        <img src="${pageContext.request.contextPath}/uploads/${image.imageUrl}" alt="${product.name} - View ${status.index + 1}">
                    </div>
                </c:forEach>

                <c:if test="${empty images}">
                    <div class="thumbnail active">
                        <img src="${pageContext.request.contextPath}/images/default-product.jpg" alt="${product.name}">
                    </div>
                </c:if>
            </div>
            <div class="main-image">
                <c:choose>
                    <c:when test="${not empty images}"><jsp:useBean id="images" scope="request" type="java.util.List"/>

                        <img src="${pageContext.request.contextPath}/uploads/${images[0].imageUrl}" alt="${product.name}" id="mainProductImage">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/images/default-product.jpg" alt="${product.name}" id="mainProductImage">
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Product Info -->
        <div class="product-info">
            <h1 class="product-title">${product.name}</h1>
            <!-- Rating -->
            <div class="rating">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <span class="rating-value">4.5</span>
                <span class="review-count">110 Reviews</span>
            </div>
            <!-- Description -->
            <p class="description">
                ${product.description}
            </p>
            <!-- Size Options -->
            <div class="size-options">
                <c:forEach items="${sizes}" var="size" varStatus="status">
                    <button class="size-option ${status.index == 0 ? 'active' : ''}"
                            data-size="${size.sizeValue}"
                            data-price="${size.price}"
                            data-size-id="${size.id}">
                            ${size.sizeValue} ml
                    </button>
                </c:forEach>

                <!-- Nếu không có kích thước, hiển thị kích thước mặc định -->
                <c:if test="${empty sizes}">
                    <button class="size-option active" data-size="2333" data-price="${product.basePrice}" data-size-id="0">
                        2333 ml
                    </button>
                </c:if>
            </div>

            <!-- Price -->
            <div class="price-container">
                <c:choose>
                    <c:when test="${not empty sizes}">
                        <span class="current-price" id="current-price">$<fmt:formatNumber value="${sizes[0].price}" pattern="#,##0.00"/></span>
                        <span class="original-price" id="original-price">$<fmt:formatNumber value="${sizes[0].price * 1.08}" pattern="#,##0.00"/></span>
                    </c:when>
                    <c:otherwise>
                        <span class="current-price" id="current-price">$<fmt:formatNumber value="${product.basePrice}" pattern="#,##0.00"/></span>
                        <span class="original-price" id="original-price">$<fmt:formatNumber value="${product.basePrice * 1.08}" pattern="#,##0.00"/></span>
                    </c:otherwise>
                </c:choose>
            </div>


            <!-- Phần chọn số lượng và thêm vào giỏ hàng -->
            <div class="mt-8 space-y-4">
                <!-- Quantity Selector -->


                <!-- Action Buttons -->
                <div class="flex space-x-4">=
                        <button onclick="addToCart()"
                                class="flex-1 bg-brown-600 hover:bg-brown-700 text-white px-6 py-3 rounded-md
                   flex items-center justify-center gap-2 transition-all duration-300">
                            <i class="fas fa-shopping-cart"></i>
                            <span>Thêm vào giỏ hàng</span>
                        </button>=
                    <button class="px-6 py-3 border border-gray-300 rounded-md hover:bg-gray-50
                     flex items-center justify-center space-x-2 transition-colors wishlist-btn">
                        <i class="fas fa-heart"></i>
                        <span>Yêu thích</span>
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Favorite Products Section -->
<section class="favorite-products">
    <div class="container">
        <h2 class="section-title">OUR FAVORITE CANDLES</h2>
        <p class="section-subtitle">TRY OUR BEST CANDLES ACCORDING TO OUR CUSTOMER</p>

        <div class="product-grid">
            <c:forEach items="${favoriteProducts}" var="favProduct" begin="0" end="4">
                <div class="product-card">
                    <a href="${pageContext.request.contextPath}/product/${favProduct.id}">
                        <c:set var="favProductImages" value="${productImageService.getImagesByProductId(favProduct.id)}" />
                        <c:choose>
                            <c:when test="${not empty favProductImages}">
                                <img src="${pageContext.request.contextPath}/uploads/${favProductImages[0].imageUrl}" alt="${favProduct.name}" class="product-image">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/images/default-product.jpg" alt="${favProduct.name}" class="product-image">
                            </c:otherwise>
                        </c:choose>
                        <div class="product-info">
                            <h3 class="product-name">${favProduct.name}</h3>
                            <p class="product-price">$<fmt:formatNumber value="${favProduct.basePrice}" pattern="#,##0.00"/></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>

        <div class="see-all-container">
            <a href="${pageContext.request.contextPath}/shop" class="see-all-btn">See all</a>
        </div>
    </div>
</section>

<!-- Benefits Section -->
<section class="benefits-section">
    <div class="container">
        <div class="benefits-grid">
            <div class="benefit-item">
                <div class="benefit-icon">
                    <i class="fas fa-tag"></i>
                </div>
                <div class="benefit-content">
                    <h3>Best prices</h3>
                    <p>Orders $50 or more</p>
                </div>
            </div>
            <div class="benefit-item">
                <div class="benefit-icon">
                    <i class="fas fa-truck"></i>
                </div>
                <div class="benefit-content">
                    <h3>Free delivery</h3>
                    <p>24/7 amazing services</p>
                </div>
            </div>
            <div class="benefit-item">
                <div class="benefit-icon">
                    <i class="fas fa-percent"></i>
                </div>
                <div class="benefit-content">
                    <h3>Great daily deal</h3>
                    <p>When you sign up</p>
                </div>
            </div>
            <div class="benefit-item">
                <div class="benefit-icon">
                    <i class="fas fa-th-large"></i>
                </div>
                <div class="benefit-content">
                    <h3>Wide assortment</h3>
                    <p>Mega Discounts</p>
                </div>
            </div>
            <div class="benefit-item">
                <div class="benefit-icon">
                    <i class="fas fa-undo"></i>
                </div>
                <div class="benefit-content">
                    <h3>Easy returns</h3>
                    <p>Within 30 days</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<jsp:include page="layouts/footer.jsp" />

<script>
    // Xử lý chọn kích thước
    const sizeOptions = document.querySelectorAll('.size-option');
    const currentPriceElement = document.getElementById('current-price');
    const originalPriceElement = document.getElementById('original-price');
    const quantityInput = document.getElementById('quantity');

    // Khởi tạo giá ban đầu
    let currentPrice = parseFloat('${not empty sizes ? sizes[0].price : product.basePrice}');
    let currentOriginalPrice = currentPrice * 1.08;

    function formatPrice(price) {
        return price.toFixed(2);
    }

    function updatePrice() {
        const quantity = parseInt(quantityInput.value);
        currentPriceElement.textContent = '$' + formatPrice(currentPrice * quantity);
        originalPriceElement.textContent = '$' + formatPrice(currentOriginalPrice * quantity);
    }

    sizeOptions.forEach(option => {
        option.addEventListener('click', () => {
            // Xóa active class từ tất cả các options
            sizeOptions.forEach(opt => opt.classList.remove('active'));

            // Thêm active class vào option được chọn
            option.classList.add('active');

            // Cập nhật giá dựa trên kích thước được chọn
            currentPrice = parseFloat(option.dataset.price);
            currentOriginalPrice = currentPrice * 1.08;

            // Cập nhật hiển thị giá
            updatePrice();
        });
    });

    // Xử lý số lượng
    function incrementQuantity() {
        const value = parseInt(quantityInput.value);
        quantityInput.value = value + 1;
        updatePrice();
    }

    function decrementQuantity() {
        const value = parseInt(quantityInput.value);
        if (value > 1) {
            quantityInput.value = value - 1;
            updatePrice();
        }
    }

    // Xử lý hình ảnh thu nhỏ
    const thumbnails = document.querySelectorAll('.thumbnail');
    const mainImage = document.getElementById('mainProductImage');

    thumbnails.forEach(thumbnail => {
        thumbnail.addEventListener('click', () => {
            // Xóa active class từ tất cả thumbnails
            thumbnails.forEach(thumb => thumb.classList.remove('active'));

            // Thêm active class vào thumbnail được chọn
            thumbnail.classList.add('active');

            // Cập nhật hình ảnh chính
            mainImage.src = thumbnail.querySelector('img').src;
        });
    });

    function addToCart() {
        const productId = ${product.id};
        const quantity = 1; // Mặc định là 1

        const sizeSelect = document.querySelector('.size-option.active');
        if (!sizeSelect) {
            alert("Vui lòng chọn kích thước sản phẩm");
            return;
        }

        const sizeId = sizeSelect.dataset.sizeId;

        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/cart/add';

        const inputs = {
            productId: productId,
            sizeId: sizeId,
            quantity: quantity
        };

        for (const [name, value] of Object.entries(inputs)) {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = name;
            input.value = value;
            form.appendChild(input);
        }

        document.body.appendChild(form);
        form.submit();
    }


    // Cập nhật số lượng giỏ hàng
    function updateCartCount() {
        fetch('${pageContext.request.contextPath}/cart/count')
            .then(response => response.text())
            .then(count => {
                const cartCountElement = document.getElementById('cartCount');
                if (cartCountElement) {
                    cartCountElement.textContent = count;
                }
            })
            .catch(error => console.error('Error updating cart count:', error));
    }

    // Khởi tạo giá ban đầu khi trang load xong
    document.addEventListener('DOMContentLoaded', function() {
        updatePrice();
    });
</script>

</body>
</html>
