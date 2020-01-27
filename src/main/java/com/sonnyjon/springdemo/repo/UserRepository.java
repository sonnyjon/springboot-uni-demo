package com.sonnyjon.springdemo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sonnyjon.springdemo.entity.Login;

@Repository
public interface UserRepository extends JpaRepository<Login, String> 
{

}
