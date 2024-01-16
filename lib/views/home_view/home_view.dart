import 'package:awesome_wallpapers/views/home_view/components/popular_categories_section.dart';
import 'package:awesome_wallpapers/views/home_view/components/wall_off_day_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import 'components/recommended_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
       children: [
         SizedBox(height: 2.h,),
        const  WallOffDaySection(),
         SizedBox(height: 2.h,),
        const PopularCategoriesSection(),
         SizedBox(height: 2.h,),
         const RecommendedSection(),
       ],
      ),
    );
  }
}
