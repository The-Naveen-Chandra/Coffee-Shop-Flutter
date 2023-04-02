import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // payment method here
  void payNow() {
  }

  // remove cart item 
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: ((context, value, child) => 
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [

              // heading
              Text(
                "Your Cart",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 25,),

              // list of cart item
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                  // get individual cart items
                  Coffee eachCoffee = value.userCart[index];

                  // return coffee tile
                 return CoffeeTile(
                    coffee: eachCoffee, 
                    onPressed: () => removeFromCart(eachCoffee), 
                    icon: const Icon(Icons.delete_outline)
                  );
                }),
              ),
              
              // pay button
              GestureDetector(
                onTap: payNow,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      "Pay Now",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      )),
    );
  }
}
