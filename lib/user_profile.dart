import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyutrade/my_posts_tabs.dart';
import 'package:nyutrade/sign_in.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black12, spreadRadius: 1),
                    ],
                    image: DecorationImage(
                        image: AssetImage('assets/images/nyu_logo.png'),
                        fit: BoxFit.fitHeight,
                    )
                ),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0,2.5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageUrl
                      ),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 80,
              ),

              Text(
                name,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xff70597A),
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w800
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Text(
                email,
                style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.black45,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w300
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Text(
              //   "App Developer at XYZ Company"
              //   ,style: TextStyle(
              //     fontSize: 15.0,
              //     color:Colors.black45,
              //     letterSpacing: 2.0,
              //     fontWeight: FontWeight.w300
              //  ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Card(
              //     margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
              //
              //     elevation: 2.0,
              //     child: Padding(
              //         padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
              //         child: Text("Skill Sets",style: TextStyle(
              //             letterSpacing: 2.0,
              //             fontWeight: FontWeight.w300
              //         ),))
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // Text(
              //   "App Developer || Digital Marketer"
              //   ,style: TextStyle(
              //     fontSize: 18.0,
              //     color:Colors.black45,
              //     letterSpacing: 2.0,
              //     fontWeight: FontWeight.w300
              // ),
              // ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 200.0,vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("BUYER RATING",
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600
                              ),),
                            SizedBox(
                              height: 7,
                            ),
                            Text("x / 5",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w300
                              ),)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("SELLER RATING",
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600
                              ),),
                            SizedBox(
                              height: 7,
                            ),
                            Text("x / 5",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w300
                              ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return MyTabs();
                          },
                        ),
                      );
                    },
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.deepPurple,Colors.deepPurpleAccent]
                        ),
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 200.0, maxHeight: 40.0,),
                        alignment: Alignment.center,
                        child: Text(
                          "View Your Posts",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ),
                  ),
                  // can add stuff here that'll be in line w the button
                ],
              )
            ],
          ),
        )
    );
  }
}