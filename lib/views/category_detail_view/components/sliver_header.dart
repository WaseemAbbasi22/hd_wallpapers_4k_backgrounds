import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../common_components/back_button_component.dart';

class SliverHeader extends StatefulWidget {
  final CategoryModel category;
  final double scrollPosition;

  const SliverHeader(
      {required this.category, required this.scrollPosition, super.key});

  @override
  State<SliverHeader> createState() => _SliverHeaderState();
}

class _SliverHeaderState extends State<SliverHeader> {
  bool showTitle = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.kPrimaryColor,
      expandedHeight: 35.h,
      pinned: true,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.scrollPosition > 226
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.kWhiteColor,
                ),
              )
            : const BackButtonComponent(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: widget.scrollPosition >= 28.h
            ? Text(
                widget.category.name ?? '',
                style: AppStyle.headingTextStyle
                    .copyWith(color: AppColors.kWhiteColor),
              )
            : null,
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
              child: Center(
                child: Text(
                  widget.category.name ?? '',
                  style: AppStyle.headingTextStyle
                      .copyWith(color: AppColors.kWhiteColor),
                ),
              ),
            )),
      ),
    );
  }
}
