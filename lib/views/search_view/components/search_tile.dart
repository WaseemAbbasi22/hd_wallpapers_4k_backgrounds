import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class SearchTile extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback ?onTileTap;

  const SearchTile({required this.category,this.onTileTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTileTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.sliderCardRadius)),
        child: Row(
          children: [
            category.imageUrl != null
                ? Container(
                    width: 18.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(category.imageUrl!),
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppConstants.sliderCardRadius)),
                    ),
                  )
                : const SizedBox(),
            //     : Container(
            //   width: 22.w,
            //   height: 10.h,
            //   decoration: const BoxDecoration(
            //     color: AppColors.whiteShadowColor,
            //     borderRadius: BorderRadius.all(
            //         Radius.circular(AppConstants.cardRadius)),
            //   ),
            //   child: const Center(
            //     child: Text(
            //       'No Image',
            //       style: TextStyle(color: AppColors.kWhiteColor),
            //     ),
            //   ),
            // ),
            SizedBox(
              width: 5.w,
            ),
            Flexible(
              // fit: FlexFit.loose,
              child: Text(
                category.name ?? '',
                overflow: TextOverflow.ellipsis,
                style: AppStyle.normalTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
