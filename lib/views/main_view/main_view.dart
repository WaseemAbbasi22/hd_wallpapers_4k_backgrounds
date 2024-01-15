import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/views/common_components/appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: const AppBarComponent(
          ),
        ),
      ),
      body: Container(
       decoration: AppStyle.backgroundGradientContainerDecoration,
      ),
    );
  }
}
