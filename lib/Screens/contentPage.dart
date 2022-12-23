import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmain/widgets/order_drawer.dart';
import '../providers/contentClass.dart';
import '../providers/content_provider.dart';
import './cart.dart';
import '../widgets/badge.dart';

enum dropdownList{
  Favourites,
  Cart
}

class contentPage extends StatefulWidget {
  const contentPage({Key? key}) : super(key: key);

  @override
  State<contentPage> createState() => _contentPageState();
}

class _contentPageState extends State<contentPage> {
  @override
  Widget build(BuildContext context) {
    var showOnlyFav = false;
    final product = Provider.of<contentOfProducts>(context);
    final productData = showOnlyFav ? product.favouriteItems : product.items;
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      drawer: OrderDrawer(),
      appBar: AppBar(
        title: const Text("Nike"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (dropdownList selectedValue) {
              setState(() {
                if(selectedValue == dropdownList.Favourites){
                  showOnlyFav = true;
                }else{
                  showOnlyFav = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                const PopupMenuItem(child: Text("Favourites"),value: dropdownList.Favourites,),
                const PopupMenuItem(child: Text("Cart"),value: dropdownList.Cart,)
              ]
          ),
         Consumer<Cart>(
           builder: (_, cart, ch)=>Badge(
             child: IconButton(onPressed: () {
               Navigator.pushNamed(context, '/cart');
             }, icon: Icon(Icons.shopping_cart)),
             value: cart.itemCount.toString(),
             color: Colors.blueAccent,
           ),
           child: IconButton(onPressed: () {
             Navigator.pushNamed(context, '/cart');
           }, icon: const Icon(Icons.shopping_cart)),
         )
        ],
      ),

      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisExtent: 250,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
            ),
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: productData[i],
              child: ContentCard(),
            ),
          itemCount: productData.length,
    ),
      )
    );
  }
}

class ContentCard extends StatelessWidget {
  // final String productId;
  // final String title;
  // final double price;
  // final String imageUrl;
  // ContentCard(this.productId, this.title,this.price, this.imageUrl);

  @override
  Widget build(BuildContext context) {
  final product = Provider.of<Content>(context);
  final cart = Provider.of<Cart>(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.tealAccent ,Colors.white],begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
                '/cardContent',
              arguments: product.id
            );
          },
          child: Card(
            color: Colors.transparent,
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              image : DecorationImage(image: NetworkImage(product.imageUrl),fit: BoxFit.cover),
                          )
                      ),
                      Consumer<Content>(
                        builder: (ctx,product,child) =>  Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  product.toggleFavourite();
                                }, child: (product.isFav ? const Icon(Icons.favorite): const Icon(Icons.favorite_border))
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  cart.addItem(product.id, product.price, product.title);
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: const Text("Added Item to the cart !!", textAlign: TextAlign.center,),
                                        duration: const Duration(seconds: 2),
                                        action: SnackBarAction(label: 'UNDO', onPressed: () {
                                          cart.removeSingleItem(product.id);
                                        }),
                                      )
                                  );
                                },
                                child: const Icon(Icons.shopping_cart))
                          ],
                        ),
                      )
                    ],
                  ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center
                    ,
                    children: [
                      Text(product.title),
                      Text(product.price.toString()),
                    ],
                  ),
                ),

                ]
              ),
            )

      ),
        ),
    );
  }
}





