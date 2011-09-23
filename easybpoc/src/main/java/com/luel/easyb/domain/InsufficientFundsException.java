package com.luel.easyb.domain;

public class InsufficientFundsException extends RuntimeException {
	
	public InsufficientFundsException(String msg){
		super(msg);
	}
	
	public InsufficientFundsException(Throwable t){
		super(t);
	}
	
	public InsufficientFundsException(String msg, Throwable t){
		super(msg,t);
	}
}