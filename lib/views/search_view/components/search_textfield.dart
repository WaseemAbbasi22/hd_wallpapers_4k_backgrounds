import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SearchTextField extends StatelessWidget {
  final Function(dynamic value) onChange;
  final TextEditingController? controller;
  final Color? fillColor;
  final String? hintText;
  final VoidCallback? onSearch;
  final bool showSuffix;
  final Widget? suffixChild;

  const SearchTextField({
    required this.onChange,
    this.controller,
    this.onSearch,
    this.fillColor,
    this.hintText,
    this.suffixChild,
    this.showSuffix = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: AppStyle.normalTextStyle,
        onChanged: onChange,
        decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          fillColor: fillColor ?? context.theme.appColors.onSecondary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          suffix: showSuffix
              ? suffixChild ??
                  GestureDetector(
                    onTap: onSearch,
                    child: SvgPicture.asset(
                      AppAssets.searchIcon,
                      height: 3.h,
                      color: context.theme.appColors.tertiary,
                    ),
                  )
              : null,
          hintStyle: AppStyle.normalTextStyle.copyWith(color: context.theme.appColors.outlineVariant.withOpacity(0.5)),
          hintText: hintText ?? 'Search',
        ));
  }
}
