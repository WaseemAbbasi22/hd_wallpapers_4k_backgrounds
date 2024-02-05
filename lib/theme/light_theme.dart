import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.dark(
    background: AppColors.kWhiteColor,
    onBackground: AppColors.kWhiteColor,
    primary:  AppColors.kLightPrimaryColor,
    onPrimary:  AppColors.kLightPrimaryLightColor,
    primaryContainer:  AppColors.kLightPrimaryDarkColor,
    secondary: AppColors.kSecondaryColor,
    onSecondary: AppColors.kBlackLightColor,
    onSecondaryContainer:AppColors.kLightGreyColor,
    surface: AppColors.kLightGreyColor,
    onSurface: AppColors.kLightGreyColor,
    surfaceVariant: AppColors.kLightDividerColor,
  ),

);