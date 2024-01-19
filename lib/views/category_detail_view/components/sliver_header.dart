import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SliverHeader extends StatelessWidget {
  final CategoryModel category;

  const SliverHeader({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.kPrimaryColor,
      expandedHeight: 35.h,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(15),
        child: Container(
          height: 2.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppConstants.sliderCardRadius),
              topLeft: Radius.circular(AppConstants.sliderCardRadius),
            ),
            color: AppColors.kWhiteColor,
          ),
        ),
      ),
      // expandedHeight: 200,
      pinned: true,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.kWhiteColor,
        ),
      ),

      flexibleSpace: FlexibleSpaceBar(
        background: WallPaperCard(
          index: 0,
          imageUrl: category.imageUrl,
          width: 100.w,
           child: Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child:  Center(
                child: Text(
                  category.name??'',
                  style: AppStyle.normalTextStyle.copyWith(color: AppColors.kWhiteColor),
                ),
              ),
            )
        ),
      ),
    );
  }
}
