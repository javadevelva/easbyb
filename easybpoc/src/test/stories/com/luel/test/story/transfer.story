package com.luel.test.story

import com.luel.easyb.service.TransferConfirmation
import com.luel.easyb.service.TransferService
import com.luel.easyb.domain.AccountRepository
import com.luel.easyb.domain.Account

import static org.mockito.Mockito.*


before "initialize account repository and account service",{
		srcAcctID = "12345"
		trgtAcctID = "22345"
		transferAmount = 50
		
		accountRepository = mock(AccountRepository.class)
		when( accountRepository.findByAccountId(srcAcctID)).thenReturn(new Account(srcAcctID))
		transferService = mock(TransferService.class)
		transConfirm = new TransferConfirmation()
		transConfirm.setNewBalance(150)
		when(transferService.transfer(transferAmount,srcAcctID, trgtAcctID)).thenReturn(transConfirm)
}

scenario "Transfer money from an account",{
	given "an account with sufficient fund",{
		initialBalance = 200
		accountRepository.findByAccountId(srcAcctID).deposit(initialBalance)
	}
	when "money is transfered from the source account to the target account",{
		transferAmount = 50
		transferService.transfer(transferAmount,srcAcctID,trgtAcctID)
	}
	then "source account balance should be less by the transfer amount",{
		transConfirm.newBalance.shouldBe initialBalance - transferAmount
	}
}