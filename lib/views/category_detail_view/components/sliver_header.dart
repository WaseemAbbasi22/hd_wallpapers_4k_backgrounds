import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/extensions/extensions.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/views/common_components/back_button_component.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SliverHeader extends StatelessWidget {
  final CategoryModel category;
  final double scrollPosition;

  const SliverHeader({required this.category, required this.scrollPosition, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.kPrimaryColor,
      expandedHeight: 35.h,
      pinned: true,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: scrollPosition > 226
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.kWhiteColor,
                ),
              )
            : const BackButtonComponent(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: scrollPosition >= 28.h
            ? Text(
                category.name.toUpperCase() ?? '',
                style: AppStyle.headingTextStyle.copyWith(color: AppColors.kWhiteColor),
              )
            : null,
        background: WallPaperCard(
            index: 0,
            imageUrl: category.imageUrl,
            hasTopRadiusOnly: true,
            width: 100.w,
            borderWidth: 0,
            child: Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Text(
                category.name.toUpperCase() ?? '',
                style: AppStyle.headingTextStyle.copyWith(color: AppColors.kWhiteColor, fontSize: 22.sp),
              ).toBackDropTextContainer(),
            )),
      ),
    );
  }
}
