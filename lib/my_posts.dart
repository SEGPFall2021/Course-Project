import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nyutrade/create_post.dart';

class MyPosts extends StatelessWidget {

  final databaseRef = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;
  int selectedCard = -1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder(
          stream: databaseRef.child("posts").orderByChild("client").equalTo(auth.currentUser!.uid).onValue,
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
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}