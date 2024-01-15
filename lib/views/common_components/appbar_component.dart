import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/extentions/string_extentions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppBarComponent extends StatelessWidget {

  const AppBarComponent(
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Text(
        AppString.appName2.toCapitalized(),
        style: AppStyle.appBarTextStyle,
      ),

    );
  }
}
