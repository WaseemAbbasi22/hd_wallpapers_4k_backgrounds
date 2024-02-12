import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/models/wallpaper_model.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DetailSliverGrid extends StatelessWidget {
  final List<WallpaperModel> wallpaperList;

  const DetailSliverGrid({required this.wallpaperList, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          WallpaperModel wallpaperModel = wallpaperList[index];
          return WallPaperCard(
            index: index,
            borderColor: Colors.transparent,
            imageUrl: wallpaperModel.imageUrl,
            onLoadFailed: () {
              wallpaperList.removeAt(index);
            },
            onCardTap: () {
              HomeVM homeVM = context.read<HomeVM>();
              homeVM.getHdImageUrlForFeedAndNavigate(context: context, thumbnailKey: wallpaperModel.imageKey);
              // Navigator.pushNamed(context, NamedRoute.setWallpaperView, arguments: {'categoryModel': category});
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
        childCount: wallpaperList.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 3,
        crossAxisSpacing: 2,
        childAspectRatio: 3 / 4,
        // crossAxisCount: 2,
        // mainAxisSpacing: 3,
        // crossAxisSpacing: 2,
        // childAspectRatio: 3/3,
      ),
    );
  }
}
