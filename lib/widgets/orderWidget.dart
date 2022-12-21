import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart';

class OrderList extends StatelessWidget {
  final OrderItem order;
  const OrderList(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\₹${order.amount}'),
            subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(order.dateTime)),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.expand_more)),
          )
        ],
      ),
    );
  }
}
