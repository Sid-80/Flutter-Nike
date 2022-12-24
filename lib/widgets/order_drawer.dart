import 'package:flutter/material.dart';


class OrderDrawer extends StatelessWidget {
  const OrderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: const Text("Hii !!"),automaticallyImplyLeading: false),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop !!"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/content');
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders !!"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/order');
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Manage Products !!"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/userproduct');
            },
          )
        ],
      ),
    );
  }
}
