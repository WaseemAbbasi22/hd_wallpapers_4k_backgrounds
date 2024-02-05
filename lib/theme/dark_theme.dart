import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkThem = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: AppColors.kBlackColor,
    onBackground: AppColors.kWhiteColor,
    primary:  AppColors.kPrimaryColor,
    onPrimary:  AppColors.kPrimaryLightColor,
    primaryContainer:  AppColors.kPrimaryDarkColor,
    secondary: AppColors.kSecondaryColor,
    onSecondary: AppColors.kBlackLightColor,
    secondaryContainer:AppColors.kGreyColor,
    surface: AppColors.kBottomSheetStartColor,
    onSurface: AppColors.kBottomSheetEndColor,
    surfaceVariant: AppColors.kDividerColor,
  ),

);