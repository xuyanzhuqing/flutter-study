import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStateFulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState () => new _MyStateFulWidget();
}

class _MyStateFulWidget extends State<MyStateFulWidget>{
  int times = 0;

  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: Center(child: Column(children: [
        Text('you have clicked $times times'),
        ElevatedButton(onPressed: () => clicked(1), child: Text('increase')),
        ElevatedButton(onPressed: () => clicked(-1), child: Text('decrease')),
      ],),)
    );
  }

  void clicked (int many) {
    setState(() {
      times = times + many;
    });
  }
}