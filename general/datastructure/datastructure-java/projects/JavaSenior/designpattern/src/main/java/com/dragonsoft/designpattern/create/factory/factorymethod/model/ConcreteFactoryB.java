package com.dragonsoft.designpattern.create.factory.factorymethod.model;

/**
 * ConcreteFactoryB(生产ProductB的具体工厂)
 */
public class ConcreteFactoryB extends AbstractFactory {
    @Override
    public AbstractProduct factoryMethod() {
        return new ConcreteProductB();
    }
}
