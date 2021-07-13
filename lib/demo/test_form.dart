import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestForm extends StatefulWidget {
  final title = '测试 checkbox';

  @override
  State<StatefulWidget> createState () => _TestForm();
}

class _TestForm extends State<TestForm> {

  String _username = '';
  String _userpass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('测试 form'),
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0), child: 
        Column(
          children: [
            Padding(padding: EdgeInsets.all(10.0), child: Center(child: Text('登陆'),),),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
                prefix: Icon(Icons.person)
              ),
              onChanged: (String val) {
                setState(() {
                  _username = val;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '用户密码',
                hintText: '请输入密码',
                prefix: Icon(Icons.lock)
              ),
              obscureText: false,
              onChanged: (String val) {
                setState(() {
                  _userpass = val;
                });
              },
            ),
          ],
        )
      )
    );
  }
}