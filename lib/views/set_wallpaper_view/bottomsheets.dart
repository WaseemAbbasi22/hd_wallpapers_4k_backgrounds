import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/wallpaper_model.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:awesome_wallpapers/utilities/general.dart';
import 'package:awesome_wallpapers/views/set_wallpaper_view/action_item.dart';
import 'package:awesome_wallpapers/views/set_wallpaper_view/set_wallpaper_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WallpaperControlsBottomSheet {
  static Future shareWallpaperBottomSheet(
    BuildContext context, {
    required WallpaperModel wallpaperModel,
  }) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (context) => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.theme.appColors.surface,
                    context.theme.appColors.onSurface,
                  ],
                ),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom, left: AppConstants.kHorizontalPadding, right: AppConstants.kHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: _buildHandle(context)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(AppString.share, style: AppStyle.headingTextStyle),
                    Divider(
                      height: 3.h,
                      color: context.theme.appColors.surfaceVariant,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        AppString.shareBottomSheetActionData.length,
                        (index) => ActionItems(
                          label: AppString.shareBottomSheetActionData[index]['label'],
                          iconPath: AppString.shareBottomSheetActionData[index]['icon'],
                          radius: 30,
                          iconHeight: 4.h,
                          onTap: () {
                            onShareActionTap(index: index, wallpaperModel: wallpaperModel);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            )).whenComplete(() async {});
  }

  static Future setWallpaperBottomSheet(BuildContext context, {required WallpaperModel wallpaperModel}) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (context) => Container(
              decoration: AppStyle.bottomSheetDecoration,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: AppConstants.kHorizontalPadding,
                  right: AppConstants.kHorizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: _buildHandle(context)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(AppString.setAs, style: AppStyle.headingTextStyle),
                    Divider(
                      height: 3.h,
                      color: AppColors.kDividerColor,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        AppString.setBottomSheetActionData.length,
                        (index) => SetWallpaperContainer(
                          label: AppString.setBottomSheetActionData[index]['label'],
                          iconPath: AppString.setBottomSheetActionData[index]['icon'],
                          iconHeight: 3.h,
                          onTap: () {
                            onSetWallpaperActionTap(index: index, wallpaperModel: wallpaperModel);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            )).whenComplete(() async {});
  }

  static void onShareActionTap({required int index, required WallpaperModel wallpaperModel}) {
    switch (index) {
      case 0:
    }
  }

  static void onSetWallpaperActionTap({required int index, required WallpaperModel wallpaperModel}) async {
    // FOR HOME_SCREEN = 1;
    // FOR LOCK_SCREEN = 2;
    // FOR BOTH_SCREENS = 3;
    switch (index) {
      case 0:
        await GeneralUtilities.setWallpaper(url: wallpaperModel.imageUrl, wallpaperLocation: 1); // FOR HOME_SCREEN = 1;
      case 1:
        await GeneralUtilities.setWallpaper(url: wallpaperModel.imageUrl, wallpaperLocation: 2); // FOR LOCK_SCREEN = 2;
      case 2:
        await GeneralUtilities.setWallpaper(url: wallpaperModel.imageUrl, wallpaperLocation: 3); // FOR BOTH_SCREENS = 3;
    }
  }

  static Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.15,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
