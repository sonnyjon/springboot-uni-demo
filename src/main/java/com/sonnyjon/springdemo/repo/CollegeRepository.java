package com.sonnyjon.springdemo.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sonnyjon.springdemo.entity.College;

@Repository
public interface CollegeRepository extends JpaRepository<College, Integer> 
{
	public List<College> findByOrderByTitleAsc();
}
