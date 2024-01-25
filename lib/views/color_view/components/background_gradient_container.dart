import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class BackgroundGradientContainer extends StatelessWidget {
  final Widget? child;
  final double? horizontalPadding;
  final Color startColor;
  final Color  endColor;
  final double? verticalPadding;

  const BackgroundGradientContainer(
      {this.child,
        this.horizontalPadding,
        this.verticalPadding,
       required  this.startColor,
        required this.endColor,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
           startColor,
            endColor,
          ],
        ),
        color: AppColors.kPrimaryColor,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? AppConstants.kHorizontalPadding,
          vertical: verticalPadding ?? 5.h),
      child: child??const SizedBox(),
    );
  }
}
