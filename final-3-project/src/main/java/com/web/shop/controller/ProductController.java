package com.web.shop.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
import com.web.shop.service.ProductService;
 
 
@Controller 
@RequestMapping("/shoppingmall/product/*") 
public class ProductController {
 
    @Inject 
    ProductService productService; 
    
    @RequestMapping("list.do") 
    public ModelAndView list(ModelAndView mav) {
        mav.setViewName("/shoppingmall/product_list"); 
        mav.addObject("list", productService.listProduct());  
    
        return mav;   
    }
    
    @RequestMapping("/detail/{product_id}")
    public ModelAndView detail(
    		@PathVariable("product_id") int product_id, ModelAndView mav) {
    	mav.setViewName("/shoppingmall/product_detail");
    	mav.addObject("dto", productService.detailProduct(product_id));
    	return mav;
    }
}
