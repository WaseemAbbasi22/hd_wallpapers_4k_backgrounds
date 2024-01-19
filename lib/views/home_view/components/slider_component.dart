import 'package:awesome_wallpapers/styles/app_colors.dart';
import 'package:awesome_wallpapers/views/common_components/wallpaper_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageSlider extends StatefulWidget {
  final double? height;
  final List<String> imageList;

  const ImageSlider(
      {Key? key,
        this.height,
        required this.imageList,
      })
      : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      disableGesture: false,
      options: CarouselOptions(
            height: 35.h,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            viewportFraction: 0.5,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          }),
      items: widget.imageList
          .map((item) => WallPaperCard(
          imageUrl: item,
          index: _currentIndex,
          child: Positioned(
            top: 10,
            right: 14,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: AppColors.kBlackColor.withOpacity(0.5),
                radius: 2.5.h,
                child: Center(
                  child: Icon(
                    Icons.favorite_border,
                    size: 3.h,
                    color: AppColors.kWhiteColor,
                  ),
                ),
              ),
            ),
          ),
          onCardTap:() {
           ///Go to detail page.....
          }))
          .toList(),
    );
  }
}
