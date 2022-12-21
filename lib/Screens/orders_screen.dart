import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmain/widgets/order_drawer.dart';
import '../providers/orders.dart';
import '../widgets/orderWidget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Now !!"),
      ),
      drawer: OrderDrawer(),
      body: ListView.builder(
          itemBuilder: (ctx,i) => OrderList(orderData.orders[i]),
      itemCount: orderData.orders.length,),
    );
  }
}
