import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class DrawerWidgetItems extends StatelessWidget {
  const DrawerWidgetItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Text(
              AppString.appName2,
              style: AppStyle.normalTextStyle
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                AppString.drawerItemList.length,
                (index) => customTile(
                    iconPath: AppString.drawerItemList[index]['icon'],
                    title: AppString.drawerItemList[index]['label'],
                    onTap: () {

                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTile(
      {required String iconPath,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 0),
        child: Row(
          children: [
            SvgPicture.asset(iconPath,
                height: 2.h,
                colorFilter: const ColorFilter.mode(

                    AppColors.kWhiteColor, BlendMode.srcIn)),
            SizedBox(
              width: 3.w,
            ),
            Text(
              title,
              style: AppStyle.normalTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
