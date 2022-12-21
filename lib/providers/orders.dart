import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../Screens/cart.dart';

class OrderItem{
  final String id;
  final double amount;
  final List<cartItem> products;
  final DateTime dateTime;
  OrderItem({required this.id,required this.amount,required this.products,required this.dateTime});
}

class Orders with ChangeNotifier{
  List<OrderItem> _orders = [];

  List<OrderItem> get orders{
    return [..._orders];
  }

  void addOrder(List<cartItem> orderProducts, double total) {
    _orders.insert(0, OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: orderProducts,
        dateTime: DateTime.now()
    ));
    notifyListeners();
  }

}