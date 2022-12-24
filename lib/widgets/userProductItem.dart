import 'package:flutter/material.dart';

class userProductItem extends StatelessWidget {
  final String title;
  final String ImageUrl;
  userProductItem({required this.title,required this.ImageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(ImageUrl),),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
