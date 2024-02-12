import 'dart:async';

import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/views/home_view/components/popular_categories_section.dart';
import 'package:awesome_wallpapers/views/home_view/components/wall_off_day_section.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'components/recommended_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<void> onLoaded(BuildContext context) async {
    scheduleMicrotask(() {
      context.read<HomeVM>().initializeRandomPopularList();
      context.read<HomeVM>().getFeedWallpapers(AppConstants.feedThumbnailsKey);
      context.read<HomeVM>().getRecommendedWallpapersList(AppConstants.recommendedThumbnailsKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onLoaded(context),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            const WallOffDaySection(),
            SizedBox(
              height: 2.h,
            ),
            const PopularCategoriesSection(),
            SizedBox(
              height: 2.h,
            ),
            const RecommendedSection(),
          ],
        ),
      ),
    );
  }
}
