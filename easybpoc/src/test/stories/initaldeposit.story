package com.luel.easyb.domain

scenario "Make initial deposit onto a new account",{
	given "a newly created account",{
		account = new Account("12345")
	}
	when "an initial deposit is made into this account",{
		initialAmount = 100
		account.deposit(initialAmount)
	}
	then "the account balance should be equal to the amount deposited",{
		account.balance.shouldBe initialAmount
	}
}