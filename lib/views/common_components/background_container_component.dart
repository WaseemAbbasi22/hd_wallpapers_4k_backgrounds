import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget? child;
  final double? horizontalPadding;
  final double? verticalPadding;

  const BackgroundContainer(
      {this.child,
      this.horizontalPadding,
      this.verticalPadding,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.homeContainerBg),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? AppConstants.kHorizontalPadding,
          vertical: verticalPadding ?? 5.h),
      child: child??const SizedBox(),
    );
  }
}
