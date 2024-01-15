import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/views/common_components/appbar_component.dart';
import 'package:awesome_wallpapers/views/drawer_view/drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:sizer/sizer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: AppColors.kPrimaryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      openRatio: 0.5,
      openScale: 0.7,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF29234f),
              Color(0xFF060507),
            ],
          ),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.kBlackLightColor, width: 5.w)),
      drawer: const DrawerWidgetItems(),
      child: ValueListenableBuilder<AdvancedDrawerValue>(
        valueListenable: _advancedDrawerController,
        builder: (_, value, __) {
          return Container(
            key: ValueKey<bool>(value.visible),
            decoration: AppStyle.backgroundGradientContainerDecoration.copyWith(
              borderRadius: BorderRadius.circular(
                  _advancedDrawerController.value.visible ? 50 : 0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                _advancedDrawerController.showDrawer();
                              },
                              icon:
                                  ValueListenableBuilder<AdvancedDrawerValue>(
                                valueListenable: _advancedDrawerController,
                                builder: (_, value, __) {
                                  return AnimatedSwitcher(
                                    duration:
                                        const Duration(milliseconds: 250),
                                    child: Icon(
                                      value.visible
                                          ? Icons.clear
                                          : Icons.menu,
                                      color: AppColors.kWhiteColor,
                                      size: 3.h,
                                      key: ValueKey<bool>(value.visible),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(AppString.appName2,
                                style: AppStyle.appBarTitleTextStyle),
                          ],
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.search,
                            size: 3.h,
                            color: AppColors.kWhiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 9, child: Container()),
              ],
            ),
          );
        },
      ),
    );
    // return  Scaffold(
    //   appBar: const PreferredSize(
    //     preferredSize:  Size.fromHeight(80),
    //     child:  AppBarComponent(
    //     ),
    //   ),
    //   body: Container(
    //    decoration: AppStyle.backgroundGradientContainerDecoration,
    //   ),
    // );
  }
}
