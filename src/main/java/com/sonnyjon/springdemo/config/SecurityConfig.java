package com.sonnyjon.springdemo.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter 
{
	@Autowired
	DataSource dataSource;
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder()
	{
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public JdbcUserDetailsManager jdbcUserDetailsManager() throws Exception 
	{
		JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();
		jdbcUserDetailsManager.setDataSource(dataSource);
		return jdbcUserDetailsManager;
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception 
	{		
		auth.jdbcAuthentication()
			.dataSource(dataSource)
			.passwordEncoder(passwordEncoder());		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception 
	{
		http.authorizeRequests()
				.antMatchers("/").hasAnyRole("STUDENT", "ADMIN", "TEACHER")
				.antMatchers("/admin/**").hasRole("ADMIN")
				.antMatchers("/student/**").hasRole("STUDENT")
				.and()
			.formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/authenticateUser")
				.permitAll()
				.and()
			.logout()
				.permitAll()
				.and()
			.exceptionHandling().accessDeniedPage("/access-denied");
	}	

}
