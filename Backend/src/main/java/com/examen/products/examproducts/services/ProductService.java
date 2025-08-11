package com.examen.products.examproducts.services;

import java.util.List;
import java.util.Optional;
import com.examen.products.examproducts.models.Product;

public interface ProductService {
    public List<Product> findAll();
    public Optional<Product> findById(Long id);
    public Product create(Product p);
    public Product update(Long id, Product p);
    public void delete(Long id);
}
