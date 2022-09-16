package com.dragonsoft.designpattern.create.factory.abstractfactory.model;

/**
 * AbstractFactory(抽象工厂:用于创建一个产品族的产品)
 * ProductPart1,ProductPart2,ProductPart3是一个产品族中的不同产品,可以理解为如下情况
 * a.汽车案例
 *  Product                     : 汽车
 *  产品族: 轮胎、座椅、方向盘
 *  ProductPart1                : 轮胎
 *      ProductPart1LevelA      : 特斯拉轮胎
 *      ProductPart1LevelB      : 丰田轮胎
 *      ProductPart1LevelC      : 五菱轮胎
 *  ProductPart2                : 座椅
 *      ProductPart2LevelA      : 特斯拉座椅
 *      ProductPart2LevelB      : 丰田座椅
 *      ProductPart2LevelC      : 五菱座椅
 *  ProductPart3                : 方向盘
 *      ProductPart3LevelA      : 特斯拉方向盘
 *      ProductPart3LevelB      : 丰田方向盘
 *      ProductPart3LevelC      : 五菱方向盘
 * b.运动服装案例
 *  Product                     : 一整套运动服装
 *  产品族: 上衣、裤子、鞋子
 *  ProductPart1                : 上衣
 *      ProductPart1LevelA      : 耐克上衣
 *      ProductPart1LevelB      : 安踏上衣
 *      ProductPart1LevelC      : 特价上衣
 *  ProductPart2                : 裤子
 *      ProductPart2LevelA      : 耐克裤子
 *      ProductPart2LevelB      : 安踏裤子
 *      ProductPart2LevelC      : 特价裤子
 *  ProductPart3                : 鞋子
 *      ProductPart3LevelA      : 耐克鞋子
 *      ProductPart3LevelB      : 耐克鞋子
 *      ProductPart3LevelC      : 耐克鞋子
 * c.工厂案例
 *  Product                     : 工厂
 *  产品族: 汽车、自行车、摩托车
 *  ProductPart1                : 汽车
 *      ProductPart1LevelA      : 特斯拉汽车
 *      ProductPart1LevelB      : 长安汽车
 *      ProductPart1LevelC      : 奇瑞汽车
 *  ProductPart2                : 自行车
 *      ProductPart2LevelA      : 特斯自行车
 *      ProductPart2LevelB      : 长安自行车
 *      ProductPart2LevelC      : 奇瑞自行车
 *  ProductPart3                : 摩托车
 *      ProductPart3LevelA      : 特斯摩托车
 *      ProductPart3LevelB      : 长安摩托车
 *      ProductPart3LevelC      : 奇瑞摩托车
 */
public abstract class AbstractFactory {
    /**
     * 通过工厂方法生产产品的Part1部分
     * @return
     */
    public abstract ProductPart1 factoryMethod4ProductPart1();
    /**
     * 通过工厂方法生产产品的Part2部分
     * @return
     */
    public abstract ProductPart2 factoryMethod4ProductPart2();
    /**
     * 通过工厂方法生产产品的Part3部分
     * @return
     */
    public abstract ProductPart3 factoryMethod4ProductPart3();

}
