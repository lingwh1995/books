package com.dragonsoft.designpattern.create.factory.abstractfactory.model;

/**
 * ConcreteFactoryLevelC(生产C级别Product的工厂)
 */
public class ConcreteFactoryLevelC extends AbstractFactory {
    @Override
    public ProductPart1 factoryMethod4ProductPart1() {
        return new ProductPart1LevelC();
    }

    @Override
    public ProductPart2 factoryMethod4ProductPart2() {
        return new ProductPart2LevelC();
    }

    @Override
    public ProductPart3 factoryMethod4ProductPart3() {
        return new ProductPart3LevelC();
    }
}
