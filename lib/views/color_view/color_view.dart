import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/views/color_view/components/background_gradient_container.dart';
import 'package:awesome_wallpapers/views/color_view/components/color_appBar.dart';
import 'package:awesome_wallpapers/views/color_view/components/color_grid.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorView extends StatelessWidget {
  final Map arguments;

  const ColorView({required this.arguments, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SingleChildScrollView(
        child: BackgroundGradientContainer(
          horizontalPadding: 1.w,
          startColor:arguments['colorModel']['colors'][0],
          endColor: arguments['colorModel']['colors'][1],
          verticalPadding: 1.h,
          child: Column(
            children: [
              SizedBox(height: 3.h),
               ColorAppBar(title: arguments['colorModel']['label']),
              SizedBox(height: 2.h),
               const ColorGridComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
