package com.luel.easyb.domain


scenario "Withdraw more money than there is in the account",{

	given "an account with certain balance",{
		initialBalance = 50
		account = new Account("22345")
		account.deposit( initialBalance )
	}
	and "an amount is withdrawn that is greater than the balance",{
		withdrawTooMuchMoney = {
			account.withdraw(100)
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