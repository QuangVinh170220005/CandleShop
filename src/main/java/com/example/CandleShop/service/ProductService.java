package com.example.CandleShop.service;

import com.example.CandleShop.entity.Product;
import com.example.CandleShop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;
    public Product getProductById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy sản phẩm với ID: " + id));
    }

    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
    public List<Product> getAllProductsWithImages() {
        List<Product> products = productRepository.findAll();
        products.sort((p1, p2) -> p2.getCreatedAt().compareTo(p1.getCreatedAt()));
        for (Product product : products) {
            if (product.getImages() != null) {
                product.getImages().size(); // Force initialization
            }
            if (product.getCategory() != null) {
                product.getCategory().getName(); // Force initialization
            }
        }
        return products;
    }



    public List<Product> getFeaturedProducts() {
        return productRepository.findByIsFeaturedTrue();
    }

    public List<Product> getFeaturedProducts(int limit) {
        Pageable pageable = PageRequest.of(0, limit);
        return productRepository.findAll(pageable).getContent();
    }


    public List<Product> searchProducts(String keyword) {
        return productRepository.findByNameContainingOrDescriptionContaining(keyword, keyword);
    }

    // Thêm vào ProductService.java
    public List<Product> getFavoriteProducts() {
        return productRepository.findTop5ByIsFeaturedIsTrue();
    }
}
