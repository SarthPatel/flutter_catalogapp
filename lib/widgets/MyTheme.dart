import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
       primarySwatch:  Colors.deepPurple,
      cardColor: Colors.white,
      canvasColor: creamcolor,
      buttonColor: Colors.deepPurple,
      accentColor: darkBluishColor,
       appBarTheme: AppBarTheme(
       color: Colors.white,
       elevation: 0.0,
       iconTheme: IconThemeData(color: Colors.black),
       textTheme: Theme.of(context).textTheme
  )
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      primarySwatch:  Colors.deepPurple,
      cardColor: Colors.black,
      canvasColor: darkcreamcolor,
      buttonColor: lightBlueishcolor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(headline6: context.textTheme.headline6.copyWith(color: Colors.white))
      )
      );

  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkcreamcolor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBlueishcolor = Vx.indigo500;
}
