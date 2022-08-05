import 'package:flutter/material.dart';
import 'package:weatergoo/product/colors.dart';
import 'package:weatergoo/product/icons.dart';
import 'package:weatergoo/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  void changeScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MainScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().black,
      body: Center(child: ProjectIcons().splashIcon),
    );
  }
}
