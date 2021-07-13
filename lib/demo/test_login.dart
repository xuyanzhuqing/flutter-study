import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';

class TestLogin extends StatefulWidget {
  final title = '测试 checkbox';

  @override
  State<StatefulWidget> createState () => _TestLogin();
}

class _TestLogin extends State<TestLogin> {

  String _username = 'admin';
  String _userpass = 'admin123';

  TextEditingController _usernameContontroller = new TextEditingController();
  TextEditingController _userpassContontroller = new TextEditingController();

  MultiValidator _userpassValidator = MultiValidator([
    RequiredValidator(errorText: '用户密码不能为空'),
    MinLengthValidator(8, errorText: '最短6位'),
    MaxLengthValidator(16, errorText: '最长16'),
  ]);

  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState () {
    // 设置默认值
    _usernameContontroller.text = _username;
    _userpassContontroller.text = _userpass;

    _usernameContontroller.addListener(() {
      print(_usernameContontroller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('测试 form'),
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0), child: 
        Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10.0), child: Center(child: Text('登陆'),),),
              TextFormField(
                controller: _usernameContontroller,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  prefix: Icon(Icons.person)
                ),
                validator: (String? v) {
                  RegExp name = new RegExp(r"^[a-zA-Z]+$");

                  if (name.hasMatch(v?? '')) {
                    return null;
                  } else {
                    return '仅允许输入大小写字母';
                  }
                },
              ),
              TextFormField(
                controller: _userpassContontroller,
                decoration: InputDecoration(
                  labelText: '用户密码',
                  hintText: '请输入密码',
                  prefix: Icon(Icons.lock)
                ),
                obscureText: false,
                validator: _userpassValidator,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(child: Text('登陆'), onPressed: () {
                      if ((_formKey.currentState as FormState).validate()) {
                        print('验证通过');
                      }
                    },),
                  )
                ],
              )
            ]
          ),
        )
      )
    );
  }
}