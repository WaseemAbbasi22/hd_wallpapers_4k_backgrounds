import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/views/common_components/section_header_component.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class PopularCategoriesSection extends StatelessWidget {
  const PopularCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          leadingText: AppString.popularCategories,
          showTrailing: false,
        ),
        SizedBox(height: 2.h,),
        Container(
          padding:  EdgeInsets.only(left:AppConstants.kHorizontalPadding),
          height: 15.h,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: AppString.categoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              CategoryModel category = AppString.categoryList[index];
              return Padding(
                padding:  EdgeInsets.only(right: 5.w),
                child: WallPaperCard(
                    index: index,
                  imageUrl:category.imageUrl,
                  width: 40.w,
                  child: Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child:  Center(
                        child: Text(
                          category.name??'',
                         style: AppStyle.headingTextStyle.copyWith(color: AppColors.kWhiteColor),
                        ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}
