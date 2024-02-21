
import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String leadingText;
  final String? trailingText;
  final bool? showTrailing;
  final VoidCallback? onTrailingTap;

  const SectionHeader(
      {required this.leadingText,
      this.trailingText,
      this.onTrailingTap,
      this.showTrailing = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppConstants.kHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leadingText,
            style: AppStyle.headingTextStyle.copyWith(color: context.theme.appColors.outline),
          ),
          showTrailing!
              ? InkWell(
                  onTap: onTrailingTap,
                  child: Text(
                    trailingText??'',
                    style: AppStyle.normalTextStyle.copyWith(color: context.theme.appColors.outlineVariant),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
