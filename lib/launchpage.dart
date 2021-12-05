import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home:LaunchPage(),
));

class LaunchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'NYU TRADE',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Oswald',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/nyuflag.jpeg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: const Center(


        ) /* add child content here */,
      ),
    );
  }
}

