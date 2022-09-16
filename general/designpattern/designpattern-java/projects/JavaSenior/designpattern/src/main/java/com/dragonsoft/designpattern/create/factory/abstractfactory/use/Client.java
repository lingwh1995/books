package com.dragonsoft.designpattern.create.factory.abstractfactory.use;

import org.junit.Test;

public class Client {
	
	@Test
	public void fun() {
		//Adidas工厂
		AbstractClothesProduceFactory adidasClothesFactory = new AdidasClothesProduceFactory();
		AbstractHat adidasHat = adidasClothesFactory.produceHat();
		AbstractJacket adidasJacket = adidasClothesFactory.produceJacket();
		AbstractTrousers adidasTrousers = adidasClothesFactory.produceTrousers();
		AbstractShoes adidasShoes = adidasClothesFactory.produceShoes();
		adidasHat.produce();
		adidasJacket.produce();
		adidasTrousers.produce();
		adidasShoes.produce();
		
		System.out.println("-------------------------------");
		//Nike工厂
		AbstractClothesProduceFactory nikeClothesFactory = new NikeClothesProduceFactory();
		AbstractHat nikeHat = nikeClothesFactory.produceHat();
		AbstractJacket nikeJacket = nikeClothesFactory.produceJacket();
		AbstractTrousers nikeTrousers = nikeClothesFactory.produceTrousers();
		AbstractShoes nikeShoes = nikeClothesFactory.produceShoes();
		nikeHat.produce();
		nikeJacket.produce();
		nikeTrousers.produce();
		nikeShoes.produce();
		
		System.out.println("-------------------------------");
		//Puma工厂
		AbstractClothesProduceFactory pumaClothesFactory = new PumaClothesProduceFactory();
		AbstractHat pumaHat = pumaClothesFactory.produceHat();
		AbstractJacket pumaJacket = pumaClothesFactory.produceJacket();
		AbstractTrousers pumaTrousers = pumaClothesFactory.produceTrousers();
		AbstractShoes pumaShoes = pumaClothesFactory.produceShoes();
		pumaHat.produce();
		pumaJacket.produce();
		pumaTrousers.produce();
		pumaShoes.produce();
	}
}
