import 'package:flutter/material.dart';
import 'package:flutter_catalogapp/pages/cart_page.dart';
import 'package:flutter_catalogapp/pages/home_page.dart';
import 'package:flutter_catalogapp/pages/login_pages.dart';
import 'package:flutter_catalogapp/utils/routes.dart';
import 'package:flutter_catalogapp/widgets/MyTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/",
      routes: {
        "/" : (context) => LoginPage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.CartRoute: (context) => CartPage(),
      },
    );

  }
}
