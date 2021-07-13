import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestConstraint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget redbox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

    return Scaffold(
      appBar: AppBar(
        title: Text('限制容器')
      ),
      body: Column(
        children: <Widget>[
          ConstrainedBox(constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: 30,
          ),
          child: Container(
            height: 5,
            child: redbox
          ),
          )
        ],
      )
    );
  }
}