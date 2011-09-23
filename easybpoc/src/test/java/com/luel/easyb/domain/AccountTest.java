package com.luel.easyb.domain;

import static org.hamcrest.core.IsEqual.equalTo;
import static org.junit.Assert.assertThat;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class AccountTest {

	private Account account;
	@Before
	public void setUp() throws Exception {
		account = new Account("12345");
	}

	@After
	public void tearDown() throws Exception {
		account = null;
	}

	@Test
	public void newAccountBalanceShouldBeEqualtoinitialDeposit() {
		int initialAmount = 100;
		account.deposit(initialAmount);
		assertThat("new account balance should be equal to initial deposit",account.getBalance(), equalTo(initialAmount));
	}
	
	@Test(expected=InsufficientFundsException.class)
	public void withdrawAmountExceedsBalance(){
		int initialAmount = 100;
		account.deposit(initialAmount);
		account.withdraw(200);
	}
	
}
