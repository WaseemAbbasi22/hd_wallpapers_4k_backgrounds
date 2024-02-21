import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget? child;
  final double? horizontalPadding;
  final double? verticalPadding;

  const BackgroundContainer(
      {this.child, this.horizontalPadding, this.verticalPadding, super.key});

  @override
  Widget build(BuildContext context) {
    // return CustomPaint(
    //   size: Size(100.h, 100.h), // Adjust the size according to your needs
    //   painter: MashGradientPainter(),
    //   child:
    //   Padding(padding: EdgeInsets.symmetric(
    //       horizontal: horizontalPadding ?? AppConstants.kHorizontalPadding,
    //       vertical: verticalPadding ?? 5.h),
    //       child: child??const SizedBox(),
    //   ) ,
    // );
    print('selected theme i got is ${context.watch<AppTheme>().themeMode}');
    return Container(
      width: 100.w,
      height: 100.h,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topRight,
      //     end: Alignment.bottomLeft,
      //     stops: [0.5,1],
      //     colors: [Colors.red, Colors.yellow,],
      //   ),
      // ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              context.watch<AppTheme>().isDarkModeEnabled(context)
                  ?
              AppAssets.homeContainerBg
                  : AppAssets.whiteContainerBg
          ),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? AppConstants.kHorizontalPadding,
          vertical: verticalPadding ?? 5.h),
      child: child ?? const SizedBox(),
    );
  }
}

class MashGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    // Top-right corner color
    final Color color1 = Colors.blue;

    // Bottom-left corner color
    final Color color2 = Colors.green;

    // Diagonal path
    final Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();

    // Clip the canvas with the diagonal path
    canvas.clipPath(path);

    // Fill each side with a different color
    canvas.drawRect(
        Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)),
        paint..color = color1);
    canvas.drawRect(
        Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)),
        paint..color = color2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
