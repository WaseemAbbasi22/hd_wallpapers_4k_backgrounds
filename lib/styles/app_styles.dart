import 'package:awesome_wallpapers/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppStyle {
  static TextStyle headingTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: AppColors.kBlackColor,
  );
  static TextStyle normalTextStyle = TextStyle(
    fontWeight: FontWeight.normal,
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
    fontSize: 16.sp,
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
  static TextStyle tabsSelectedTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle tabsUnSelectedTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
  );

  static BoxDecoration backgroundGradientContainerDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF29234f),
        Color(0xFF060507),
      ],
    ),
    color: AppColors.kPrimaryColor,
  );
  static BoxDecoration drawerChildDecoration = BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF29234f),
          Color(0xFF060507),
        ],
      ),
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: AppColors.kBlackLightColor, width: 5.w));
}
