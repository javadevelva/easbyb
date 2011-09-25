package com.luel.easyb.service;

public class InvalidEmailAccount extends RuntimeException {

	public InvalidEmailAccount(String str){
		super(str);
	}
	
	public InvalidEmailAccount(Throwable t){
		super(t);
	}
	
	public InvalidEmailAccount(String str, Throwable t){
		super(str,t);
	}
}
