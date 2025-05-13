package com.example.CandleShop.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WishlistController {
    @GetMapping("/wishlist")
    public String wishlistPage(){
        return "user/wishlist";
    }
}
