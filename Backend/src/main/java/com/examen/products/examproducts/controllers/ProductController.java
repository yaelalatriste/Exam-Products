package com.examen.products.examproducts.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.examen.products.examproducts.models.Product;
import com.examen.products.examproducts.services.ProductService;

import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api/products")
public class ProductController {
    
    private final ProductService service;
    
    public ProductController(ProductService service) 
    {
        this.service = service; 
    }
    
    @GetMapping("/getAllProducts")
    public List<Product> getAllProducts()
    { 
        return service.findAll();
    }
    
    @GetMapping("/{id}")
    public Product get(@PathVariable Long id)
    {
        return service.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
    
    @PostMapping("/createProduct")
    @ResponseStatus(HttpStatus.CREATED)
    public Product create(@RequestBody @Validated Product product)
    { 
        return service.create(product); 
    }
    
    @PutMapping("/updateProduct/{id}")
    public Product update(@PathVariable Long id, @RequestBody @Validated Product product)
    {
        return service.update(id, product);
    }
    
    @DeleteMapping("/deleteProduct/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id)
    {
        service.delete(id); 
    }
}
