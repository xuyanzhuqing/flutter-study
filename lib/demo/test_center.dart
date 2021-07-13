import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DecoratedBox(decoration: BoxDecoration(color: Colors.green), child: Center(child: new Text('center'), widthFactor: 1,)),
          DecoratedBox(decoration: BoxDecoration(color: Colors.green), child: Center(child: new Text('center'), widthFactor: null,)),
        ],
      )
    );
  }
  
}