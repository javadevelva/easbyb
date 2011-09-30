package com.luel.test.story

import com.luel.easyb.service.TransferConfirmation
import com.luel.easyb.service.TransferService
import com.luel.easyb.domain.AccountRepository
import com.luel.easyb.domain.Account

import static org.mockito.Mockito.*


narrative "description", {
	as_a "savings account holder"
	i_want "transfer money from my savings account"
	so_that "I can get cash easily from an ATM"
}

before "initialize account repository and transfer service",{
	savingAcctID  = "12345"
	checkingAcctID = "22345"
	transferAmount = 20
	savingAcctInitialBalance = 100
	checkingAcctInitialBalance = 20
	
	accountRepository = mock( AccountRepository.class )
	when( accountRepository.findByAccountId( savingAcctID ) ).thenReturn(new Account( savingAcctID ) )
	when( accountRepository.findByAccountId( checkingAcctID ) ).thenReturn(new Account( checkingAcctID ) )
	
	transferService = mock( TransferService.class )
	transConfirm = new TransferConfirmation()
	transConfirm.setNewBalance( savingAcctInitialBalance -  transferAmount )
	when( transferService.transfer( transferAmount,savingAcctID, checkingAcctID ) ).thenReturn( transConfirm )
}

scenario "savings account is in credit",{
	given "my savings account balance is \$100 ",{
		accountRepository.findByAccountId( savingAcctID ).deposit( savingAcctInitialBalance )
	}
	and "my cash account balance is \$10",{
		accountRepository.findByAccountId( checkingAcctID ).deposit( checkingAcctInitialBalance )
	}
	
	when "I transfer \$20 to my checking account", {
		transferService.transfer(transferAmount,savingAcctID,checkingAcctID)
	}
	
	then "my savings account balance should be \$80", {
		transConfirm.newBalance.shouldBe savingAcctInitialBalance - transferAmount
	}
	and "my cash account balance should be \$30"
}