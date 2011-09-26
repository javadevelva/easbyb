package com.luel.easyb.service;

public class EmailService {

	public EmailService(){
		
	}
	
	public void send(String accountId){
		//just for testing purposes
		if( accountId == null || "".equals(accountId)){
			throw new InvalidEmailAccount("the email address is invalid");
		}
	}
}