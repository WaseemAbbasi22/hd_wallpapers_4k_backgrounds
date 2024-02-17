import 'dart:async';
import 'dart:developer';

import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/views/color_view/components/background_gradient_container.dart';
import 'package:awesome_wallpapers/views/color_view/components/color_appBar.dart';
import 'package:awesome_wallpapers/views/color_view/components/color_grid.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ColorView extends StatefulWidget {
  final Map arguments;

  const ColorView({required this.arguments, super.key});

  @override
  State<ColorView> createState() => _ColorViewState();
}

class _ColorViewState extends State<ColorView> {
  @override
  void initState() {
    onLoaded();
    super.initState();
  }

  String getCategoryKeyFormatted() {
    String colorName = widget.arguments["colorModel"]["label"];
    return (widget.arguments["mainCategory"]) + (colorName.toLowerCase()) + ('/');
  }

  onLoaded() async {
    scheduleMicrotask(() {
      log("getCategoryKeyFormatted: ${getCategoryKeyFormatted()}");
      context.read<HomeVM>().getWallpapersListByCategory(getCategoryKeyFormatted());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SingleChildScrollView(
        child: BackgroundGradientContainer(
          horizontalPadding: 1.w,
          startColor: widget.arguments['colorModel']['colors'][0],
          endColor: Colors.black,
          verticalPadding: 1.h,
          child: Column(
            children: [
              SizedBox(height: 3.h),
              ColorAppBar(title: widget.arguments['colorModel']['label']),
              SizedBox(height: 2.h),
              Consumer(builder: (BuildContext context, HomeVM homeVM, Widget? child) {
                return ColorGridComponent(wallpaperList: homeVM.wallpapersListByCategory);
              })
            ],
          ),
        ),
      ),
    );
  }
}
