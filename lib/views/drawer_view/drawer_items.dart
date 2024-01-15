import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class DrawerWidgetItems extends StatelessWidget {
  const DrawerWidgetItems({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Text(
              AppString.appName2,
              style: AppStyle.appBarTitleTextStyle,
            ),
            SizedBox(
              height: 2.h,
            ),
            customTile(iconPath: AppAssets.homeIcon,title: 'Home',onTap: (){}),
            customTile(iconPath: AppAssets.homeIcon,title: 'Home',onTap: (){}),
            customTile(iconPath: AppAssets.homeIcon,title: 'Home',onTap: (){}),
            customTile(iconPath: AppAssets.homeIcon,title: 'Home',onTap: (){}),
            customTile(iconPath: AppAssets.homeIcon,title: 'Home',onTap: (){}),
          ],
        ),
      ),
    );
  }

  Widget customTile({required String iconPath, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
        child: Row(
          children: [
            SvgPicture.asset(iconPath,colorFilter: const ColorFilter.mode(AppColors.kWhiteColor, BlendMode.srcIn)),
            SizedBox(
              width: 5.w,
            ),
            Text(
              title,
              style:AppStyle.appBarTextStyle,
            )
          ],
        ),
      ),
    );
  }
}