package com.sonnyjon.springdemo.err;

public class CollegeNotFoundException extends RuntimeException 
{

	public CollegeNotFoundException() 
	{
		super();
	}

	public CollegeNotFoundException(String message, Throwable cause) 
	{
		super(message, cause);
	}

	public CollegeNotFoundException(String message) 
	{
		super(message);
	}

	public CollegeNotFoundException(Throwable cause) 
	{
		super(cause);
	}	
	
}
