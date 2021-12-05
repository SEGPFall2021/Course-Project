import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home:LaunchPage(),
));

class LaunchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NYU TRADE'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/nyuflag.jpeg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: Center(

        ) /* add child content here */,
      ),
    );
  }
}

