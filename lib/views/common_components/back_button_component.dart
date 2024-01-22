import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:flutter/material.dart';

class BackButtonComponent extends StatelessWidget {
  final double ?radius;
  final VoidCallback ?onPressed;
  const BackButtonComponent({this.onPressed,this.radius,super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius??25,
      backgroundColor: AppColors.kGreyColor,
      child: IconButton(
        onPressed:onPressed?? () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.kWhiteColor,
        ),
      ),
    );
  }
}
