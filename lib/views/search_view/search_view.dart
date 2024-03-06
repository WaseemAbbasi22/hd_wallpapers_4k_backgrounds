import 'dart:async';

import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/theme/app_theme.dart';
import 'package:awesome_wallpapers/views/common_components/back_button_component.dart';
import 'package:awesome_wallpapers/views/common_components/background_container_component.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:awesome_wallpapers/views/search_view/components/search_textfield.dart';
import 'package:awesome_wallpapers/views/search_view/components/search_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    scheduleMicrotask(() {
      context.read<HomeVM>().initializePopularSearchList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeVM homeVM = context.watch<HomeVM>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: BackgroundContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButtonComponent(),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  AppString.searchViewHeading,
                  style: AppStyle.appBarTitleTextStyle.copyWith(color: context.theme.appColors.outline),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  child: SearchTextField(
                    hintText: AppString.searchInCategories,
                    onChange: (value) {
                      homeVM.onSearchUpdated(query: value);
                    },
                    onSearch: () {},
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  homeVM.searchResultCategories.isNotEmpty ? AppString.searchResults : AppString.popularSearches,
                  style: AppStyle.headingTextStyle.copyWith(color: context.theme.appColors.outline),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: homeVM.searchResultCategories.isNotEmpty ? homeVM.searchResultCategories.length : homeVM.popularSearchesList.length,
                    shrinkWrap: true,
                    // reverse: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      CategoryModel category =
                          homeVM.searchResultCategories.isNotEmpty ? homeVM.searchResultCategories[index] : homeVM.popularSearchesList[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 1.5.h),
                        child: SearchTile(
                          isFromNetwork: true,
                          category: category,
                          onTileTap: () {
                            Navigator.pushNamed(
                              context,
                              NamedRoute.categoryDetailView,
                              arguments: {
                                'categoryModel': category,
                                "mainCategory": AppConstants.popularThumbnailsKey,
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
