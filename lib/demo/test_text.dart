import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestText extends StatelessWidget {
  final String title = '测试文本组建1';

  final TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'SourceHanSans'
          )
        ),
      ),
      body: Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.amber[100],
          child: Column(
          children: [
            ...createTitle('textAlign'),
            Text(
              "单行文本不生效",
              //  textAlign: TextAlign.left,
            ),
            Text(
              "多行文本才生效"*5,
              textAlign: TextAlign.left,
            ),
            Text(
              "多行文本才生效"*5,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'SourceCodePro'
              )
            ),
            Text(
              "test font family 1",
              style: TextStyle(
                fontFamily: 'SourceCodePro'
              )
            ),
            Text(
              "test font family 1",
              style: TextStyle(
                fontFamily: 'SourceCodePro',
                fontWeight: FontWeight.bold,
              )
            ),
            Text(
              "test font family 2",
              style: TextStyle(
                fontFamily: 'SourceHanSans',
                fontWeight: FontWeight.bold,
              ),
            ),
            ...createTitle('超出省略'),
            Text(
              "超出省略超出省略"*20,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            ...createTitle('字体缩放1.5倍'),
            Text(
              "字体缩放",
              textScaleFactor: 1.5,
            ),
            Text("Hello world",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18.0,
                height: 1.2,  
                fontFamily: "Courier",
                background: new Paint()..color=Colors.yellow,
                decoration:TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            ...createTitle('TextSpan'),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '测试点击文本'),
                  TextSpan(
                    text: 'https://baidu.com1',
                    style: TextStyle(
                      color: Colors.red
                    ),
                    recognizer: tapGestureRecognizer..onTap = () {
                      print('跳转去百度');
                    }
                  ),
                ]
              ),
              style: TextStyle(backgroundColor: Colors.blue[50]),
            ),
            ...createTitle('测试默认文本样式，继承与不继承'),
            DefaultTextStyle(
              //1.设置文本默认样式  
              style: TextStyle(
                color:Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                  Text("I am Jack",
                    style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ))
    ));
  }

  List<Text> createTitle (String words) {
    return [
      Text('-'*60),
      Text(words),
      Text('-'*60),
    ];
  }

  _recognizer () {
    print('_recognizer');
  }
}