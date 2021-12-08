import 'package:flutter/material.dart';
import 'package:nyutrade/my_requests.dart';
import 'package:nyutrade/sign_in.dart';
import 'package:nyutrade/user_profile.dart';
import 'login_page.dart';
import 'my_posts.dart';

class MyTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset("assets/images/nyutrade_logo_whitebg.png", height: AppBar().preferredSize.height),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: <Widget>[
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
            bottom: TabBar(
              indicatorColor: Colors.deepPurpleAccent,
              labelColor: Colors.black38,
              tabs: [
                Tab(text: "My Listings"),
                Tab(text: "My Requests")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MyPosts(),
              MyRequests(),
            ],
          ),
        ),
      ),
    );
  }
}