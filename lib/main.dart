import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:samsung_note/Screens/spash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 808),
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Samsung Notes',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.grey.shade200,
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.grey.shade200,
                    iconTheme:
                        IconThemeData(size: 25.r, color: Colors.grey.shade700),
                    foregroundColor: Colors.grey.shade800),
                primarySwatch: Colors.deepOrange,
              ),
              home: child,
            ),
      child: const SplashScreen(),
    );
  }
}
