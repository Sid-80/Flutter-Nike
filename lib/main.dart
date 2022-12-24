import 'package:flutter/material.dart';
import 'package:shopmain/Screens/cart_screen.dart';
import 'package:shopmain/Screens/orders_screen.dart';
import 'package:shopmain/providers/orders.dart';
import './Screens/cart.dart';
import './Screens/HomePage.dart';
import './Screens/contentPage.dart';
import 'package:provider/provider.dart';
import './providers/content_provider.dart';
import './Screens/cardContent.dart';
import 'Screens/userProductScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(providers: [
          ChangeNotifierProvider(create:(ctx) => contentOfProducts()),
          ChangeNotifierProvider(create:(ctx) =>Cart()),
        ChangeNotifierProvider(create: (ctx) =>Orders()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/content' : (context) => contentPage(),
          '/cardContent' : (context) => cardContent(),
          '/cart' : (context) => CartScreen(),
          '/order' : (context) => OrdersScreen(),
          '/userproduct' : (context) => userProductScreen(),
        },
      ),
    );
  }
}
