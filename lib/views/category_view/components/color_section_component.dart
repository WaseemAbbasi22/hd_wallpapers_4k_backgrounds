import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorSectionComponent extends StatelessWidget {
  final double? radius;
  final List<Color> gradientColors;
  final VoidCallback? onTap;
  final String label;

  const ColorSectionComponent({
    super.key,
    required this.radius,
    required this.gradientColors,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: radius ?? 6.h,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            label,
            style: AppStyle.normalTextStyle.copyWith(color: AppColors.kWhiteColor),
          ),
        ],
      ),
    );
  }
}
