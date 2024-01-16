import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/views/category_view/category_view.dart';
import 'package:awesome_wallpapers/views/common_components/appbar_component.dart';
import 'package:awesome_wallpapers/views/drawer_view/drawer_items.dart';
import 'package:awesome_wallpapers/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:sizer/sizer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _advancedDrawerController = AdvancedDrawerController();
  final ValueNotifier<int> _tabIndex = ValueNotifier(0);

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
      disabledGestures: true,
      childDecoration: AppStyle.drawerChildDecoration,
      drawer: const DrawerWidgetItems(),
      child: drawerWidget(),
    );
  }

  Widget drawerWidget() => ValueListenableBuilder<AdvancedDrawerValue>(
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
                SizedBox(
                  height: 4.h,
                ),
                Expanded(
                  flex: 1,
                  child: appBarWidget(),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Expanded(flex: 1, child: toggleTabs()),
                Expanded(
                    flex: 9,
                    child: ValueListenableBuilder(
                      valueListenable: _tabIndex,
                      builder: (context, currentIndex, _) {
                        ///select the page here....
                        return currentIndex == 0
                            ? const HomeView()
                            : const CategoryView();
                      },
                    )),
              ],
            ),
          );
        },
      );

  Widget toggleTabs() => Column(
        children: [
          /// Basic Toggle Sample
          ValueListenableBuilder(
            valueListenable: _tabIndex,
            builder: (context, currentIndex, _) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.kHorizontalPadding),
                child: FlutterToggleTab(
                  // width in percent
                  width: 24.w,
                  borderRadius: 30,
                  height: 7.h,
                  selectedIndex: currentIndex,
                  selectedBackgroundColors: const [
                    AppColors.kPrimaryDarkColor,
                  ],
                  unSelectedBackgroundColors: const [
                    AppColors.kBlackLightColor,
                  ],
                  selectedTextStyle: AppStyle.tabsSelectedTextStyle,
                  unSelectedTextStyle: AppStyle.tabsUnSelectedTextStyle,
                  labels: AppString.tabsTextList,
                  icons: AppString.tabsIconList,
                  selectedLabelIndex: (index) {
                    _tabIndex.value = index;
                  },
                  isScroll: false,
                ),
              );
            },
          ),
        ],
      );

  Widget appBarWidget() => Row(
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
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        color: AppColors.kWhiteColor,
                        size: 3.h,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              Text(AppString.appName2, style: AppStyle.appBarTitleTextStyle),
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
      );
}
