import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:awesome_wallpapers/views/setWallpaper_view/setWallpaper_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailSliverGrid extends StatelessWidget {
  final List<CategoryModel> categoryList;

  const DetailSliverGrid({required this.categoryList, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          CategoryModel category = categoryList[index];
          return WallPaperCard(
            index: index,
            borderColor: Colors.transparent,
            imageUrl: category.imageUrl,
            onCardTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SetWallpaperView(category: category)),
              );
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
                      Icons.favorite_border,
                      size: 2.3.h,
                      color: AppColors.kWhiteColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        childCount: categoryList.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 3,
        crossAxisSpacing: 2,
        childAspectRatio: 3/3,
      ),
    );
  }
}
