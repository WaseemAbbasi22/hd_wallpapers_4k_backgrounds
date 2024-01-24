import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/views/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Manrope',
            dividerColor: AppColors.kDividerColor),
        home: const SplashView(),
      );
    });
  }
}
