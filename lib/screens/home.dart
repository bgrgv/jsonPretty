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
        elevation: 10.0,
        leading: Icon(
          Icons.sentiment_very_satisfied,
          size: 40.0,
        ),
        // bottom: R,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(child: View()), //will replace later with required widget
          ],
        ),
      ),
    );
  }
}
