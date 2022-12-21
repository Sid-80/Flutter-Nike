import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:shopmain/Screens/cart.dart' show Cart;
import 'package:shopmain/providers/orders.dart';
import 'package:shopmain/widgets/order_drawer.dart';
import '../widgets/cartItem.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Cart"),),
      drawer: const OrderDrawer(),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
                padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total", style: TextStyle(fontSize: 20),),
                  Chip(
                      label: Text(
                          cart.totalAmount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(onPressed: () { 
                    Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                    cart.clearCart();
                  }, child: const Text("ORDER NOW")),
                ],
              ),
            )
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (ctx, i)=>CartItem(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title
                ),
              )
          )
        ],
      ),
    );
  }
}
