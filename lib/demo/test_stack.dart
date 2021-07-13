import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestStack extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 300,
        color: Colors.blueGrey,
        // 层叠布局方式
        child: Expanded(child: Stack(
          // fit: StackFit.expand,
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            Container(child: Text('hello', style: TextStyle(backgroundColor: Colors.green),), color: Colors.grey),
            Positioned(child: Text('left'), left: 18.0),
            Positioned(child: Text('top'), top: 18.0),
            Positioned(child: Container(child: Text('top'), color: Colors.green[500]), bottom: 18.0, height: 100),
          ],
        ),)
      )
    );
  }
}
