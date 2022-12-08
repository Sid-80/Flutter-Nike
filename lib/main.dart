import 'package:flutter/material.dart';
import './Screens/HomePage.dart';
import './Screens/contentPage.dart';
import 'package:provider/provider.dart';
import './providers/content_provider.dart';
import './Screens/cardContent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/content' : (context) => contentPage(),
          '/cardContent' : (context) => cardContent()
        },
      ),
      create: (ctx) => contentOfProducts(),
    );
  }
}
