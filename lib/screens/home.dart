import 'package:flutter/material.dart';
import 'package:jsonPretty/screens/views.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("jsonPretty-bgrgv"),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          Expanded(child: View()), //will replace later with required widget
        ],
      ),
    );
  }
}
