// https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupbuy/generated/l10n.dart';
import 'package:intl/intl.dart';

// 切换语言环境 S.load(Locale('de', 'DE'));
// 获取当前语言环境 Intl.getCurrentLocale()

class TestI10n extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试 i10n')
      ),
      body: Column(
        children: <Widget>[
          Text(S.of(context).test),
          Text(S.of(context).welcome("cungen")),
          Text(Intl.getCurrentLocale()),
          TextButton(onPressed: () {
            S.load(Locale('zh'));
          }, child: Text('切换到中文')),
          TextButton(onPressed: () {
            S.load(Locale('en'));
          }, child: Text('切换到英语')),
          TextButton(onPressed: () {
            S.load(Locale('zh233', 'en'));
          }, child: Text('fail back to en')),
          TextButton(onPressed: () {
            S.load(Locale('system'));
          }, child: Text('切换到系统语言')),
        ],
      )
    );
  }
}