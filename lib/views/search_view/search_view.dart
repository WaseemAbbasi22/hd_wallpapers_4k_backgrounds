import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/views/common_components/back_button_component.dart';
import 'package:awesome_wallpapers/views/common_components/background_container_component.dart';
import 'package:awesome_wallpapers/views/search_view/components/search_textfield.dart';
import 'package:awesome_wallpapers/views/search_view/components/search_tile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                  style: AppStyle.appBarTitleTextStyle,
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  child: SearchTextField(
                    onChange: (value) {},
                    onSearch: () {
                      print('serch tap...');
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  AppString.popularSearches,
                  style: AppStyle.headingTextStyle,
                ),
                SizedBox(
                  height: 2.h,
                ),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: AppString.popularCategoryList.length,
                    shrinkWrap: true,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      CategoryModel category = AppString.popularCategoryList[index];
                      return Padding(
                        padding:  EdgeInsets.only(bottom: 1.5.h),
                        child: SearchTile(category: category),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
