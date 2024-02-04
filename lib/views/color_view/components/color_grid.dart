import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorGridComponent extends StatelessWidget {
  const ColorGridComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        padding: EdgeInsets.only(left: AppConstants.kHorizontalPadding),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 2,
            childAspectRatio: 3/4,
          ),
          itemCount: AppString.categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            CategoryModel category = AppString.categoryList[index];
            return WallPaperCard(
              index: index,
              borderColor: Colors.transparent,
              imageUrl: category.imageUrl,
              onCardTap: () {
                Navigator.pushNamed(context, NamedRoute.setWallpaperView,arguments:
                {'categoryModel': category});

              },
              child: Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: AppColors.kBlackColor.withOpacity(0.5),
                    radius: 2.h,
                    child: Center(
                      child: Icon(
                        Icons.favorite_outline,
                        size: 2.3.h,
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
