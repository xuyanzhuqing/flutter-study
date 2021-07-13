import 'package:groupbuy/routes/router.dart' as router;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupbuy/utils/route.dart';
import 'package:groupbuy/demo/test_life_circle.dart';
import 'package:groupbuy/demo/test_tab.dart';
import 'package:groupbuy/demo/test_resource.dart';
import 'package:groupbuy/demo/catch_error.dart';
import 'package:groupbuy/demo/test_login.dart';
import 'package:groupbuy/demo/test_flex.dart';
import 'package:groupbuy/demo/test_wrap.dart';
import 'package:groupbuy/demo/test_stack.dart';
import 'package:groupbuy/demo/test_align.dart';
import 'package:groupbuy/demo/test_center.dart';
import 'package:groupbuy/demo/test_padding.dart';
import 'package:groupbuy/demo/test_constraint.dart';
import 'package:groupbuy/demo/test_container.dart';
import 'package:groupbuy/demo/test_provider.dart';
import 'package:groupbuy/demo/test_i10n.dart';

class MyHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('home')
      ),
       body: Scrollbar(
        child: SingleChildScrollView(
          child: Wrap(
          spacing: 8.0, //水平间距
          runSpacing: 4.0, // 垂直间距
          alignment: WrapAlignment.start,
          children: [
            Container(
              child: Builder(builder: (context) {
                dynamic scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
                // 获取 title
                return scaffold?.appBar?.title;
              }),
            ),
            TextButton(
              onPressed: () {
                String route = 'MyStateFulWidget';
                Navigator.pushNamed(context, route, arguments: route);
              },
              child: new Text('有状态的组建')
            ),
            TextButton(onPressed: () async {
              // 测试路由回参
              await Navigator.push(
                context,
                MaterialPageRoute(
                  // 路由参数
                  settings: RouteSettings(
                    arguments: "just for test route",
                    name: "测试生命周期"
                  ),
                  builder: (BuildContext context) {
                    return TestLifeCircle(UniqueKey(), 10);
                  }
                )
              );
              // Map<String, dynamic> resMap = json.decode(res);
              // // 不推荐这种形式，容易写错，建议使用序列化反序列话参数
              // print('I get a response result:${resMap['counter']}');
            }, child: Text('测试生命周期'),),
            openNamedRoute(context, routeName: 'not_existed_route', text: '测试路由拦截器'),
            openVoidRoute(context, routeName: 'TestResource', text: '测试资源', builder: (context) => TestResource()),
            openVoidRoute(context, routeName: 'CatchError', text: '测试错误拦截', builder: (context) => CatchError()),
            TextButton(onPressed: () {
              // 查找父级最近的Scaffold对应的ScaffoldState对象
              ScaffoldState _state = Scaffold.of(context); // 社区约定等同于ScaffoldState? _state = context.findAncestorStateOfType<ScaffoldState>();
              print(_state.hasAppBar);
              //调用ScaffoldState的showSnackBar来弹出SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar"),
                ),
              );
            }, child: Text('获取最近的 Scaffold')),
            TextButton(
                child: Text("ios 风格组建"),
                onPressed: () {
                  Navigator.pushNamed(context, 'CupertinoPage');
                }
            ),
            openNamedRoute(context, routeName: 'TestText', text: '测试 text 组建'),
            TestTab(),
            ...createNamedRoute(context),
            openVoidRoute(context, routeName: 'TestLogin', text: '测试登陆', builder: (context) => TestLogin()),
            openVoidRoute(context, routeName: 'TestFlex', text: '测试flex', builder: (context) => TestFlex()),
            openVoidRoute(context, routeName: 'TestWrap', text: '测试 Wrap', builder: (context) => TestWrap()),
            openVoidRoute(context, routeName: 'TestStack', text: 'TestStack', builder: (context) => TestStack()),
            openVoidRoute(context, routeName: 'TestAlign', text: 'TestAlign', builder: (context) => TestAlign()),
            openVoidRoute(context, routeName: 'TestCenter', text: 'TestCenter', builder: (context) => TestCenter()),
            openVoidRoute(context, routeName: 'TestPadding', text: 'TestPadding', builder: (context) => TestPadding()),
            openVoidRoute(context, routeName: 'TestConstraint', text: 'TestConstraint', builder: (context) => TestConstraint()),
            openVoidRoute(context, routeName: 'TestContainer', text: 'TestContainer', builder: (context) => TestContainer()),
            openVoidRoute(context, routeName: 'TestProvider', text: 'TestProvider', builder: (context) => TestProvider()),
            openVoidRoute(context, routeName: 'TestI10n', text: 'TestI10n', builder: (context) => TestI10n()),
          ],
        )
      )
       )
    );
  }

  List<Widget> createNamedRoute (BuildContext context) {
    List<Widget> res = [];
    List<String> blackList = ['MyStateFulWidget'];

    router.routes.forEach((key, value) {
      if (blackList.indexOf(key) < 0) {
        res.add(openNamedRoute(context, routeName: key, text: key));
      }
    });

    return res;
  }
}