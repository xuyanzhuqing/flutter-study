import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groupbuy/components/my_page.dart';

class TestImage extends MyPage {
  final title = '测试资源';

  @override
  List<Widget> myBuild (BuildContext context) {
    AssetImage img = AssetImage("assets/image/tree.jpg");
    return [
      Image.asset('assets/image/tree.jpg'),
      Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        width: 100.0,
      ),
      Image(
        image: AssetImage("assets/image/tree.jpg"),
        width: 100.0,
        height: 200.0,
        repeat: ImageRepeat.repeatY ,
      ),
      ...<Image>[
        Image(
          image: img,
          height: 50.0,
          width: 100.0,
          fit: BoxFit.fill,
        ),
        Image(
          image: img,
          height: 50,
          width: 50.0,
          fit: BoxFit.contain,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.fitWidth,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.fitHeight,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.scaleDown,
        ),
        Image(
          image: img,
          height: 50.0,
          width: 100.0,
          fit: BoxFit.none,
        ),
        Image(
          image: img,
          width: 100.0,
          color: Colors.blue,
          colorBlendMode: BlendMode.difference,
          fit: BoxFit.fill,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 200.0,
          repeat: ImageRepeat.repeatY ,
        )
      ].map((e){
        return Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 100,
                child: e,
              ),
            ),
            Text(e.fit.toString())
          ],
        );
      }).toList()
    ];
  }
}