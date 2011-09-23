package com.luel.easyb.domain;

import java.util.Date;

public class Account {

	private String acctid;
	private long balance;
	private Date createdDate;
	
	public Account( String acctid){
		this.acctid = acctid;
		balance = 0;
		createdDate = new Date();
	}
	
	public void deposit( long amount ){
		balance = balance + amount;
	}
	
	public void withdraw( int amount ){
		if( amount > balance ){
			throw new InsufficientFundsException("requested amount exceeds balance");
		}
		balance = balance - amount;	
	}
	
	public void transfer(int amount, Account account){
		if( amount > balance ){
			throw new InsufficientFundsException("requested amount exceeds balance");
		}
		balance = balance - amount;	
		account.deposit(amount);
	}
	

	
	public String getAcctid() {
		return acctid;
	}

	public long getBalance() {
		return balance;
	}

	public Date getCreatedDate() {
		return createdDate;
	}
}