package com.examen.products.examproducts.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import com.examen.products.examproducts.models.Product;
import com.examen.products.examproducts.repositories.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private final ProductRepository repo;

    public ProductServiceImpl(ProductRepository repo)
    { 
        this.repo = repo; 
    }
    
    public List<Product> findAll()
    {
        return repo.findAll();
    }
    
    public Optional<Product> findById(Long id) 
    { 
        return repo.findById(id); 
    }
    
    public Product create(Product p) 
    { 
        return repo.save(p); 
    }
    
    public Product update(Long id, Product p)
    {
        return repo.findById(id).map(existing -> {
            existing.setName(p.getName());
            existing.setDescription(p.getDescription());
            existing.setPrice(p.getPrice());
            return repo.save(existing);
        }).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
    
    public void delete(Long id)
    {
        repo.deleteById(id);
    }
}
