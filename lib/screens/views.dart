import 'package:flutter/material.dart';
import 'dart:convert';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  // Takes in the input text as 'text' and formats the JSON
  void makePretty(String text) {
    //use setState to dynamically update the value of variables that are used to display content
    setState(() {
      prettyPrint = encoder.convert(jsonDecode(text));
      // print(prettyPrint); //Check terminal or console for output
    });
  }

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
            onChanged: (input) {
              makePretty(input);
            },
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
          child: SafeArea(
              //Display the value of 'prettyPrint' in a 'Text' widget. The value of 'prettyPrint' will be updated by 'setState' of function 'makePretty'
              child: Center(
            child: Text(prettyPrint),
          )),
        )
      ],
    );
  }
}
