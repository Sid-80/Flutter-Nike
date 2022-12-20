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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Card(
            color: Colors.grey,
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(loadedProduct.imageUrl,fit: BoxFit.cover,),
                ),
                SizedBox(height: 20,),
                Text('\₹${loadedProduct.price}', style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  width: double.infinity,
                  child: Text(
                    loadedProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
