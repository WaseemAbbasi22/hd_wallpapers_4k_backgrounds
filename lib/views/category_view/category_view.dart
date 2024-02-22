import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/views/category_view/components/color_section.dart';
import 'package:awesome_wallpapers/views/common_components/section_header_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import 'components/popular_categories_tile_section.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _HomeViewState();
}

class _HomeViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        const ColorSection(),
        SizedBox(
          height: 2.h,
        ),
        SectionHeader(
          leadingText: AppString.popularCategories,
          showTrailing: false,
        ),
        PopularCategoriesTileSection(),
      ],
    );
  }
}
