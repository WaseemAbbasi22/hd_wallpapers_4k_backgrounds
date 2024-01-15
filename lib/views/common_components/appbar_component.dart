import 'package:awesome_wallpapers/app_constants.dart';
import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
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
      backgroundColor: Colors.orange,
      elevation: 0,
      centerTitle: false,
      title: Text(
        AppConstants.appName.toCapitalized(),
        style: AppStyle.appBarTextStyle,
      ),

    );
  }
}
