package com.sonnyjon.springdemo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class Login 
{
	@Id
	@Column(name="username")
	private String email;
	private String password;
	private boolean enabled = true;
	
	public Login() {}
	
	public Login(String username, String password)
	{
		this(username, password, true);
	}
	
	public Login(String email, String password, boolean enabled) 
	{
		this.email = email;
		this.password = password;
		this.enabled = enabled;
	}
	
	@Override
	public String toString() 
	{
		return "User [email=" + email + ", password=" + password + ", enabled=" + enabled + "]";
	}

	public String getEmail() 
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}

	public String getPassword() 
	{
		return password;
	}

	public void setPassword(String password) 
	{
		this.password = password;
	}

	public boolean isEnabled() 
	{
		return enabled;
	}

	public void setEnabled(boolean enabled) 
	{
		this.enabled = enabled;
	}
	
}
