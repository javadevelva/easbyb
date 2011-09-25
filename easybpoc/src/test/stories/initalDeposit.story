package com.luel.easyb.story

import com.luel.easyb.domain.Account
import com.luel.easyb.service.EmailService
import org.springframework.context.ApplicationContext
import org.springframework.context.support.ClassPathXmlApplicationContext

description """this is about depositing money into a checking account"""

narrative "description", {
	as_a "client"
	i_want "to deposit money into my new account"
	so_that "i can write check or withdraw money from an ATM at any time"
}

before_each "initialize a new account",{
	given "a newly created account",{
		account = new Account("12345")
		context = new ClassPathXmlApplicationContext("application_context.xml")
		emailService = context.getBean(EmailService.class)
	}
}

scenario "Make initial deposit onto a new account",{
	when "an initial deposit is made into this account",{
		initialAmount = 100
		account.deposit initialAmount
	}
	then "the account balance should be equal to the amount deposited",{
		account.balance.shouldBe initialAmount
	}
	and "an email is sent to the account holder indicating the account has been set up",{
		emailService.send account.acctid
	}
}
//this is not implemented yet but it won't break the build
//it will show as pending in the report
scenario "try to withdraw money before money is deposited"
when "a withdrawal is attempted before money is deposited"
then "insufficient funds exception should be raised"

after "clean resources",{
	account = null
	context = null
}