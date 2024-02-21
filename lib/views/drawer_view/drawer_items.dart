import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
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
                  .copyWith(fontWeight: FontWeight.w500,color:context.theme.appColors.outline),
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
                    context: context,
                    title: AppString.drawerItemList[index]['label'],
                    onTap: () {
                      onItemTap(index: index,context: context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onItemTap({required int index,required BuildContext context}){
    switch(index){
      case 0:
        Navigator.pushNamed(context, NamedRoute.mainView,arguments: {'tabIndex':0});
        case 1:
          Navigator.pushNamed(context, NamedRoute.mainView,arguments: {'tabIndex':1});
      case 2:
        Navigator.pushNamed(context, NamedRoute.favouriteView);
    }
  }
  Widget customTile(
      {required String iconPath,
      required String title,
        required BuildContext context,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 0),
        child: Row(
          children: [
            SvgPicture.asset(iconPath,
                height: 2.h,
                colorFilter:  ColorFilter.mode(
                    context.theme.appColors.tertiary, BlendMode.srcIn)),
            SizedBox(
              width: 3.w,
            ),
            Text(
              title,
              style: AppStyle.normalTextStyle.copyWith(color:context.theme.appColors.outline),
            )
          ],
        ),
      ),
    );
  }
}
