package com.dragonsoft.designpattern.action.strategy.basic;

public class RMBPayment implements Payment{

	@Override
	public void pay() {
		System.out.println("人民币支付...");
	}

}
