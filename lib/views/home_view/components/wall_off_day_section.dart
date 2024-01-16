import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/views/common_components/section_header_component.dart';
import 'package:awesome_wallpapers/views/home_view/components/slider_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class WallOffDaySection extends StatelessWidget {
  const WallOffDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          leadingText: AppString.wallOfDay,
          trailingText: AppString.seeAll,
          showTrailing: true,
          onTrailingTap: (){
            //see all...
          },
        ),
        SizedBox(height: 2.h,),
        ImageSlider(
          imageList: AppString.sliderImageUrl,
        ),
      ],
    );
  }
}


