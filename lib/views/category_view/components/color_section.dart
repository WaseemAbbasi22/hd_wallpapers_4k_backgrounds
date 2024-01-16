import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/views/category_view/components/color_section_component.dart';
import 'package:awesome_wallpapers/views/common_components/section_header_component.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          leadingText: AppString.colors,
          showTrailing: false,
        ),
        SizedBox(height: 1.h,),
        Container(
          padding:  EdgeInsets.only(left:AppConstants.kHorizontalPadding),
          height: 15.h,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: AppString.gradientColorsList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              Map<String,dynamic> colorModel = AppString.gradientColorsList[index];
              return Padding(
                padding:  EdgeInsets.only(right: 5.w),
                child:ColorSectionComponent(
                  radius: 35.0,
                  label:colorModel['label'],
                  gradientColors: colorModel['colors'], // Add your desired gradient colors
                  onTap: () {
                    // Handle the onTap event
                  },
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}
