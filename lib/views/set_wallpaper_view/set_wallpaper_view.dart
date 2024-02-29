import 'dart:async';
import 'dart:developer';

import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/wallpaper_model.dart';
import 'package:awesome_wallpapers/utilities/general.dart';
import 'package:awesome_wallpapers/views/common_components/back_button_component.dart';
import 'package:awesome_wallpapers/views/common_components/background_container_component.dart';
import 'package:awesome_wallpapers/views/common_components/user_intimation_components.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:awesome_wallpapers/views/set_wallpaper_view/action_item.dart';
import 'package:awesome_wallpapers/views/set_wallpaper_view/bottomsheets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SetWallpaperView extends StatefulWidget {
  final Map arguments;

  const SetWallpaperView({super.key, required this.arguments});

  @override
  State<SetWallpaperView> createState() => _SetWallpaperViewState();
}

class _SetWallpaperViewState extends State<SetWallpaperView> {
  late WallpaperModel wallpaperModel;

  @override
  void initState() {
    wallpaperModel = widget.arguments['wallpaperModel'];
    getWallpaperStatus();
    super.initState();
  }

  bool isFavorite = false;

  getWallpaperStatus() {
    scheduleMicrotask(() async {
      isFavorite = await context.read<HomeVM>().checkIfFavoriteWallpaper(imageUrl: wallpaperModel.imageUrl);
      setState(() {});
    });
  }

  //2a63850c88e20935ab73cde0ea3bdc527a70004a9b570537965bbd7e23c6160c

  String getIconForFavorite(int index) {
    if (index == 2) {
      if (isFavorite) {
        return AppAssets.favouriteIconRed;
      }
    }
    return AppString.wallpaperActionData[index]['icon'];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BackgroundContainer(
            verticalPadding: 2.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                const BackButtonComponent(),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: 100.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppConstants.sliderCardRadius),
                        child: CachedNetworkImage(
                          imageUrl: wallpaperModel.imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: SizedBox(
                              height: 3.h,
                              width: 6.w,
                              child: const CircularProgressIndicator(
                                color: AppColors.kWhiteColor,
                                strokeWidth: 1,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    AppString.wallpaperActionData.length,
                    (index) => ActionItems(
                      label: AppString.wallpaperActionData[index]['label'],
                      iconPath: getIconForFavorite(index),
                      onTap: () => onActionTap(index: index, wallpaperModel: wallpaperModel, isFavorite: isFavorite),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onActionTap({required int index, required WallpaperModel wallpaperModel, required bool isFavorite}) async {
    switch (index) {
      case 0:
        await GeneralUtilities.shareWallpaper(url: wallpaperModel.imageUrl);
      // WallpaperControlsBottomSheet.shareWallpaperBottomSheet(context, wallpaperModel: widget.arguments['wallpaperModel']);
      case 1:
        WallpaperControlsBottomSheet.setWallpaperBottomSheet(context, wallpaperModel: widget.arguments['wallpaperModel']);
      case 2:
        final homeVM = context.read<HomeVM>();
        if (isFavorite) {
          homeVM.removeFavoriteWallpaper(index: homeVM.getWallpaperListIndex(imageUrl: wallpaperModel.imageUrl), isForDownloads: false);
        } else {
          homeVM.addWallpaperToFavourites(wallpaperModel: wallpaperModel, isForDownloads: homeVM.isFromDownloads);
        }
        getWallpaperStatus();
      case 3:
        UserIntimationComponents.getLoader(context);
        bool status = await GeneralUtilities.downloadImageFromLink(url: wallpaperModel.imageUrl, context: context);
        if (status) {
          context.read<HomeVM>().addWallpaperToFavourites(wallpaperModel: wallpaperModel, isForDownloads: true);
        }
        Navigator.pop(context);
    }
  }
}
