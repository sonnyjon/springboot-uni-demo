package com.sonnyjon.springdemo.err;

public class MajorNotFoundException extends RuntimeException 
{

	public MajorNotFoundException() 
	{
		super();
	}

	public MajorNotFoundException(String message, Throwable cause) 
	{
		super(message, cause);
	}

	public MajorNotFoundException(String message) 
	{
		super(message);
	}

	public MajorNotFoundException(Throwable cause) 
	{
		super(cause);
	}	
	
}
