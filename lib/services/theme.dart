import 'package:flutter/material.dart';
import 'package:themed/themed.dart';

class MyTheme {
  static const color1 = ColorRef(Colors.white);
  static const color2 = ColorRef(Colors.blue);
  static const color3 = ColorRef(Colors.green);

  static const titleStyle = TextStyleRef(
    TextStyle(
        fontSize: 25,
        fontFamily: 'RobotoMono',
        fontWeight: FontWeight.w700,
        color: MyTheme.color1),
  );
  static const descriptionStyle = TextStyleRef(
    TextStyle(
      fontSize: 15,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w400,
      color: MyTheme.color1,
      fontFamily: 'RobotoMono',
    ),
  );
  static const headerStyle = TextStyleRef(
    TextStyle(
        fontSize: 35,
        fontFamily: 'RobotoMono',
        fontWeight: FontWeight.w400,
        color: MyTheme.color1),
  );
}

Map<ThemeRef, Object> anotherTheme = {
  MyTheme.color1: Colors.yellow,
  MyTheme.color2: Colors.pink,
  MyTheme.color3: Colors.purple,
};
