package com.examen.products.examproducts.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
public class SecurityConfig {

  @Bean
  public InMemoryUserDetailsManager users() {
    UserDetails user = User.withDefaultPasswordEncoder()
      .username("user")
      .password("password")
      .roles("USER")
      .build();
    
    return new InMemoryUserDetailsManager(user);
  }
}
