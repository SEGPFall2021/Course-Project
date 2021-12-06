//Home Page of the app --> needs to be change because rn this is authorization page
import 'package:flutter/material.dart';
import 'package:nyutrade/constants/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  String title = "NYUtrADe Home Page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurpleAccent[100],
      ),
      body:
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 66,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: myController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        //do something here when pressed enter
                      },
                      textAlign: TextAlign.start,
                      decoration: textInputDecoration.copyWith(hintText: "Search...", suffixIcon: const Icon(Icons.search)),
                    ),
                  ),
                ),
              ],
      ),
          ],
        ),
    );
  }
}
