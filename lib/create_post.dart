import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  final _prodNameFieldKey = GlobalKey<FormFieldState>();
  final _prodDescFieldKey = GlobalKey<FormFieldState>();
  final _prodPriceFieldKey = GlobalKey<FormFieldState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  key: _prodNameFieldKey,
                  controller: productNameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.shopping_bag),
                    hintText: 'Product Name',
                    labelText: 'Product Name',
                  ),
                  onSaved: (String? value) {
                    // optional block of code:
                    // can be used to run code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value == null) ? 'Required!' : null;
                  },
                ),
                TextFormField(
                  key: _prodDescFieldKey,
                  controller: productDescriptionController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.description),
                    hintText: 'Product Description',
                    labelText: 'Product Description',
                  ),
                  onSaved: (String? value) {
                    // optional block of code:
                    // can be used to run code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value == null) ? 'Required!' : null;
                  },
                ),
                TextFormField(
                  key: _prodPriceFieldKey,
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                  decoration: const InputDecoration(
                    icon: Icon(Icons.attach_money),
                    hintText: 'Price',
                    labelText: 'Price',
                  ),
                  onSaved: (String? value) {
                    // optional block of code:
                    // can be used to run code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value == null) ? 'Required! Must be a number.' : null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_prodNameFieldKey.currentState!.validate() && _prodDescFieldKey.currentState!.validate() && _prodPriceFieldKey.currentState!.validate()) {
                        print(productNameController.text);
                        print(productDescriptionController.text);
                        print(priceController.text);
                      }
                    },
                    child: const Text('POST'),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}