import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试wrap'),
        actions: [
          Icon(Icons.podcasts)
        ],
      ),
      body: Column(
        children: [
          BackButton(onPressed: () {
            Navigator.pop(context);
          }),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.green
                )
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.green
                )
              ),
              Container(
                width: 100.0,
                height: 30.0,
                color: Colors.red,
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.green
                )
              ),
              Container(
                width: 100.0,
                height: 30.0,
                color: Colors.red,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.green
                )
              ),
            ],
          )
        ],
      )
    ); 
  }
}