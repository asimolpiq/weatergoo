import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatergoo/screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SplashScreen(),
      theme: _customTheme(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _customTheme() {
    return ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark),
    );
  }
}
