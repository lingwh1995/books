package com.dragonsoft.designpattern.create.factory.abstractfactory.use;

public class AdidasClothesProduceFactory extends AbstractClothesProduceFactory {

	@Override
	public AbstractHat produceHat() {
		return new AdidasHat();
	}

	@Override
	public AbstractJacket produceJacket() {
		return new AdidasJacket();
	}

	@Override
	public AbstractTrousers produceTrousers() {
		return new AdidasTrousers();
	}

	@Override
	public AbstractShoes produceShoes() {
		return new AdidasShoes();
	}

}
