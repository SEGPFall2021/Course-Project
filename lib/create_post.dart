import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nyutrade/sign_in.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final databaseRef = FirebaseDatabase.instance.reference();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void addData(String section, String prodName, String prodDescrip, String price) {
    databaseRef.child(section).child(auth.currentUser!.uid).push().set({'name': prodName, 'description': prodDescrip, 'price': price});
  }

  final _prodNameFieldKey = GlobalKey<FormFieldState>();
  final _prodDescFieldKey = GlobalKey<FormFieldState>();
  final _prodPriceFieldKey = GlobalKey<FormFieldState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  int value = 1;
  Widget CustomRadioButton(String text, int index) {
    return OutlineButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (value == index) ? Colors.deepPurpleAccent : Colors.black,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      borderSide:
      BorderSide(color: (value == index) ? Colors.deepPurpleAccent : Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(value == 1) {
      productNameController.clear();
      productDescriptionController.clear();
      priceController.clear();
      return Scaffold(
          body: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                      children: <Widget>[
                        CustomRadioButton("Add New Product", 1),
                        SizedBox(width: 10,),
                        CustomRadioButton("Request New Product", 2),
                      ]
                  ),
                  SizedBox(height: 10,),
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
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
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
                      return (value == null)
                          ? 'Required! Must be a number.'
                          : null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_prodNameFieldKey.currentState!.validate() &&
                            _prodDescFieldKey.currentState!.validate() &&
                            _prodPriceFieldKey.currentState!.validate()) {
                          print(productNameController.text);
                          print(productDescriptionController.text);
                          print(priceController.text);
                          addData('posts', productNameController.text, productDescriptionController.text, priceController.text);
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
    } else if (value == 2) {
      productNameController.clear();
      productDescriptionController.clear();
      priceController.clear();
      return Scaffold(
          body: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                      children: <Widget>[
                        CustomRadioButton("Add New Product", 1),
                        SizedBox(width: 10,),
                        CustomRadioButton("Request New Product", 2),
                      ]
                  ),
                  SizedBox(height: 10,),
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
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    decoration: const InputDecoration(
                      icon: Icon(Icons.attach_money),
                      hintText: 'Budget',
                      labelText: 'Budget (Optional)',
                    ),
                    onSaved: (String? value) {
                      // optional block of code:
                      // can be used to run code when the user saves the form.
                    },
                    validator: (String? value) {
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_prodNameFieldKey.currentState!.validate() &&
                            _prodDescFieldKey.currentState!.validate() &&
                            _prodPriceFieldKey.currentState!.validate()) {
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
    return Scaffold(
        body: Form(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                          children: <Widget>[
                            CustomRadioButton("Add New Product", 1),
                            SizedBox(width: 10,),
                            CustomRadioButton("Request New Product", 2),
                          ]
                      )
                    ]
                )
            )
        )
    );
  }
}