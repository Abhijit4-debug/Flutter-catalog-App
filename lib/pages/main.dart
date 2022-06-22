import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/pages/cart_page.dart';
import 'package:flutter_complete_guide/utils/routes.dart';
import 'package:flutter_complete_guide/widgets/themes.dart';
import 'home_page.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
        themeMode: ThemeMode.light,
        theme: MyTheme.LightTheme(context),
        darkTheme: MyTheme.DarkTheme(context),
          
        initialRoute: Myroutes.home,
        routes: {
          Myroutes.home: (Context) => homepage(),
          Myroutes.login:(context) => LoginPage(),
          Myroutes.cart:(context) => cartpage(),
        },
      );
  }
}
