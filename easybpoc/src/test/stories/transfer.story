package com.luel.easyb.domain

scenario "Transfer money from an account",{

	given "two accounts",{
		account1 = new Account("12345")
		account2 = new Account("22345")
	}
	and "the first account has sufficient balance",{
		account1InitialBalance = 200
		account1.deposit(account1InitialBalance)
	}
	when "money is transfered from the first account to the second account",{
		transferAmount = 50
		account1.transfer(transferAmount,account2)
	}
	then "account one balance should be less by the transfer amount",{
		account1.balance.shouldBe account1InitialBalance - transferAmount
	}
}