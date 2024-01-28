import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/views/common_components/back_button_component.dart';
import 'package:awesome_wallpapers/views/common_components/background_container_component.dart';
import 'package:awesome_wallpapers/views/setWallpaper_view/bottomsheets.dart';
import 'package:awesome_wallpapers/views/setWallpaper_view/action_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SetWallpaperView extends StatefulWidget {
  final Map arguments;
  const SetWallpaperView({super.key, required this.arguments});

  @override
  State<SetWallpaperView> createState() => _SetWallpaperViewState();
}

class _SetWallpaperViewState extends State<SetWallpaperView> {
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
                SizedBox(
                  height: 2.h,
                ),
                const BackButtonComponent(),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: 100.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            AppConstants.sliderCardRadius),
                        child: CachedNetworkImage(
                          imageUrl: widget.arguments['categoryModel'].imageUrl ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: SizedBox(
                              height: 3.h,
                              width: 6.w,
                              child: const CircularProgressIndicator(
                                color: AppColors.kPrimaryColor,
                                strokeWidth: 1,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
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
                      iconPath: AppString.wallpaperActionData[index]['icon'],
                      onTap: () {
                        onActionTap(index: index);
                        print('index i got is $index');
                      },
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

  void onActionTap({required int index}) {
    switch (index) {
      case 0:
        WallpaperControlsBottomSheet.shareWallpaperBottomSheet(context,
            category: widget.arguments['categoryModel']);
        case 1:
        WallpaperControlsBottomSheet.setWallpaperBottomSheet(context,
            category: widget.arguments['categoryModel']);

    }
  }
}
