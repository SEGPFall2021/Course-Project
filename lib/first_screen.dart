import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nyutrade/login_page.dart';
import 'package:nyutrade/sign_in.dart';
import 'package:flutter/rendering.dart';
import 'package:nyutrade/create_post.dart';
import 'package:nyutrade/create_post_v2.dart';
//import 'package:nyutrade/create_post_v3.dart';
import 'package:nyutrade/userProfile.dart';


class FirstScreen extends StatelessWidget {

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/nyutrade_logo_whitebg.png", height: AppBar().preferredSize.height),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black38),
            tooltip: 'Search',
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute<void>(
              //   builder: (BuildContext context) {
              //     return Scaffold(
              //       appBar: AppBar(
              //         title: const Text('Next page'),
              //       ),
              //       body: const Center(
              //         child: Text(
              //           'This is the next page',
              //           style: TextStyle(fontSize: 24),
              //         ),
              //       ),
              //     );
              //   },
              // ));
            },
          ),
          SizedBox(width: 10,),
          PopupMenuButton<int>(
            icon: const Icon(Icons.person, color: Colors.black38),
            elevation: 20,
            tooltip: 'Profile Options',
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('My Profile'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Log Out'),
              ),
            ],
            onSelected: (value) {
              if(value == 1){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {return UserProfile();}));
              } else if (value == 2) {
                signOutGoogle();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {return LoginPage();}));
              }
            },
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text("He'd have you all unravel at the"),
            color: Colors.teal[100],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Heed not the rabble'),
            color: Colors.teal[200],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Sound of screams but the'),
            color: Colors.teal[300],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Who scream'),
            color: Colors.teal[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution is coming...'),
            color: Colors.teal[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Colors.teal[600],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) {return newPost();}));
          Navigator.of(context).push(new MaterialPageRoute(builder:
              (BuildContext context) => new CreatePost())
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xff8900e1),
        tooltip: 'Create Post',
      ),
    );
  }
}