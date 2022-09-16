package com.dragonsoft.designpattern.create.factory.abstractfactory.model;

/**
 * ConcreteFactoryLevelA(生产A级别Product的工厂)
 */
public class ConcreteFactoryLevelA extends AbstractFactory {

    @Override
    public ProductPart1 factoryMethod4ProductPart1() {
        return new ProductPart1LevelA();
    }

    @Override
    public ProductPart2 factoryMethod4ProductPart2() {
        return new ProductPart2LevelA();
    }

    @Override
    public ProductPart3 factoryMethod4ProductPart3() {
        return new ProductPart3LevelA();
    }
}
