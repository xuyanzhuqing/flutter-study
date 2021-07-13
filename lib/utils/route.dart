import 'package:flutter/material.dart';

// 打开一个命名路由
TextButton openNamedRoute (BuildContext context, { String routeName: '', String text: '' }) {
  print('open a named route');
  return TextButton(onPressed: () {
    Navigator.of(context).pushNamed(routeName);
  }, child: Text(text));
}

// 打开一个匿名路由
TextButton openVoidRoute (BuildContext context, { String routeName: '', String text: '', var builder }) {
  print('open a void route');
  return TextButton(onPressed: () async {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(
          name: text
        ),
        builder: builder
      )
    );
  }, child: Text(text),);
}