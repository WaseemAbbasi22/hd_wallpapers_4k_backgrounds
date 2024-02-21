import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SetWallpaperContainer extends StatelessWidget {
  final String iconPath;
  final String label;
  final double? iconHeight;
  final VoidCallback onTap;

  const SetWallpaperContainer(
      {required this.label,
      required this.iconPath,
      required this.onTap,
      this.iconHeight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          decoration: BoxDecoration(
              color: context.theme.appColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: context.theme.appColors.tertiaryContainer, width: 0.3.w)
          ),
          padding: const EdgeInsets.all(20),
          width: 100.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                iconPath,
                // color: AppColors.kWhiteColor,
                height: iconHeight??2.8.h,
                colorFilter: ColorFilter.mode(context.theme.appColors.outline, BlendMode.srcIn),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                label,
                style: AppStyle.normalTextStyle.copyWith(color:context.theme.appColors.outline),
              )
            ],
          ),
        ),
      ),
    );
  }

// Padding(
//     padding: const EdgeInsets.symmetric(
//         horizontal: 12.0, vertical: 5.0),
//     child: Container(
//       color: AppColors.kWhiteColor,
//       padding: const EdgeInsets.all(20),
//       width: 100.w,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SvgPicture.asset(
//             iconPath,
//             // color: AppColors.kWhiteColor,
//             height: iconHeight??2.8.h,
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
// Text(
//             label,
//             style: AppStyle.normalTextStyle,
//           )
//         ],
//       ),
//     ),
//   );
}
