import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/views/common_components/back_button_component.dart';
import 'package:awesome_wallpapers/views/search_view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ColorAppBar extends StatelessWidget {
  final String title;
  const ColorAppBar({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 2.w,),
            BackButtonComponent(
              radius: 2.5.h,
            ),
            SizedBox(width: 5.w,),
            Text(title, style: AppStyle.normalTextStyle),
          ],
        ),
        Padding(
          padding:  EdgeInsets.only(right: 3.w),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
            },
            child: SvgPicture.asset(
              AppAssets.searchIcon,
              height: 3.h,
              color: AppColors.kWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
