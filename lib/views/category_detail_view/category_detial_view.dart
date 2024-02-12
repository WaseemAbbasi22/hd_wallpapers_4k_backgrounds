import 'dart:async';
import 'dart:developer';

import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/views/category_detail_view/components/detail_sliver_grid.dart';
import 'package:awesome_wallpapers/views/category_detail_view/components/sliver_header.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetailView extends StatefulWidget {
  final Map arguments;

  const CategoryDetailView({required this.arguments, super.key});

  @override
  State<CategoryDetailView> createState() => _HomeViewState();
}

class _HomeViewState extends State<CategoryDetailView> {
  final ScrollController scrollController = ScrollController();
  double scrollPosition = 0.0;

  String getCategoryKeyFormatted() {
    CategoryModel categoryModel = widget.arguments["categoryModel"];
    if (categoryModel.name == AppString.wallOfDay) {}
    return (widget.arguments["mainCategory"]) + (categoryModel.name) + ('/');
  }

  @override
  void initState() {
    scrollController.addListener(() {
      updatePositionOnScroll(scrollController.offset);
    });

    CategoryModel categoryModel = widget.arguments["categoryModel"];
    if (categoryModel.name == AppString.wallOfDay) {
      scheduleMicrotask(() {
        context.read<HomeVM>().getFeedWallpapers(AppConstants.feedThumbnailsKey, isSeeAll: true);
      });
    } else if (categoryModel.name == AppString.recommended) {
      scheduleMicrotask(() {
        context.read<HomeVM>().getRecommendedWallpapersList(AppConstants.recommendedThumbnailsKey, isSeeAll: true);
      });
    } else {
      scheduleMicrotask(() {
        log("getCategoryKeyFormatted: ${getCategoryKeyFormatted()}");
        context.read<HomeVM>().getWallpapersListByCategory(getCategoryKeyFormatted());
      });
    }

    super.initState();
  }

  void updatePositionOnScroll(double offset) {
    setState(() {
      scrollPosition = scrollController.position.pixels;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeVM homeVM = context.watch<HomeVM>();
    CategoryModel category = widget.arguments['categoryModel'];
    if (homeVM.wallpapersListByCategory.isNotEmpty && category.name != AppString.wallOfDay && category.name != AppString.recommended) {
      category.imageUrl = homeVM.wallpapersListByCategory.last.imageUrl;
    }
    return Scaffold(
      backgroundColor: AppColors.kGreyColor,
      body: CustomScrollView(controller: scrollController, slivers: [
        SliverHeader(
          category: category,
          scrollPosition: scrollPosition,
        ),
        DetailSliverGrid(
          wallpaperList: (category.name == AppString.wallOfDay)
              ? homeVM.feedThumbnailList
              : (category.name == AppString.recommended)
                  ? homeVM.recommendedWallpapersList
                  : homeVM.wallpapersListByCategory,
        ),
      ]),
    );
  }
}
