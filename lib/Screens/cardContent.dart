import 'package:flutter/material.dart';
import '../providers/content_provider.dart';
import 'package:provider/provider.dart';

class cardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<contentOfProducts>(context).items.firstWhere((element) => element.id == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(loadedProduct.imageUrl),
          ),
        ],
      ),
    );
  }
}
