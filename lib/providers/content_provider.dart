import 'package:flutter/material.dart';
import './contentClass.dart';

class contentOfProducts with ChangeNotifier{
  List<Content> _items =[
    Content(
        id: 'i1',
        title: 'Nike Air Max TW',
        description: "So you're in love with the classic look of the '90s, but you've got a thing for today's fast-paced culture. Meet the Air Max TW. Inspired by the treasured franchise that brought Nike Air cushioning to the world and laid the foundation for the track-to-street aesthetic, its eye-catching design delivers a 1–2 punch of comfort and fashion. Ready to highlight any 'fit, its lightweight upper pairs angular and organic lines to create an entrancing haptic effect. The contrasting colourways make it easy to style. And if you're ready for the next step, the 5 windows underfoot deliver a modern edge to visible Air cushioning.",
        price: 14995,
        imageUrl:'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1c650630-634e-4a73-bd58-a590042ea868/air-max-tw-shoes-DhpWvV.png'
    ),
    Content(
        id: 'i2',
        title: 'Jordan Delta 3 Mid',
        description: "Inspired by '90s on-court gear and the Space-Age aesthetic, the Delta 3 is ready to launch. With super-lightweight technical materials, they have a retro-futuristic look and feel. This is the next-gen footwear that's gonna take you into tomorrow.",
        price: 13995,
        imageUrl:'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/47dfb42d-c70d-4bbe-b989-452fcfc75207/jordan-delta-3-mid-shoes-WwnTQl.png'
    ),
    Content(
        id: 'i3',
        title: 'Nike Air Max Flyknit Racer',
        description: "So you're in love with the classic look of the '90s, but you've got a thing for today's fast-paced culture. Meet the Air Max TW. Inspired by the treasured franchise that brought Nike Air cushioning to the world and laid the foundation for the track-to-street aesthetic, its eye-catching design delivers a 1–2 punch of comfort and fashion. Ready to highlight any 'fit, its lightweight upper pairs angular and organic lines to create an entrancing haptic effect. The contrasting colourways make it easy to style. And if you're ready for the next step, the 5 windows underfoot deliver a modern edge to visible Air cushioning.",
        price: 14995,
        imageUrl:'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c2deb3da-1553-4988-8ae2-c086c12017c8/air-max-flyknit-racer-shoes-Q9lN71.png'
    ),
    Content(
        id: 'i4',
        title: 'Nike Air Max 97',
        description: "Step into the history books. These special-edition kicks pay homage to Frank Rudy, the man who created the coveted cornerstone of cushioning—Air. From the see-through 'Air pocket' heel logo to 'Est. 1997' proudly stamped on the Air unit, celebrate Frank's legacy with fun details that deliver a lesson in comfort.",
        price: 14995,
        imageUrl:'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/23d6e455-011d-4625-a5e9-cde8b3643438/air-max-97-shoes-F3zQb2.png'
    ),
  ];

  var _showFavouritesOnly = false;

  List<Content> get items{
    if(_showFavouritesOnly){
      return _items.where((element) => element.isFav).toList();
    }
    return [..._items];
  }
  void showFavouritesOnly(){
    _showFavouritesOnly = true;
    notifyListeners();
  }
  void showAll(){
    _showFavouritesOnly = false;
    notifyListeners();
  }
}