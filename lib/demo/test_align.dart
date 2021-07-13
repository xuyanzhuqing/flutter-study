import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        spacing: 8.0, // 横向块间距
        runSpacing: 20.0, // 行间距
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.teal[50],
            child: Align(
              alignment: Alignment.topRight,
              child: Text('align top right'),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.teal[50],
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('align bottomCenter'),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.teal[50],
            child: Align(
              alignment: Alignment(0.0, 0.0),
              child: Text('align 0, 0'),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.teal[50],
            child: Align(
              alignment: Alignment(1, 1),
              child: Text('align 1, 1'),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.teal[50],
            child: Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    child: Text('ss'),
                    left: getAlignmentPoint(1, 100) - 20.0,
                    top: getAlignmentPoint(1, 100) - 20.0
                  )
                ]
              ),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.teal[50],
            child: Align(
              // 以左上角为坐标原点
              alignment: FractionalOffset(1, 1),
              child: Text('FractionalOffset(1, 1) 以左上角为坐标原点'),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.teal[50],
            child: Align(
              // 以左上角为坐标原点
              alignment: FractionalOffset(1, 1),
              child: Text('FractionalOffset(1, 1) 以左上角为坐标原点'),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.teal[50],
            child: Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    child: Text('ss'),
                    left: getFractionalOffset(1, 100) - 20.0,
                    top: getFractionalOffset(1, 100) - 20.0
                  )
                ]
              ),
            ),
          ),
        ],
      )
    );
  }
  
  // 以中心点计算坐标
  double getAlignmentPoint (double n, double size) {
    return n*size/2+size/2;
  }

  // 以左上角计算坐标
  double getFractionalOffset(double n, double size) {
    return n * size;
  }
}