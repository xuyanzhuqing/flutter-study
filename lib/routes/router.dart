import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groupbuy/demo/my_stateful_widget.dart';
import 'package:groupbuy/demo/home.dart';
import 'package:groupbuy/demo/test_resource.dart';
import 'package:groupbuy/demo/not_found.dart';
import 'package:groupbuy/demo/cupertino_page.dart';
import 'package:groupbuy/demo/test_text.dart';
import 'package:groupbuy/demo/test_button.dart';
import 'package:groupbuy/demo/test_image.dart';
import 'package:groupbuy/demo/test_icon.dart';
import 'package:groupbuy/demo/test_checkbox.dart';
import 'package:groupbuy/demo/test_form.dart';
import 'package:groupbuy/demo/test_flutter_map.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'MyStateFulWidget': (context) => MyStateFulWidget(),
  "TestResource": (context) => TestResource(),
  "CupertinoPage": (context) => CupertinoPage(),
  "MyHome": (context) => MyHome(),
  "TestText": (context) => TestText(),
  "TestButton": (context) => TestButton(),
  "TestImage": (context) => TestImage(),
  "TestIcon": (context) => TestIcon(),
  "TestCheckbox": (context) => TestCheckbox(),
  "TestForm": (context) => TestForm(),
  "TestFlutterMap": (context) => TestFlutterMap(),
};

// 路由拦截
dynamic onGenerateRoute = (RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
      String routeName = settings.name ?? '';
      if (!routes.containsKey(routeName)) {
        return NotFound();
      } else {
        Widget Function(BuildContext)? fn = routes[routeName];
        return fn!(context);
      }
    }
  );
};
