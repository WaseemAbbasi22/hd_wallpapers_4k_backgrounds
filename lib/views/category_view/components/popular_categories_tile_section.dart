import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/app_style/app_styles.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

class PopularCategoriesTileSection extends StatelessWidget {
  const PopularCategoriesTileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.kHorizontalPadding),
        child: TransformableListView.builder(
          // physics: const (),
          shrinkWrap: true,
          getTransformMatrix: getTransformMatrix,
          itemBuilder: (context, index) {
            CategoryModel category = AppString.categoryList[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 1.5.h),
              child: WallPaperCard(
                index: index,
                imageUrl: category.imageUrl,
                width: 100.w,
                height: 10.h,
                onCardTap: () {
                  Navigator.pushNamed(
                    context,
                    NamedRoute.categoryDetailView,
                    arguments: {'categoryModel': category},
                  );
                },
                child: Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      category.name ?? '',
                      style: AppStyle.headingTextStyle
                          .copyWith(color: AppColors.kWhiteColor),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: AppString.categoryList.length,
        ),
      ),
    );
  }

  Matrix4 getTransformMatrix(TransformableListItem item) {
    /// final scale of child when the animation is completed
    const endScaleBound = 0.3;

    /// 0 when animation completed and [scale] == [endScaleBound]
    /// 1 when animation starts and [scale] == 1
    final animationProgress = item.visibleExtent / item.size.height;

    /// result matrix
    final paintTransform = Matrix4.identity();

    /// animate only if item is on edge
    if (item.position != TransformableListItemPosition.middle) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);

      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }
}
// ListView.builder(
//   shrinkWrap: true,
//   padding: EdgeInsets.zero,
//   physics: const ClampingScrollPhysics(),
//   itemCount: AppString.popularCatogoriesImageUrl.length,
//   scrollDirection: Axis.vertical,
//   itemBuilder: (BuildContext context, int index) {
//     return Padding(
//       padding:  EdgeInsets.only(bottom: 1.5.h),
//       child: WallPaperCard(
//           index: index,
//         imageUrl:AppString.popularCatogoriesImageUrl[index],
//         width: 100.w,
//         height: 10.h,
//       ),
//     );
//   },
// ),
