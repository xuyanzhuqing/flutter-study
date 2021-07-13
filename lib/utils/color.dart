// 颜色类工具
import 'dart:ui';

// e.g. #ffffff -> Colors.white
Color hex2c (String c) {
  RegExp reg = RegExp(r"#[0-9a-fA-F]{6}$");
  assert(reg.hasMatch(c), 'e.g. #ffffff should be matched');
  c = c.substring(1);
  return Color(int.parse(c, radix:16)).withAlpha(255);
}

Color hex2cp (String c) {
  RegExp reg = RegExp(r"#[0-9a-fA-F]{8}$");
  assert(reg.hasMatch(c), 'e.g. #ffffff00 should be matched');
  int len = c.length;
  c = c.substring(1, len - 2);
  String alpha = c.substring(len - 2, len);
  return Color(int.parse(c, radix:16)).withAlpha(int.parse(alpha, radix:16)); 
}