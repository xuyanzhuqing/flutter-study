import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groupbuy/components/my_page.dart';
import 'package:groupbuy/components/iconfont.dart';

class TestIcon extends MyPage {
  final title = '测试 icon';

  @override
  List<Widget> myBuild (BuildContext context) {
    String icons = "";
    // accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
    // error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
    // fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Material Design'),
            TextSpan(text: 'https://material.io/tools/icons/')
          ]
        )
      ),
      Text(icons,
        style: TextStyle(
            fontFamily: "MaterialIcons",
            fontSize: 24.0,
            color: Colors.green
        ),
      ),
      Icon(Icons.accessible,color: Colors.green,),
      Icon(Icons.error,color: Colors.green,),
      Icon(Icons.fingerprint,color: Colors.green,),
      Icon(Iconfont.query),
    ];
  }
}