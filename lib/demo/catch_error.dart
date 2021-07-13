import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groupbuy/components/my_page.dart';

class CatchError extends MyPage {
  final String title = '测试报错';

  @override
  List<Widget> myBuild (BuildContext context) {
    return [
       ElevatedButton(onPressed: () {
         print('233');
       }, child: Text('测试拦截 print'),),
       ElevatedButton(onPressed: () {
          List<String> items = ["apple", 'banana'];
          try {
          String second = items[2];
          } catch (err) {
            print('数组越界');
          }
        }, child: Text('触发同步异常'),),
       ElevatedButton(onPressed: showAsyncError, child: Text('触发异步异常'),),
    ];
  }

  void showPrint () {
    print('try to catch print');
  }

  // 捕获异步异常
  void showAsyncError () {
    // try{
    //     Future.delayed(Duration(seconds: 1)).then((e) => Future.error("xxx"));
    // }catch (e){
    //     print(e);
    // }
    // 上面的代码时错误示范
    // 必须使用 runZoned 
    Future.delayed(Duration(seconds: 1)).then((e) => Future.error("这是一个异步错误"));
  }

  // 构建错误信息
  static FlutterErrorDetails makeDetails (Object obj, StackTrace stack) {
    return FlutterErrorDetails(
      exception: obj,
      stack: stack,
      context: ErrorSummary('自定义错误内容'), 
    );
  }

  // 捕获布局不规范，越界时触发
  static void flutterError (Object error, StackTrace? stack) {
    print('----------------------------------------');
    print(StackTrace);
    print('----------------------------------------');
  }
}
