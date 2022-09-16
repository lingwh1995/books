package com.dragonsoft.designpattern.create.factory.factorymethod.model;

/**
 * ConcreteFactoryA(生产ProductA的具体工厂)
 */
public class ConcreteFactoryA extends AbstractFactory {
    @Override
    public AbstractProduct factoryMethod() {
        return new ConcreteProductA();
    }
}
