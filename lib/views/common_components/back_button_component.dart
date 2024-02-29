import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BackButtonComponent extends StatelessWidget {
  final double ?radius;
  final VoidCallback ?onPressed;
  const BackButtonComponent({this.onPressed,this.radius,super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius??20,
      backgroundColor: context.theme.appColors.onSecondary,
      child: IconButton(
        onPressed:onPressed?? () {
          Navigator.pop(context);
        },
        icon:  Icon(
          Icons.arrow_back,
          color: context.theme.appColors.tertiary,
        ),
      ),
    );
  }
}
