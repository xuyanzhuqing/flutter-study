import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ios 风格组建

class CupertinoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.inactiveGray,
            child: Text("Press"),
            onPressed: () {}
        ),
      ),
    );
  }
}