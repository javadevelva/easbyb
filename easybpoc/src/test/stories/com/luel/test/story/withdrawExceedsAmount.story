package com.luel.test.story

import com.luel.easyb.domain.Account
import com.luel.easyb.domain.InsufficientFundsException

scenario "Withdraw more money than there is in the account",{

	given "an account with certain balance",{
		initialBalance = 50
		withdrawAmount = 100
		account = new Account("22345")
		account.deposit( initialBalance )
	}
	and "an amount is withdrawn that is greater than the balance",{
		withdrawTooMuchMoney = {
			account.withdraw(withdrawAmount)
		}
	}
	then "an InsufficientFundsException is raised",{
		ensureThrows(InsufficientFundsException.class){
			withdrawTooMuchMoney()
		}
	}
	and "the account balance remains unchanged",{
		account.balance.shouldBe initialBalance;
	}
}