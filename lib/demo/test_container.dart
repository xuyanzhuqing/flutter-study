import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupbuy/utils/color.dart' show hex2c, hex2cp;

class TestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试 containter')
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(10.0),
        // color: Colors.yellow,
        decoration: BoxDecoration(
          color: Colors.yellow
        ),
        constraints: BoxConstraints.tightFor(width: 200.0, height: 200.0),
        child: Container(
          width: 40.0,
          height: 40.0,
          transform: Matrix4.rotationZ(0.2),
          alignment: Alignment.center,
          child: Text('hello cungen', style: TextStyle(
            color: hex2cp('#ff0000f0')
          )),
        ),
      )
    );
  }
}