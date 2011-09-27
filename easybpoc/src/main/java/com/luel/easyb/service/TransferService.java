package com.luel.easyb.service;

public interface TransferService {

	public TransferConfirmation transfer( long amount, String srcAccntID, String destAcctId);
}