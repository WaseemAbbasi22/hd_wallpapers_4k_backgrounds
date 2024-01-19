import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
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
      body: CustomScrollView( slivers: [
        SliverHeader(
          category: widget.category,
        ),
        // DetailBasicInformationWidget(
        //     listingModel: listingVm.singleProperty,
        //     index: widget.arguments['index']),
        // SliverOffstage(
        //   offstage: scrollPosition > listingInfoHeight ? false : true,
        //   sliver: SliverPersistentHeader(
        //     delegate: DetailDescriptionTypes(
        //         selectedCategoryInxed: selectedDetailIndex,
        //         onChanged: scrollNewProject,
        //         listType: listingVm.singleProperty.propertyType ?? ''),
        //     pinned: true,
        //   ),
        // ),
        // SliverPadding(
        //   padding: EdgeInsets.symmetric(
        //       horizontal: AppConstants.defaultHorizontalPadding),
        //   sliver: SliverList(
        //     delegate: SliverChildBuilderDelegate(
        //       addAutomaticKeepAlives: false,
        //       addSemanticIndexes: false,
        //       addRepaintBoundaries: false,
        //           (context, categoryIndex) {
        //         return bottomContainer(
        //             listingModel: listingVm.singleProperty);
        //       },
        //       childCount: 1,
        //     ),
        //   ),
        // ),
      ]),
    );
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
        const PopularCategoriesTileSection(),
      ],
    );
  }
}
