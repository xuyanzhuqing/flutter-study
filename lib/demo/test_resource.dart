import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupbuy/components/my_page.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

// 注意内存泄露
// http://www.flutterchina.net.cn/article/3039529815.html

class TestResource extends MyPage {
  final title = '测试资源';

  @override
  List<Widget> myBuild (BuildContext context) {
    return [
      Image.asset('assets/image/tree.jpg', width: 200, height: 100),
      ElevatedButton(onPressed: () {
        Future<String> conf = loadAsset();
        conf.then((res) {
          print(json.decode(res)['name']);
        }).catchError((err) {
          throw err;
        });
      }, child: Text('get config')),
    ];
  }

  Future<String> loadAsset() async {
    // 该方法仅用于加载配置文件, 用于其他用途的，需要禁止掉缓存, 默认开启缓存
    bool cache = false;
    return await rootBundle.loadString('assets/config.json', cache: cache);
  }
}