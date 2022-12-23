import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
        child: ListView.builder(itemBuilder: () =>),
      ),
    );
  }
}
