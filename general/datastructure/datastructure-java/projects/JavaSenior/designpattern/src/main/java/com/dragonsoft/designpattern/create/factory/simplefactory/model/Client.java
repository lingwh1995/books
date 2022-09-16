package com.dragonsoft.designpattern.create.factory.simplefactory.model;

import org.junit.Test;

/**
 * Client(客户端)
 */
public class Client {

    @Test
    public void fun() {
        Factory factory = new Factory();
        //生产产品A
        Product productA = factory.factoryMethod("productA");
        System.out.println(productA);
        //在工厂中直接调用工厂方法
        factory.operate("productA");

        System.out.println("--------------------");
        //生产产品B
        Product productB = factory.factoryMethod("productB");
        System.out.println(productB);
        //在工厂中直接调用工厂方法
        factory.operate("productB");

        System.out.println("--------------------");
        //生产产品C
        Product productC = factory.factoryMethod("productC");
        System.out.println(productC);
        //在工厂中直接调用工厂方法
        factory.operate("productC");
    }
}
