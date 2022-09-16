package com.dragonsoft.designpattern.create.factory.factorymethod.model;

import org.junit.Test;

/**
 * 客户端
 */
public class Client {
    @Test
    public void fun() {
        //获取生产产品A的工厂
        AbstractFactory factoryA = new ConcreteFactoryA();
        //生产产品A
        AbstractProduct productA = factoryA.factoryMethod();
        System.out.println(productA);
        //在工厂A中直接调用工厂方法
        factoryA.operate();

        System.out.println("--------------------");
        //获取生产产品B的工厂
        AbstractFactory factoryB = new ConcreteFactoryB();
        //生产产品B
        AbstractProduct productB = factoryB.factoryMethod();
        System.out.println(productB);
        //在工厂B中直接调用工厂方法
        factoryB.operate();

        System.out.println("--------------------");
        //获取生产产品C的工厂
        AbstractFactory factoryC = new ConcreteFactoryC();
        //生产产品C
        AbstractProduct productC = factoryC.factoryMethod();
        System.out.println(productC);
        //在工厂C中直接调用工厂方法
        factoryC.operate();
    }
}
