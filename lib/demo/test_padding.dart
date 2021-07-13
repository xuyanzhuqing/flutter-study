import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('')
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: Text("padding 8.0")),
          Padding(padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0), child: Text("padding 8.0")),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0), child: Text("padding 8.0")),
          Padding(padding: const EdgeInsets.only(left: 20.0,), child: Text("padding 8.0")),
        ],
      )
    );
  }
}