import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../app_style/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final Function(dynamic value) onChange;
  final TextEditingController? controller;
  final Color?fillColor;
  final String ?hintText;
  final VoidCallback ?onSearch;
  bool showSuffix = true;
  final Widget? suffixChild;

  SearchTextField(
      {required this.onChange, this.controller, this.onSearch, this.fillColor, this.hintText, this.suffixChild, this.showSuffix = true, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: AppStyle.normalTextStyle,
        decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: 10),
          fillColor: fillColor ?? AppColors.kGreyColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          suffix: showSuffix
              ? suffixChild ?? GestureDetector(
            onTap:onSearch,
            child: const Icon(Icons.search,
              color: AppColors.kWhiteColor,
            ),
          )
              : null,
          hintStyle: AppStyle.normalTextStyle,
          hintText: hintText ?? 'search',
        ));
  }
}