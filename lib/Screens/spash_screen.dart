import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samsung_note/app_style.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation animation;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),()=>Get.off(()=>const HomeScreen()));

    _controller = AnimationController(duration: const Duration(milliseconds: 400),vsync: this);
    animation = ColorTween(begin: Colors.deepOrange , end: Colors.white).animate(_controller);
    _controller.forward();
    _controller.addListener(() {setState(() {});});

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Stack(children: [
        Center(
          child: Image.asset('images/logo.png', width: 100),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Text(
              "Samsung Notes",
              style: AppStyle.largeTextStyle
            ),
          ),
        )
      ]),
    );
  }
}
