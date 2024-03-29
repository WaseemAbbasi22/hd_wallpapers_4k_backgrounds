import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/extensions/extensions.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:awesome_wallpapers/views/common_components/back_button_component.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SliverHeader extends StatelessWidget {
  final CategoryModel category;
  final String coverImageUrl;
  final double scrollPosition;

  const SliverHeader({required this.category, required this.scrollPosition, this.coverImageUrl = "", super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: context.theme.appColors.primary,
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
                icon: Icon(
                  Icons.arrow_back,
                  color: context.theme.appColors.outline,
                ),
              )
            : const BackButtonComponent(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: scrollPosition >= 28.h
            ? Container(
              width: double.infinity,
              padding: EdgeInsets.only(right: 18.w),
              height: 3.h,
              child: Text(
                  category.name.toUpperCase() ?? '',
                  textAlign: TextAlign.center,
                  style: AppStyle.headingTextStyle.copyWith(color: context.theme.appColors.tertiary),
                ),
            )
            : null,
        background: WallPaperCard(
            index: 0,
            imageUrl: coverImageUrl != "" ? coverImageUrl : category.imageUrl,
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
              ).toBackDropTextContainer(hideRadius: true),
            )),
      ),
    );
  }
}
