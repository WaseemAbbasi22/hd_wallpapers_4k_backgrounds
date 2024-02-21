import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppStyle{
  static TextStyle headingTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: AppColors.kWhiteColor,
  );
  static TextStyle normalTextStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 13.sp,
    fontFamily: 'Manrope',
    color: AppColors.kWhiteColor,
  );
  static TextStyle appBarTextStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 12.sp,
    color: AppColors.kWhiteColor,
  );

  static TextStyle appBarTitleTextStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 16.sp,
    color: AppColors.kWhiteColor,
  );
  static TextStyle buttonTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
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


  static  BoxDecoration backgroundGradientContainerDecoration =const BoxDecoration(
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
  static  BoxDecoration bottomSheetDecoration =const BoxDecoration(
    gradient:  LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.kBottomSheetStartColor,
        AppColors.kBottomSheetEndColor,
      ],
    ),
    color: AppColors.kPrimaryColor,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
  );
  static  BoxDecoration wallpaperActionContainerDecoration = BoxDecoration(
    color: AppColors.kBottomSheetStartColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.kBlackColor, width: 0.3.w)
  );
  static  BoxDecoration drawerChildDecoration = BoxDecoration(
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