import 'package:flutter/material.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Let's create two equally sized columns
        Flexible(
          flex: 5,
          child: Container(
            color: Colors.red,
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
