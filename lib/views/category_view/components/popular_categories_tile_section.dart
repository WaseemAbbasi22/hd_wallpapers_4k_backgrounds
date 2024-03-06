import 'package:animated_list_item/animated_list_item.dart';
import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/extensions/extensions.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PopularCategoriesTileSection extends StatefulWidget {
  const PopularCategoriesTileSection({super.key});

  @override
  State<PopularCategoriesTileSection> createState() => _PopularCategoriesTileSectionState();
}

class _PopularCategoriesTileSectionState extends State<PopularCategoriesTileSection> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animationController.forward();
  }

@override
  void dispose() {
  _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    HomeVM homeVM = context.read<HomeVM>();
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.kHorizontalPadding),
        child: ListView.builder(
          itemCount: homeVM.randomPopularListTiles.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            CategoryModel category = homeVM.randomPopularListTiles[index];

            return AnimatedListItem(
              length: homeVM.randomPopularListTiles.length,
              aniController: _animationController,
              animationType: AnimationType.zoom,
              index: index,
              child: Padding(
                padding: EdgeInsets.only(bottom: 1.5.h),
                child: WallPaperCard(
                  index: index,
                  imageUrl: category.imageUrl,
                  width: 100.w,
                  height: 10.h,
                  isWallpaperCover: true,
                  onCardTap: () {
                    Navigator.pushNamed(
                      context,
                      NamedRoute.categoryDetailView,
                      arguments: {'categoryModel': category, "mainCategory": AppConstants.popularThumbnailsKey},
                    );
                  },
                  child: Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        category.name.toUpperCase(),
                        style: AppStyle.headingTextStyle.copyWith(color: AppColors.kWhiteColor),
                      ),
                    ).toBackDropTextContainer(),
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
