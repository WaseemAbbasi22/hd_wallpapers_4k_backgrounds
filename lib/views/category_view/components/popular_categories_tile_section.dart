import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/views/common_components/section_header_component.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

class PopularCategoriesTileSection extends StatelessWidget {
  const PopularCategoriesTileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Flexible(
      fit: FlexFit.loose,
      child: Container(
        padding:
        EdgeInsets.symmetric(horizontal: AppConstants.kHorizontalPadding),
        child: TransformableListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          getTransformMatrix: getTransformMatrix,
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(bottom: 1.5.h),
              child: WallPaperCard(
                index: index,
                imageUrl:AppString.popularCatogoriesImageUrl[index],
                width: 100.w,
                height: 10.h,
              ),
            );
          },
          itemCount: AppString.popularCatogoriesImageUrl.length,
        ),


      ),
    );
    //   Column(
    //   children: [
    //     SectionHeader(
    //       leadingText: AppString.popularCategories,
    //       showTrailing: false,
    //     ),
    //     Flexible(
    //       fit: FlexFit.loose,
    //       child: Container(
    //         padding:
    //             EdgeInsets.symmetric(horizontal: AppConstants.kHorizontalPadding),
    //         child: TransformableListView.builder(
    //           physics: const BouncingScrollPhysics(),
    //           shrinkWrap: true,
    //           getTransformMatrix: getTransformMatrix,
    //           itemBuilder: (context, index) {
    //             return Padding(
    //               padding:  EdgeInsets.only(bottom: 1.5.h),
    //               child: WallPaperCard(
    //                 index: index,
    //                 imageUrl:AppString.popularCatogoriesImageUrl[index],
    //                 width: 100.w,
    //                 height: 10.h,
    //               ),
    //             );
    //           },
    //           itemCount: AppString.popularCatogoriesImageUrl.length,
    //         ),
    //
    //
    //       ),
    //     ),
    //   ],
    // );
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