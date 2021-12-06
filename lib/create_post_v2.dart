import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePostV2 extends StatefulWidget {
  @override
  _StatefulDialogState createState() => _StatefulDialogState();
}

class _StatefulDialogState extends State<CreatePostV2> {
  final _prodNameFieldKey = GlobalKey<FormFieldState>();
  final _prodDescFieldKey = GlobalKey<FormFieldState>();
  final _prodPriceFieldKey = GlobalKey<FormFieldState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.all(10),
              content: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                    ],
                  )
              ),
              title: Text('New Post'),
              actions: <Widget>[
                InkWell(
                  child: Text('POST'),
                  onTap: () {
                    if (_prodNameFieldKey.currentState!.validate() && _prodDescFieldKey.currentState!.validate() && _prodPriceFieldKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      print(productNameController.text);
                      print(productDescriptionController.text);
                      print(priceController.text);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
              color: Colors.deepOrange,
              onPressed: () async {
                await showInformationDialog(context);
              },
              child: Text(
                "Create Post",
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
        ),
      ),
    );
  }
}