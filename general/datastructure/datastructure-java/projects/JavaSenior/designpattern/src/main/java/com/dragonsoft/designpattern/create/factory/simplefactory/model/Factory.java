package com.dragonsoft.designpattern.create.factory.simplefactory.model;

/**
 * Factory(简单工厂)
 */
public class Factory {
    /**
     * 通过工厂方法生产产品
     * @param productType
     * @return
     */
    public Product factoryMethod(String productType) {
        Product product = null;
        if (productType.equals("productA")) {
            product = new ConcreteProductA();
        } else if (productType.equals("productB")) {
            product = new ConcreteProductB();
        } else if (productType.equals("productC")) {
            product = new ConcreteProductC();
        }
        return product;
    }

    /**
     * 调用工厂方法的方法
     * @param productType
     */
    public void operate(String productType){
        Product product = factoryMethod(productType);
        System.out.println(product);
    }
}
