package com.sonnyjon.springdemo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Service;

import com.sonnyjon.springdemo.entity.Login;
import com.sonnyjon.springdemo.repo.UserRepository;

@Service
public class UserService 
{
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	JdbcUserDetailsManager jdbcUserDetailsManager;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public void registerUser(Login login, String role)
	{
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(role));
		
		String encodededPassword = passwordEncoder.encode(login.getPassword());
		User user =	new User(login.getEmail(), encodededPassword, authorities);
		jdbcUserDetailsManager.createUser(user);
	}
}
