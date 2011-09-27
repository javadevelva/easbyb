package com.luel.test.story

import com.luel.easyb.domain.Account


scenario "Transfer money from an account",{

	given "two accounts",{
		srcAccount = new Account("12345")
		targetAccount = new Account("22345")
	}
	and "the source account has sufficient balance",{
		srcAccountInitialBalance = 200
		srcAccount.deposit(srcAccountInitialBalance)
	}
	when "money is transfered from the source account to the target account",{
		transferAmount = 50
		account1.transfer(transferAmount,account2)
	}
	then "account one balance should be less by the transfer amount",{
		account1.balance.shouldBe account1InitialBalance - transferAmount
	}
}