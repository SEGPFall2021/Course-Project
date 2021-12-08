import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nyutrade/login_page.dart';
import 'package:nyutrade/sign_in.dart';
import 'package:flutter/rendering.dart';
import 'package:nyutrade/create_post.dart';
import 'package:nyutrade/userProfile.dart';


class FirstScreen extends StatelessWidget {

  final databaseRef = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;
  int selectedCard = -1;

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
      body: StreamBuilder(
          stream: FirebaseDatabase.instance
              .reference()
              .child("posts")
              .onValue,
          builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
            if (snapshot.hasData) {
              Map<dynamic, dynamic> map = snapshot.data!.snapshot.value;
              map.forEach((dynamic, v) => print(v["name"]));

              return GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15),
                itemCount: map.values.toList().length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                        print(index);
                    },
                    child: Card(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text(map.values.toList()[index]["type"], style: TextStyle( fontWeight: FontWeight.w100, fontSize: 14),),
                              SizedBox(height: 10,),
                              Text(map.values.toList()[index]["name"], style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2F2F3E)),),
                              SizedBox(height: 10,),
                              Text(map.values.toList()[index]["description"], style: TextStyle( fontWeight: FontWeight.w100, fontSize: 14),),
                              SizedBox(height: 10,),
                              Text(('AED ' + map.values.toList()[index]["price"]), style: TextStyle( fontWeight: FontWeight.w100, fontSize: 14),),
                            ],
                          )
                      )
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }
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