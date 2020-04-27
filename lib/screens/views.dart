import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:html' as html; // For opening links in Web builds

import 'package:flutter/services.dart';

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
      text = null;
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
    return Scaffold(
      bottomSheet: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
          child: MaterialButton(
            onPressed: () => (html.window.open(
                "https://github.com/bgrgv/jsonPretty",
                "Code")), // flutter Web implementation
                          // use url_launcher to implement for Android/iOS
            child: Text(
              "View source code of jsonPretty",
              style: TextStyle(color: Colors.white, fontSize: 17.0),
            ),
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        hoverColor: Colors.blue[900],
        onPressed: () async {
          prettyPrint.length > 0
              ? await Clipboard.setData(ClipboardData(text: prettyPrint))
              : await Clipboard.setData(ClipboardData(
                  text: "Not a valid/supported JSON input\n--jsonPretty"));
        },
        child: Icon(Icons.content_copy),
      ),
      body: Row(
        children: <Widget>[
          // Let's create two equally sized columns
          Flexible(
            flex: 49,
            child: SafeArea(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: TextField(
                  // The parameters are self explanatory
                  // Check out this Medium post to learn more : https://medium.com/flutter-community/flutter-a-guide-on-textfield-ab62ef2e7654
                  enableSuggestions: false,
                  autocorrect: false,
                  maxLines: 30,
                  controller: inputController,
                  decoration: InputDecoration(
                      hintText:
                          ("Hey! 😊\n\nThis is a simple Flutter-Web application.\n\nInput your JSON to see results! You can copy your output using the button\non the bottom right corner. \n\n\n\nLove to contribute to this?\nOr wanna learn how to build this?\n\nYes?\n\tTap on the red button!\nNo?\n\t😕"),
                      hintStyle: TextStyle(
                        color: Colors.blue[400],
                        fontSize: 20.0,
                      ),
                      counter: Container(
                        child: Text(prettyPrint.length.toString()),
                      ),
                      prefixIcon: Icon(
                        Icons.code,
                        color: Colors.blue[700],
                      ),
                      border: OutlineInputBorder()),
                  onChanged: (input) {
                    makePretty(input);
                  },
                ),
              ),
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
                bottom: true,
                //Display the value of 'prettyPrint' in a 'Text' widget. The value of 'prettyPrint' will be updated by 'setState' of function 'makePretty'
                child: Center(
                  child: prettyPrint.length > 0
                      ? Text(
                          prettyPrint,
                          style: TextStyle(
                              fontSize: 20.0,
                              letterSpacing: 1.5,
                              height: 1.5,
                              color: Colors.blue[900]),
                        )
                      : Image.asset(
                          "images/wait.png",
                          scale: 2.0,
                        ),
                )),
          )
        ],
      ),
    );
  }
}
