package com.dragonsoft.designpattern.create.factory.abstractfactory.use;

public class PumaClothesProduceFactory extends AbstractClothesProduceFactory {

	@Override
	public AbstractHat produceHat() {
		return new PumaHat();
	}

	@Override
	public AbstractJacket produceJacket() {
		return new PumaJacket();
	}

	@Override
	public AbstractTrousers produceTrousers() {
		return new PumaTrousers();
	}

	@Override
	public AbstractShoes produceShoes() {
		return new PumaShoes();
	}

}
