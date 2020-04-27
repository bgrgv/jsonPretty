import 'package:flutter/material.dart';
import 'dart:convert';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {


  TextEditingController inputController = TextEditingController();
  String inputText = "";
  JsonEncoder encoder = new JsonEncoder.withIndent("   ");
  String prettyPrint = "";
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Let's create two equally sized columns
        Flexible(
          flex: 49,
          child: SafeArea(
              child: TextField(
            autofocus: true,
            autocorrect: false,
            maxLines: 30,
            controller: inputController,
            decoration: InputDecoration(border: OutlineInputBorder()),
            onChanged: null //TOOD : add function to pass the input text
          )),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue[900],
          ),
        ),
        Flexible(
          flex: 49,
          child: SafeArea(child: Container()),
        )
      ],
    );
  }
}
