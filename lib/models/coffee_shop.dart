import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
      name: 'Long Black', 
      price: "4.10", 
      imagePath: "assets/images/mug.png"
    ),

    // latte
    Coffee(
      name: 'Latte', 
      price: "4.20", 
      imagePath: "assets/images/paper.png"
    ),

    // espresso
    Coffee(
      name: 'Espresso', 
      price: "3.50", 
      imagePath: "assets/images/cup.png"
    ),

    // iced coffee
    Coffee(
      name: 'Iced Coffee', 
      price: "4.40", 
      imagePath: "assets/images/glass.png"
    ),

    // beans
    Coffee(
      name: 'Beans', 
      price: "2.10", 
      imagePath: "assets/images/beans.png"
    ),


    // Grind coffee
    Coffee(
      name: 'Grind Coffee', 
      price: "4.10", 
      imagePath: "assets/images/grinder.png"
    ),

    // bag of beans
    Coffee(
      name: 'Bag of Beans', 
      price: "4.50", 
      imagePath: "assets/images/bag.png"
    ),
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee cart
  List<Coffee> get coffeeShop => _shop;
 
  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item ti cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
