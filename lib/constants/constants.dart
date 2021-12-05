//file to store constant values [decorators]
import 'package:flutter/material.dart';

//Decorator for text input
InputDecoration textInputDecoration = InputDecoration(
  hintText: "Email",
  hintStyle: TextStyle(fontStyle: FontStyle.italic),
  fillColor: Colors.grey[100],
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey.shade200, width: 2.0),
  ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.deepPurpleAccent.shade100, width: 2.0)
    ),
);