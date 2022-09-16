package com.dragonsoft.designpattern.create.factory.abstractfactory.model;

import org.junit.Test;

/**
 * 客户端
 */
public class Client {
    @Test
    public void fun() {
        AbstractFactory concreteFactoryLevelA = new ConcreteFactoryLevelA();
        ProductPart1 productPart1LevelA = concreteFactoryLevelA.factoryMethod4ProductPart1();
        ProductPart2 productPart2LevelA = concreteFactoryLevelA.factoryMethod4ProductPart2();
        ProductPart3 productPart3LevelA = concreteFactoryLevelA.factoryMethod4ProductPart3();
        System.out.println("productLevelA: " + productPart1LevelA +"," + productPart2LevelA + "," + productPart3LevelA);

        System.out.println("--------------------");
        AbstractFactory concreteFactoryLevelB = new ConcreteFactoryLevelB();
        ProductPart1 productPart1LevelB = concreteFactoryLevelB.factoryMethod4ProductPart1();
        ProductPart2 productPart2LevelB = concreteFactoryLevelB.factoryMethod4ProductPart2();
        ProductPart3 productPart3LevelB = concreteFactoryLevelB.factoryMethod4ProductPart3();
        System.out.println("productLevelB: " + productPart1LevelB +"," + productPart2LevelB + "," + productPart3LevelB);

        System.out.println("--------------------");
        AbstractFactory concreteFactoryLevelC = new ConcreteFactoryLevelC();
        ProductPart1 productPart1LevelC = concreteFactoryLevelC.factoryMethod4ProductPart1();
        ProductPart2 productPart2LevelC = concreteFactoryLevelC.factoryMethod4ProductPart2();
        ProductPart3 productPart3LevelC = concreteFactoryLevelC.factoryMethod4ProductPart3();
        System.out.println("productLevelC: " + productPart1LevelC +"," + productPart2LevelC + "," + productPart3LevelC);
    }
}
