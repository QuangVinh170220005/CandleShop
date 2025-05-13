package com.example.CandleShop.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    private BigDecimal basePrice;
    private BigDecimal discountPercentage = BigDecimal.ZERO;
    private Integer stockQuantity = 0;
    private String scentType;


    private boolean isFeatured = false;
    private String status = "ACTIVE";

    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
    private List<ProductImage> images;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
    private List<ProductSize> sizes;

    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
    }

    public Product() {
    }

    public Product(Long id, String name, String description, Category category, BigDecimal basePrice, BigDecimal discountPercentage, Integer stockQuantity, String scentType, boolean isFeatured, String status, Date createdAt) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.category = category;
        this.basePrice = basePrice;
        this.discountPercentage = discountPercentage;
        this.stockQuantity = stockQuantity;
        this.scentType = scentType;
        this.isFeatured = isFeatured;
        this.status = status;
        this.createdAt = createdAt;
    }
    // Getters và setters
    public List<ProductImage> getImages() {
        return images;
    }

    public void setImages(List<ProductImage> images) {
        this.images = images;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public BigDecimal getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(BigDecimal basePrice) {
        this.basePrice = basePrice;
    }

    public BigDecimal getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(BigDecimal discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public Integer getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(Integer stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getScentType() {
        return scentType;
    }

    public void setScentType(String scentType) {
        this.scentType = scentType;
    }

    public boolean isFeatured() {
        return isFeatured;
    }

    public void setFeatured(boolean featured) {
        isFeatured = featured;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<ProductImage> image;

    @Transient
    public String getPrimaryImage() {
        if (images != null && !images.isEmpty()) {
            return images.get(0).getImageUrl();
        }
        return "default.jpg";
    }

}

