
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/utilities/general.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
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
              AppString.appName,
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
                    isThemeMode: index==4?true:false,
                    title: AppString.drawerItemList[index]['label'],
                    onTap: () {
                      onItemTap(index: index, context: context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onItemTap({required int index, required BuildContext context}) async {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, NamedRoute.mainView, arguments: {'tabIndex': 0});
        break;

      case 1:
        Navigator.pushNamed(context, NamedRoute.mainView, arguments: {'tabIndex': 1});
        break;
      case 2:
        context.read<HomeVM>().updateIsFromDownloads(false);
        Navigator.pushNamed(context, NamedRoute.favouriteView, arguments: {'isDownloads': false});
        break;
      case 3:
        context.read<HomeVM>().updateIsFromDownloads(true);
        Navigator.pushNamed(context, NamedRoute.favouriteView, arguments: {'isDownloads': true}); // DOWNLOADS
        break;
      case 4:
      //change theme..

        break;
      case 5:
      // RATE THIS APP
        break;
      case 6:
        await GeneralUtilities.shareMyApp();
        break;
    }
  }
  Widget customTile(
      {required String iconPath,
        required String title,
        required BuildContext context,
        bool?isThemeMode=false,
        required VoidCallback onTap}) {
    return Consumer<AppTheme>(
        builder: (context,appTheme, child) {
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
                  isThemeMode!?
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppStyle.normalTextStyle.copyWith(color:context.theme.appColors.outline),
                      ),
                      CupertinoSwitch(
                        value: appTheme.isLightMode,
                        onChanged: (value) {
                          print('value i got is $value');
                          appTheme.isLightMode = value;
                          if(appTheme.isLightMode){
                            context.read<AppTheme>().themeMode = ThemeMode.light;
                          }else{
                            context.read<AppTheme>().themeMode = ThemeMode.dark;
                          }
                          print('theme mode i got is ${context.read<AppTheme>().themeMode}');

                        },
                        activeColor: context.theme.appColors.outline,
                      ),
                    ],
                  ):
                  Text(
                    title,
                    style: AppStyle.normalTextStyle.copyWith(color:context.theme.appColors.outline),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

}
