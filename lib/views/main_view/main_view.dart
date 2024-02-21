import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:awesome_wallpapers/views/category_view/category_view.dart';
import 'package:awesome_wallpapers/views/drawer_view/drawer_items.dart';
import 'package:awesome_wallpapers/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:sizer/sizer.dart';

class MainView extends StatefulWidget {
  final Map arguments;

  const MainView({required this.arguments, super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _advancedDrawerController = AdvancedDrawerController();
  late final ValueNotifier<int> _tabIndex;

  @override
  void initState() {
    // TODO: implement initState
    _tabIndex = ValueNotifier(widget.arguments['tabIndex'] ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: context.theme.appColors.primary,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      openRatio: 0.5,
      openScale: 0.7,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.theme.appColors.onSecondary,
              context.theme.appColors.onSecondary,
            ],
          ),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: context.theme.appColors.onSecondary, width: 5.w)),
      drawer: const DrawerWidgetItems(),
      child: drawerWidget(),
    );
  }

  Widget drawerWidget() => ValueListenableBuilder<AdvancedDrawerValue>(
        valueListenable: _advancedDrawerController,
        builder: (_, value, __) {
          return Container(
            key: ValueKey<bool>(value.visible),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.theme.appColors.primary,
                  context.theme.appColors.primary,
                ],
              ),
              color: AppColors.kPrimaryColor,
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
                toggleTabs(),
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

  Widget toggleTabs() => ValueListenableBuilder(
    valueListenable: _tabIndex,
    builder: (context, currentIndex, _) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppConstants.kHorizontalPadding),
        child: FlutterToggleTab(
          // width in percent
          width: 23.2.w,
          borderRadius: 30,
          height: 8.h,
          selectedIndex: currentIndex,
          selectedBackgroundColors: [
            context.theme.appColors.primaryContainer,
          ],
          unSelectedBackgroundColors: [
            context.theme.appColors.onSecondary,
          ],
          selectedTextStyle: AppStyle.tabsSelectedTextStyle,
          unSelectedTextStyle: AppStyle.tabsUnSelectedTextStyle
              .copyWith(color: context.theme.appColors.tertiary),
          labels: AppString.tabsTextList,
          icons: AppString.tabsIconList,
          selectedLabelIndex: (index) {
            _tabIndex.value = index;
          },
          isScroll: false,
        ),
      );
    },
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
                        color: context.theme.appColors.tertiary,
                        size: 3.h,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              Text(AppString.appName2,
                  style: AppStyle.appBarTitleTextStyle
                      .copyWith(color: context.theme.appColors.outline)),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 3.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, NamedRoute.searchView);
              },
              child: SvgPicture.asset(
                AppAssets.searchIcon,
                height: 3.h,
                color: context.theme.appColors.tertiary,
              ),
            ),
          ),
        ],
      );
}
