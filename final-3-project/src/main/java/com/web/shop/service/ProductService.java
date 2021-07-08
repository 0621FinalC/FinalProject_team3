package com.web.shop.service;

import java.util.List;

import com.web.shop.product.dto.ProductDTO;
 
public interface ProductService {
    List<ProductDTO> listProduct();
    ProductDTO detailProduct(int product_id);
    String fileInfo(int product_id);
    void updateProduct(ProductDTO dto);
    void deleteProduct(int product_id);
    void insertProduct(ProductDTO dto);
}
