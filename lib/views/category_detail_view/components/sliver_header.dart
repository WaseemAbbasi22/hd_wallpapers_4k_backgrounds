import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../common_components/back_button_component.dart';

class SliverHeader extends StatefulWidget {
  final CategoryModel category;
  final ScrollController controller;

  const SliverHeader({required this.category,required this.controller, super.key});

  @override
  State<SliverHeader> createState() => _SliverHeaderState();
}

class _SliverHeaderState extends State<SliverHeader> {
  bool get isSliverAppBarExpanded {
    return widget.controller.hasClients &&
        widget.controller.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.kPrimaryColor,
      expandedHeight: 35.h,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Container(
          height: 0.8.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppConstants.sliderCardRadius),
              topLeft: Radius.circular(AppConstants.sliderCardRadius),
            ),
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
      // expandedHeight: 200,
      pinned: true,
      elevation: 0,
      leading:const Padding(
        padding:  EdgeInsets.all(8.0),
        child:  BackButtonComponent(),
      ),

      flexibleSpace: FlexibleSpaceBar(
        // title: Text(
        //   category.name??'',
        //   style: AppStyle.headingTextStyle.copyWith(color: AppColors.kWhiteColor),
        // ),
        background: WallPaperCard(
          index: 0,
          imageUrl: widget.category.imageUrl,
          hasTopRadiusOnly: true,
          width: 100.w,
           borderWidth: 0,
           child: Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child:  Center(
                child: Text(
                  widget.category.name??'',
                  style: AppStyle.headingTextStyle.copyWith(color: AppColors.kWhiteColor),
                ),
              ),
            )
        ),
      ),
    );
  }
}
