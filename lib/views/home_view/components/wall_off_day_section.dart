import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/constants/app_strings.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/views/common_components/section_header_component.dart';
import 'package:awesome_wallpapers/views/home_view/components/slider_component.dart';
import 'package:awesome_wallpapers/views/home_view/home_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class WallOffDaySection extends StatelessWidget {
  const WallOffDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeVM homeVM = context.watch<HomeVM>();

    return Column(
      children: [
        SectionHeader(
          leadingText: AppString.wallOfDay,
          trailingText: AppString.seeAll,
          showTrailing: true,
          onTrailingTap: () {
            //see all...
            Navigator.pushNamed(
              context,
              NamedRoute.categoryDetailView,
              arguments: {
                'categoryModel': CategoryModel(
                  name: AppString.wallOfDay,
                  imageUrl: context.read<HomeVM>().feedThumbnailList.first.imageUrl,
                ),
                "mainCategory": AppConstants.feedThumbnailsKey,
              },
            );
          },
        ),
        SizedBox(height: 2.h),
        ImageSlider(imageList: homeVM.feedThumbnailList),
      ],
    );
  }
}
