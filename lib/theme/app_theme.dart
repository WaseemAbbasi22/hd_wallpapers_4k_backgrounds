import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_colors_extention.dart';
import 'app_text_theme_extension.dart';
import 'app_typography.dart';

/// Simple Flutter app theme with `ChangeNotifier` and `ThemeExtension`.
/// With support for changing between light/dark mode.
///
/// You can also register it in `get_it` or any other package you use.
class AppTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  bool isDarkModeEnabled(BuildContext context) {
    return themeMode == ThemeMode.dark ||
        MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  bool _isLightMode = false;


  bool get isLightMode => _isLightMode;

  set isLightMode(bool value) {
    _isLightMode = value;
    notifyListeners();
  }

  static final light = () {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        // Default text style for Text widget.
        bodyMedium: AppTypography.body1.copyWith(color: Colors.black),
      ),
      extensions: [
        _lightAppColors,
        _lightTextTheme,
      ],
    );
  }();

  static final _lightAppColors = AppColorsExtension(
    background: AppColors.kWhiteColor,
    onBackground: AppColors.kWhiteColor,
    primary:  AppColors.kLightPrimaryColor,
    onPrimary:  AppColors.kLightPrimaryLightColor,
    primaryContainer:  AppColors.kLightPrimaryDarkColor,
    secondary: AppColors.kSecondaryColor,
    onSecondary: AppColors.kLightGreyColor,
    secondaryContainer:AppColors.kLightGreyColor,
    surface: AppColors.kLightGreyColor,
    onSurface: AppColors.kLightGreyColor,
    surfaceVariant: AppColors.kLightDividerColor,
    error: AppColors.kLightErrorColor ,
    onError: AppColors.kWhiteColor,
    tertiary: AppColors.kBlackColor,
    tertiaryContainer: AppColors.kLightIconColor,
    outline:AppColors.kBlackColor,
    outlineVariant:AppColors.kGreyColor,


  );

  static final _lightTextTheme = SimpleAppTextThemeExtension(
    body1: AppTypography.body1.copyWith(color: _lightAppColors.onBackground),
    h1: AppTypography.h1.copyWith(color: Colors.black),
  );

  //
  // Dark theme
  //

  static final dark = () {
    final defaultTheme = ThemeData.dark();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        // Default text style for Text widget.
        bodyMedium: AppTypography.body1.copyWith(color: Colors.white),
      ),
      extensions: [
        _darkAppColors,
        _darkTextTheme,
      ],
    );
  }();

  static final _darkAppColors = AppColorsExtension(
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
    error: AppColors.kErrorColor,
    onError:AppColors.kBlackColor,
    tertiary:AppColors.kWhiteColor,
    tertiaryContainer:AppColors.kBlackColor,
    outline:AppColors.kWhiteColor,
    outlineVariant:AppColors.kLightGreyColor,
  );

  static final _darkTextTheme = SimpleAppTextThemeExtension(
    body1: AppTypography.body1.copyWith(color: _darkAppColors.onBackground),
    h1: AppTypography.h1.copyWith(color: Colors.white),
  );
}

/// Here you should define getters for your `ThemeExtension`s.
///
/// Never use `Theme.of(context).extension<MyColors>()!`
/// how they do it in the [official documentation](https://api.flutter.dev/flutter/material/ThemeExtension-class.html),
/// because it's not safe. Always create a getter for your `ThemeExtension` and use it instead.
///
/// Usage example: `Theme.of(context).appColors`.
extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  SimpleAppTextThemeExtension get appTextTheme =>
      extension<SimpleAppTextThemeExtension>() ?? AppTheme._lightTextTheme;
}

/// A more convenient way to get `ThemeData` from the `BuildContext`.
///
/// Usage example: `context.theme`.
extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}