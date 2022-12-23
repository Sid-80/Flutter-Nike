import 'package:flutter/foundation.dart';
import 'package:shopmain/widgets/cartItem.dart';

class cartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;

  cartItem({required this.id,required this.title,required this.quantity,required this.price});
}

class Cart with ChangeNotifier{
  late Map<String,cartItem> _items = {};

  Map<String,cartItem> get items{
    return{..._items};
}

  int get itemCount{
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String itemId, double price, String title, ){
    if(_items.containsKey(itemId)){
      _items.update(itemId, (oldItem) => cartItem(id: oldItem.id, title: oldItem.title, quantity: oldItem.quantity + 1, price: oldItem.price));
    }else{
      _items.putIfAbsent(itemId,() => cartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId){
    if(!_items.containsKey(productId)){
      return;
    }
    if(_items[productId]!.quantity > 1){
      _items.update(productId, (existingCartItem) => cartItem(id: existingCartItem.id, title: existingCartItem.title, quantity: existingCartItem.quantity - 1, price: existingCartItem.price));
    }else{
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }

}