// 通过父子通信，实现一个 tab 组建

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 定义 item
class Items {
  Items({ this.label, required this.value });

  final String value;
  final String? label;
}

class Tab extends StatefulWidget {
  final ValueChanged<String> onChange;

  Tab({ Key? key, required this.value, required this.items, required this.onChange }): super(key: key);

  final String value;

  final List<Items> items;

  @override
  State<StatefulWidget> createState() => _Tab();
}

class _Tab extends State<Tab> {
  @override
  Widget build(BuildContext context) {
    List<ChildItem> children = widget.items.map((item) {
      return ChildItem(item: item, active: widget.value == item.value, onChange: widget.onChange);
    }).toList();
    return Row(children: children,);
  }
}

class ChildItem extends StatelessWidget {
  final ValueChanged<String> onChange;

  ChildItem({ Key? key,  required this.item, required this.active, required this.onChange }): super(key: key);

  final Items item;
  
  final bool active;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => onPressed(item.value), child: Text(item.label ?? item.value, style: TextStyle(
      fontWeight: active ? FontWeight.w700 : FontWeight.w100
    )));
  }

  void onPressed (String newVal) {
    onChange(newVal);
  }
}