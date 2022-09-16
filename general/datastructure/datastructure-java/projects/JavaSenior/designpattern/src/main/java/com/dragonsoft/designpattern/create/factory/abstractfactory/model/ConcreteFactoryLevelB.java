package com.dragonsoft.designpattern.create.factory.abstractfactory.model;

/**
 * ConcreteFactoryLevelB(生产B级别Product的工厂)
 */
public class ConcreteFactoryLevelB extends AbstractFactory {
    @Override
    public ProductPart1 factoryMethod4ProductPart1() {
        return new ProductPart1LevelB();
    }

    @Override
    public ProductPart2 factoryMethod4ProductPart2() {
        return new ProductPart2LevelB();
    }

    @Override
    public ProductPart3 factoryMethod4ProductPart3() {
        return new ProductPart3LevelB();
    }
}
