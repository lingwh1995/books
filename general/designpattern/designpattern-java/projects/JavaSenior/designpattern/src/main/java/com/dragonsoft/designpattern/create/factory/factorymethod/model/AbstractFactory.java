package com.dragonsoft.designpattern.create.factory.factorymethod.model;

/**
 * AbstractFactory(抽象工厂)
 */
public abstract class AbstractFactory {
    /**
     * 通过工厂方法生产产品
     * @return
     */
    public abstract AbstractProduct factoryMethod();

    /**
     * 调用工厂方法的方法
     */
    public void operate(){
        AbstractProduct product = factoryMethod();
        System.out.println(product);
    }
}
