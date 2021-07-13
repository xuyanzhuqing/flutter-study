import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestButton extends StatelessWidget {
  final title = '测试 button';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
          children: [
            ElevatedButton(
              child: Text("RaisedButton / ElevatedButton"),
              onPressed: () {},
            ),
            TextButton(
              child: Text("FlatButton / TextButton"),
              onPressed: () {},
            ),
            OutlinedButton(
              child: Text("OutlineButton / OutlinedButton"),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: _onPressed,
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: _onPressed,
            ),
            TextButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: _onPressed,
            ),
            TextButton(
              child: Text("自定义 button 样式"),
              //添加一个点击事件
              onPressed: () {},
              //设置按钮是否自动获取焦点
              // autofocus: true,
              //定义一下文本样式
              style: ButtonStyle(
                //定义文本的样式 这里设置的颜色是不起作用的
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 18, color: Colors.red)),
                //设置按钮上字体与图标的颜色
                //foregroundColor: MaterialStateProperty.all(Colors.deepPurple),
                //更优美的方式来设置
                foregroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.focused) &&
                        !states.contains(MaterialState.pressed)) {
                      //获取焦点时的颜色
                      return Colors.blue;
                    } else if (states.contains(MaterialState.pressed)) {
                      //按下时的颜色
                      return Colors.deepPurple;
                    }
                    //默认状态使用灰色
                    return Colors.grey;
                  },
                ),
                //背景颜色
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  //设置按下时的背景颜色
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.blue[200];
                  }
                  //默认不使用背景颜色
                  return null;
                }),
                //设置水波纹颜色
                overlayColor: MaterialStateProperty.all(Colors.yellow),
                //设置阴影  不适用于这里的TextButton
                elevation: MaterialStateProperty.all(0),
                //设置按钮内边距
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
                //设置按钮的大小
                minimumSize: MaterialStateProperty.all(Size(200, 100)),

                //设置边框
                side:
                    MaterialStateProperty.all(BorderSide(color: Colors.grey, width: 1)),
                //外边框装饰 会覆盖 side 配置的样式
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
            )
          ]
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

  _onPressed () {}
}