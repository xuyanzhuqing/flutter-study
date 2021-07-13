import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestCheckbox extends StatefulWidget {
  final title = '测试 checkbox';

  @override
  State<StatefulWidget> createState () => _TestCheckbox();
}

class _TestCheckbox extends State<TestCheckbox> {
  bool _switch = false;
  bool _checkbox = false;
  // 中间态
  bool? _isTristate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试 checkbox'),
      ),
      body: Column(
        children: [
          Switch(
            value: _switch,
            onChanged: (value) {
               setState(() {
                 _switch = value;
               });
            },
          ),
          Checkbox(
            value: _checkbox,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkbox = value!;
              });
            }
          ),
          Checkbox(
            value: _isTristate,
            activeColor: Colors.red,
            tristate: true,
            onChanged: (value) {
              setState(() {
                _isTristate = value;
              });
            }
          )
        ],
      )
    );
  }
}