package com.luel.easyb.domain;

import static org.hamcrest.core.IsEqual.equalTo;
import static org.junit.Assert.assertThat;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.luel.easyb.service.EmailService;

public class AccountTest {

	private Account account;
	private ApplicationContext context;
	private EmailService emailService;
	
	@Before
	public void setUp() throws Exception {
		account = new Account("12345");
		context = new ClassPathXmlApplicationContext("application_context.xml");
		emailService = context.getBean(EmailService.class);
	}

	@After
	public void tearDown() throws Exception {
		account = null;
		context = null;
	}

	@Test
	public void newAccountBalanceShouldBeEqualtoinitialDeposit() {
		long initialAmount = 100;
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
