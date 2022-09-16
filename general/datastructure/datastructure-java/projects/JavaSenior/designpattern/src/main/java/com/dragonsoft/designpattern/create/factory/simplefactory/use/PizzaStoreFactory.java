package com.dragonsoft.designpattern.create.factory.simplefactory.use;

public class PizzaStoreFactory {

	/**
	 * 通过工厂方法生产产品
	 * @param pizzaType
	 * @return
	 */
	public Pizza createPizza(String pizzaType) {
		Pizza pizza = null;
		if (pizzaType.equals("cheese")) {
			pizza = new CheesePizza();
		} else if (pizzaType.equals("pepperoni")) {
			pizza = new PepperoniPizza();
		} else if (pizzaType.equals("clam")) {
			pizza = new ClamPizza();
		} 
		return pizza;
	}

	/**
	 * 调用工厂方法的方法
	 * @param pizzaType
	 * @return
	 */
	public Pizza orderPizza(String pizzaType) {
		Pizza pizza = createPizza(pizzaType);
		pizza.prepare();
		pizza.bake();
		pizza.cut();
		pizza.box();
		return pizza;
	}
}
