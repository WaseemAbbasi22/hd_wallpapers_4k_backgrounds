import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/views/common_components/background_container_component.dart';
import 'package:awesome_wallpapers/views/favourite_view/components/favourite_appbar.dart';
import 'package:awesome_wallpapers/views/favourite_view/favourite_grid.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SingleChildScrollView(
        child: BackgroundContainer(
          horizontalPadding: 1.w,
          verticalPadding: 0,
          child: Column(
            children: [
              SizedBox(height: 3.h),
             const  FavouriteAppBar(),
              SizedBox(height: 3.h),
             const  FavouriteGridComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
