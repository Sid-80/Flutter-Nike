import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../providers/orders.dart';

class OrderList extends StatefulWidget {
  final OrderItem order;
  const OrderList(this.order, {Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\₹${widget.order.amount}'),
            subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: Icon(_expanded ? Icons.close : Icons.expand_more )
            ),
          ),
          if(_expanded) Container(
            padding: const EdgeInsets.all(10),
            height: min(widget.order.products.length * 10.0 + 50.0, 180.0),
            child: ListView(
              children: widget.order.products.map((prod) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(prod.title, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Text('${prod.quantity} x \₹${prod.price}', style: const TextStyle(fontSize: 18,color: Colors.black54),)
                ],
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
