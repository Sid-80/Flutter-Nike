import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/contentClass.dart';
import '../providers/content_provider.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nike"),
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
    return Container(
      decoration: BoxDecoration(
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
              padding: EdgeInsets.all(15),
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
                        builder: (ctx,product,child) =>  ElevatedButton(
                            onPressed: () {
                              product.toggleFavourite();
                            }, child: (product.isFav ? Icon(Icons.favorite):Icon(Icons.favorite_border))
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





