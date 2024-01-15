import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppStyle{
  static TextStyle headingTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 30.sp,
    color: AppColors.kBlackColor,
  );
  static TextStyle normalTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: AppColors.kBlackLightColor,
  );
  static TextStyle appBarTextStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 11.sp,
    color: AppColors.kWhiteColor,
  );

  static TextStyle appBarTitleTextStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 40.sp,
    color: AppColors.kWhiteColor,
  );

  static TextStyle shadowTextStyle = TextStyle(
    fontSize: 15.sp,
    color: AppColors.kWhiteColor,
    fontWeight: FontWeight.bold,
    shadows: const [
      Shadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(4, 7),
      ),
    ],
  );

  static const BoxDecoration backgroundGradientContainerDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF29234f),
        Color(0xFF060507),
      ],
    ),
  );
}