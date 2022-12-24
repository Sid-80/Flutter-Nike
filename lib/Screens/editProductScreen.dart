import 'package:flutter/material.dart';

class editProductScreen extends StatefulWidget {
  const editProductScreen({Key? key}) : super(key: key);

  @override
  State<editProductScreen> createState() => _editProductScreenState();
}

class _editProductScreenState extends State<editProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
      ),
      body: Form(
          child: ListView(
            children: [
              TextFormField(),
            ],
          )
      ),
    );
  }
}
