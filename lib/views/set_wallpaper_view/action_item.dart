import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ActionItems extends StatelessWidget {
  final String iconPath;
  final String label;
  final double ?radius;
  final double ?iconHeight;
  final VoidCallback onTap;

  const ActionItems(
      {required this.label, required this.iconPath, required this.onTap,this.radius,this.iconHeight,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius:radius?? 25,
            backgroundColor: AppColors.kGreyColor,
            child: SvgPicture.asset(
              iconPath,
              // color: AppColors.kWhiteColor,
              height: iconHeight??2.8.h,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            label,
            style: AppStyle.normalTextStyle,
          )
        ],
      ),
    );
  }
}
