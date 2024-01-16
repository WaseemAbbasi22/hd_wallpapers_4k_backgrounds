import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/views/common_components/section_header_component.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeader(
          leadingText: AppString.recommended,
          trailingText: AppString.seeAll,
          showTrailing: true,
          onTrailingTap: () {
            //see all...
          },
        ),
        SizedBox(
          height: 2.h,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            padding: EdgeInsets.only(left: AppConstants.kHorizontalPadding),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                childAspectRatio: 3/5,
              ),
              itemCount: AppString.sliderImageUrl.length,
              itemBuilder: (BuildContext context, int index) => WallPaperCard(
                index: index,
                borderColor: Colors.transparent,
                imageUrl: AppString.sliderImageUrl[index],
               child: Positioned(
                 top: 8,
                 right: 8,
                 child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: AppColors.kBlackColor.withOpacity(0.5),
                      radius: 2.h,
                      child: Center(
                        child: Icon(
                          Icons.favorite_border,
                          size: 2.3.h,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ),
               ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
