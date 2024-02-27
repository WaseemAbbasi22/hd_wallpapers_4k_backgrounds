import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final VoidCallback onTap;
  final String label;
  final Widget? iconWidget;
  bool? hasIcon = false;

  CustomButton(
      {required this.label, required this.onTap, this.height, this.width, this.borderRadius, this.iconWidget, super.key, this.hasIcon = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 50.w,
        height: height ?? 9.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius ?? 25), color: context.theme.appColors.primaryContainer),
        child: hasIcon!
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: AppStyle.buttonTextStyle,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  iconWidget ?? const SizedBox(),
                ],
              )
            : Center(
                child: Text(
                label,
                style: AppStyle.buttonTextStyle,
              )),
      ),
    );
  }
}
