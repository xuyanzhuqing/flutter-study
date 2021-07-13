import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:groupbuy/demo/catch_error.dart';
import 'package:groupbuy/routes/router.dart';
import 'package:groupbuy/theme/default.dart' as defaultTheme;
import 'package:flutter/services.dart';
void main() {
  // 自定义输入错误页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发生错误　ohh...')
      ),
      body: Center(
        child: Text('some wrong occured'),
      )
    );
  };

  // ui 越界，布局错误拦截
  FlutterError.onError = (FlutterErrorDetails details) => CatchError.flutterError(details.exception, details.stack);
  runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      // runApp(MyApp());

      // 禁止横屏
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then((_) {
        runApp(new MyApp());
      });
    },
    CatchError.flutterError,
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        // CatchError.collectLog(line); // 收集日志
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTheme.theme,
      initialRoute: 'MyHome',
      routes: routes,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
