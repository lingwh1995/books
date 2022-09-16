package com.dragonsoft.designpattern.create.factory.abstractfactory.use;

/**
 * 服装工厂
 * @author lingwh
 *
 */
public abstract class AbstractClothesProduceFactory {
	
	//生产帽子
	public abstract AbstractHat produceHat();
	//生产夹克衫
	public abstract AbstractJacket produceJacket();
	//生产裤子
	public abstract AbstractTrousers produceTrousers();
	//生产鞋子
	public abstract AbstractShoes produceShoes();
}
