import 'package:awesome_wallpapers/app_style/app_colors.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WallPaperCard extends StatelessWidget {
  final String? imageUrl;
  final int index;
  final VoidCallback? onCardTap;
  final Widget? child;
  final double? width;
  final double? height;
  final Color? borderColor;
  final bool? hasTopRadiusOnly;
  final double? borderWidth;
  final bool? isFromNetwork;
  final Function()? onLoadFailed;

  const WallPaperCard(
      {required this.index,
      this.imageUrl,
      this.height,
      this.borderColor,
      this.onCardTap,
      this.borderWidth,
      this.child,
      this.hasTopRadiusOnly = false,
      this.width,
      this.isFromNetwork = true,
      this.onLoadFailed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: ValueKey(index),
      children: [
        GestureDetector(
          onTap: onCardTap,
          child: Container(
            width: width ?? 60.w,
            height: height ?? 100.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor ?? AppColors.kGreyColor,
                width: borderWidth ?? 2.0,
              ),
              borderRadius: hasTopRadiusOnly! ? BorderRadius.zero : BorderRadius.circular(AppConstants.sliderCardRadius),
            ),
            child: ClipRRect(
              borderRadius: hasTopRadiusOnly! ? BorderRadius.zero : BorderRadius.circular(AppConstants.sliderCardRadius),
              child: (isFromNetwork ?? true)
                  ? CachedNetworkImage(
                      imageUrl: imageUrl ?? '',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                            child: SizedBox(
                              height: 3.h,
                              width: 6.w,
                              child: const CircularProgressIndicator(
                                color: AppColors.kWhiteColor,
                                strokeWidth: 1,
                              ),
                            ),
                          ),
                      errorWidget: (context, url, error) {
                        if (onLoadFailed != null) {
                          onLoadFailed!();
                        }
                        return Center(
                          child: SizedBox(
                            height: 3.h,
                            width: 6.w,
                            child: const CircularProgressIndicator(
                              color: AppColors.kWhiteColor,
                              strokeWidth: 1,
                            ),
                          ),
                        );
                      })
                  : Image.asset(
                      imageUrl ?? '',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        child ?? const SizedBox(),
      ],
    );
  }
}
