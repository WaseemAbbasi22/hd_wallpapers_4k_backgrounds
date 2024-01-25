import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/views/category_detail_view/components/detail_sliver_grid.dart';
import 'package:awesome_wallpapers/views/category_detail_view/components/sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CategoryDetailView extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetailView({required this.category,super.key});

  @override
  State<CategoryDetailView> createState() => _HomeViewState();
}
class _HomeViewState extends State<CategoryDetailView> {
  final ScrollController scrollController = ScrollController();
  double scrollPosition = 0.0;
  @override
  void initState() {
    scrollController.addListener(() {
      updatePositionOnScroll(scrollController.offset);
    });

    super.initState();
  }
  void updatePositionOnScroll(double offset) {
    setState(() {
      scrollPosition = scrollController.position.pixels;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        controller: scrollController,
          slivers: [
        SliverHeader(
          category: widget.category,
          scrollPosition: scrollPosition,
        ),
        DetailSliverGrid(categoryList: AppString.categoryList),
      ]),
    );
  }
}
