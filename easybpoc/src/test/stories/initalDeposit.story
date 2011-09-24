package com.luel.easyb.domain

description """this is about depositing money into a checking account"""

narrative "description", {
	as_a "teller"
	i_want "deposit money into a newly created account"
	so_that "the customer will be able to use ATM any time"
}

before_each "initialize a new account",{
	given "a newly created account",{
		account = new Account("12345")
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
}
//this is not implemented yet but it won't break the build
//it will show as pending in the report
scenario "try to withdraw money before money is deposited"
when "a withdrawal is attempted before money is deposited"
then "insufficient funds exception should be raised"

after_each "clean resources",{
	account = null
}