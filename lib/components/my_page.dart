import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final String title = 'page';

  List<Widget> myBuild (BuildContext context) {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(title)
      ),
       body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
          child: Column(
              children: myBuild(context),
            ),
          )
        )
       )
    );
  }
}
