import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/models/wallpaper_model.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FavouriteGridComponent extends StatelessWidget {
  final List<String> wallpapers;
  final bool isForDownloads;

  const FavouriteGridComponent({super.key, required this.wallpapers, required this.isForDownloads});

  @override
  Widget build(BuildContext context) {
    // log("wallpapers: ${wallpapers.length}");
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
            childAspectRatio: 3 / 4,
          ),
          itemCount: wallpapers.length,
          itemBuilder: (BuildContext context, int index) {
            WallpaperModel wallpaperModel = WallpaperModel(imageUrl: wallpapers[index]);
            if (wallpapers.isEmpty) {
              return Text("There are no wallpapers in this category", style: AppStyle.normalTextStyle);
            }
            return WallPaperCard(
              index: index,
              borderColor: Colors.transparent,
              imageUrl: wallpaperModel.imageUrl,
              onCardTap: () {
                context.read<HomeVM>().updateCurrentImageHdUrl(wallpaperModel.imageUrl);
                Navigator.pushNamed(
                  context,
                  NamedRoute.setWallpaperView,
                  arguments: {
                    'wallpaperModel': WallpaperModel(
                      imageUrl: wallpaperModel.imageUrl.toString(),
                      thumbnailUrl: wallpaperModel.thumbnailUrl,
                    ),
                    'isFromFavOrDownload': true,
                  },
                );
              },
              child: Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    context.read<HomeVM>().removeFavoriteWallpaper(index: index, isForDownloads: isForDownloads);
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.kBlackColor.withOpacity(0.5),
                    radius: 2.h,
                    child: Center(
                      child: Icon(
                        Icons.delete_forever_outlined,
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
