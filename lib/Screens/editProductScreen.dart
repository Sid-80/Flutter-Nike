import 'package:flutter/material.dart';

class editProductScreen extends StatefulWidget {
  const editProductScreen({Key? key}) : super(key: key);

  @override
  State<editProductScreen> createState() => _editProductScreenState();
}

class _editProductScreenState extends State<editProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  void _updateImageUrl(){
    if(!_imageUrlFocusNode.hasFocus){
      setState(() {

      });
    }
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {_updateImageUrl;});
    super.initState();
  }

  @override
  void dispose(){
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _descriptionFocusNode.dispose();
    _priceFocusNode.dispose();
    _imageController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _saveForm () {
    if(_form.currentState!=null){
      _form.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
        actions: [
          IconButton(onPressed: _saveForm, icon: Icon(Icons.save_alt)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title'
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_){
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Price'
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_){
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Description'
                  ),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  focusNode: _descriptionFocusNode,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 8,right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey
                        )
                      ),
                      child: _imageController.text.isEmpty ? const Text('Enter a Url') : FittedBox(
                        child: Image.network(_imageController.text),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(labelText: "Image Url"),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: _imageController,
                      focusNode: _imageUrlFocusNode,
                      onEditingComplete: () {
                        _saveForm();
                      },
                    )),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
