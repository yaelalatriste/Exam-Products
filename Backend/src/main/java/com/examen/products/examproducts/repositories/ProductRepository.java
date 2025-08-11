package com.examen.products.examproducts.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.examen.products.examproducts.models.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
    
}
