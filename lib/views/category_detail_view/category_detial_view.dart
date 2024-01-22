import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/views/category_detail_view/components/detail_sliver_grid.dart';
import 'package:awesome_wallpapers/views/category_detail_view/components/sliver_header.dart';
import 'package:awesome_wallpapers/views/category_view/components/color_section.dart';
import 'package:awesome_wallpapers/views/common_components/section_header_component.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../category_view/components/popular_categories_tile_section.dart';

class CategoryDetailView extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetailView({required this.category,super.key});

  @override
  State<CategoryDetailView> createState() => _HomeViewState();
}
class _HomeViewState extends State<CategoryDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView( slivers: [
        SliverHeader(
          category: widget.category,
        ),
        DetailSliverGrid(categoryList: AppString.categoryList),
      ]),
    );
  }
}
