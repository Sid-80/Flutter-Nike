import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmain/widgets/order_drawer.dart';
import 'package:shopmain/widgets/userProductItem.dart';
import '../providers/content_provider.dart';

class userProductScreen extends StatelessWidget {
  const userProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<contentOfProducts>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/editScreen');
          }, icon: const Icon(Icons.add))
        ],
      ),
      drawer: OrderDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (_,i) => Column(
            children: [
              userProductItem(title: productData.items[i].title, ImageUrl: productData.items[i].imageUrl),
              Divider(),
            ],
          ),
          itemCount: productData.items.length,
        ),
      ),
    );
  }
}
