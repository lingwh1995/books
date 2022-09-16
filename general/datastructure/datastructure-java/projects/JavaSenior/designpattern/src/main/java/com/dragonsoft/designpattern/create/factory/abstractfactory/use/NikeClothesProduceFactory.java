package com.dragonsoft.designpattern.create.factory.abstractfactory.use;

public class NikeClothesProduceFactory extends AbstractClothesProduceFactory {

	@Override
	public AbstractHat produceHat() {
		return new NikeHat();
	}

	@Override
	public AbstractJacket produceJacket() {
		return new NikeJacket();
	}

	@Override
	public AbstractTrousers produceTrousers() {
		return new NikeTrousers();
	}

	@Override
	public AbstractShoes produceShoes() {
		return new NikeShoes();
	}

}
