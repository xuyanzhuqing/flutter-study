import 'package:flutter/cupertino.dart';
import 'package:groupbuy/components/tab.dart';

class TestTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>  _TestTab();
}

class _TestTab extends State<TestTab> {

  List<Items> items = [
    Items(value: 'home'),
    Items(value: 'manage'),
    Items(value: 'about'),
  ];

  String value = 'manage';

  @override
  Widget build(BuildContext context) {
    return Tab(items: items, value: value, onChange: onChange);
  }

  void onChange (String newVal) {
    setState(() {
      this.value = newVal;
    });
  }
}