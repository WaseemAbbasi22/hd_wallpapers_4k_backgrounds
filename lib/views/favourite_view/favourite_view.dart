import 'dart:async';

import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:awesome_wallpapers/views/common_components/background_container_component.dart';
import 'package:awesome_wallpapers/views/favourite_view/components/favourite_appbar.dart';
import 'package:awesome_wallpapers/views/favourite_view/favourite_grid.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FavouriteView extends StatefulWidget {
  final Map arguments;

  const FavouriteView({super.key, required this.arguments});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  bool isFromDownloads = false;

  @override
  void initState() {
    isFromDownloads = widget.arguments['isDownloads'];
    onFavouriteViewLoaded();

    super.initState();
  }

  onFavouriteViewLoaded() {
    scheduleMicrotask(() {
      context.read<HomeVM>().getFavoriteWallpapers(isForDownloads: isFromDownloads);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeVM = context.watch<HomeVM>();
    return Scaffold(
      backgroundColor: context.theme.appColors.primary,
      body: SingleChildScrollView(
        child: BackgroundContainer(
          horizontalPadding: 1.w,
          verticalPadding: 0,
          child: Column(
            children: [
              SizedBox(height: 3.h),
              FavouriteAppBar(isForDownloads: isFromDownloads),
              SizedBox(height: 3.h),
              homeVM.favoriteWallpapers.isEmpty
                  ? Text(AppString.noWallpapersInCategory,
                      style: AppStyle.normalTextStyle.copyWith(
                        color: context.theme.appColors.outline,
                      ))
                  : FavouriteGridComponent(
                      wallpapers: homeVM.favoriteWallpapers,
                      isForDownloads: isFromDownloads,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
