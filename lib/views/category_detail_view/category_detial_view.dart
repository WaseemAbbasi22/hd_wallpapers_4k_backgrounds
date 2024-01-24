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
  late ScrollController scrollController;
  bool isExpended =false;
  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController() ..addListener(() {

    });

    super.initState();
  }
  bool get isSliverAppBarExpanded {
    return scrollController.hasClients &&
        scrollController.offset > (200 - kToolbarHeight);
  }
  @override
  Widget build(BuildContext context) {
    print('value i got is ${isSliverAppBarExpanded}');
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        controller: scrollController,
          slivers: [
        SliverHeader(
          category: widget.category,
          controller: scrollController,
        ),
        DetailSliverGrid(categoryList: AppString.categoryList),
      ]),
    );
  }
}
