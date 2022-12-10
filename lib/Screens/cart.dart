import 'package:flutter/foundation.dart';

class cartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;

  cartItem({required this.id,required this.title,required this.quantity,required this.price});
}

class Cart with ChangeNotifier{
  late Map<String,cartItem> _items;

  Map<String,cartItem> get items{
    return{..._items};
}

  void addItem(String itemId, double price, String title, ){
    if(_items.containsKey(itemId)){
      _items.update(itemId, (oldItem) => cartItem(id: oldItem.id, title: oldItem.title, quantity: oldItem.quantity + 1, price: oldItem.price));
    }else{
      _items.putIfAbsent(itemId,() => cartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
    }
  }
}