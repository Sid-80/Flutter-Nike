import 'package:flutter/material.dart';

class Content with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFav;

  Content({required this.id,required this.title,required this.description, required this.price, required this.imageUrl, this.isFav = false});

  void toggleFavourite(){
    isFav = !isFav;
    notifyListeners();
  }
}