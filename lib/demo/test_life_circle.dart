import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class TestLifeCircle extends StatefulWidget {
  TestLifeCircle(
    Key key,
    this.initValue,
  ): super(key: key);

  final int initValue;

  @override
  State<StatefulWidget> createState() =>  _TestLifeCircle();
}

class _TestLifeCircle extends State<TestLifeCircle> {
  int _counter = 0;

  @override
  void initState() { // 类似于 create
    super.initState();
    this._counter = widget.initValue;
    print('init state');
  }

  @override
  Widget build(BuildContext context) { // 类似于 beforemounted
    String title = ModalRoute.of(context)?.settings.name as String;
    String arguments = ModalRoute.of(context)?.settings.arguments as String;
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Column(children: [
        Text(arguments),
        Text('counter now is $_counter'),
        ElevatedButton(onPressed: add, child: Text('add')),
        ElevatedButton(onPressed: back, child: Text('back'))
      ],),)
    );
  }

  @override
  void didUpdateWidget(TestLifeCircle oldWidget) { // 类似于 update
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() { // 对象树中移除
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() { // 永久移除，常用于在此释放资源
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() { // 仅仅在开发环境中存在，热重构之后触发
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() { // 依赖项发生变化时触发
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  add () {
    setState(() {
      this._counter++;
    });
  }

  back () {
    String data = convert.jsonEncode({
      "counter": _counter,
    }).toString();

    Navigator.pop(context, data);
  }
}