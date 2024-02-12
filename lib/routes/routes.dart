import 'package:awesome_wallpapers/views/category_detail_view/category_detial_view.dart';
import 'package:awesome_wallpapers/views/category_view/category_view.dart';
import 'package:awesome_wallpapers/views/color_view/color_view.dart';
import 'package:awesome_wallpapers/views/favourite_view/favourite_view.dart';
import 'package:awesome_wallpapers/views/home_view/home_view.dart';
import 'package:awesome_wallpapers/views/main_view/main_view.dart';
import 'package:awesome_wallpapers/views/search_view/search_view.dart';
import 'package:awesome_wallpapers/views/set_wallpaper_view/setWallpaper_view.dart';
import 'package:awesome_wallpapers/views/splash_view/splash_view.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  AppRoutes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NamedRoute.mainView:
        return MaterialPageRoute<void>(
          builder: (context) =>  MainView(arguments: settings.arguments as Map),
          settings: settings,
        );
      case NamedRoute.splashView:
        return MaterialPageRoute<void>(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case NamedRoute.homeView:
        return MaterialPageRoute<void>(
          builder: (context) =>
             const HomeView(),
        );
      case NamedRoute.categoryView:
        return MaterialPageRoute<void>(
          builder: (context) =>
              const CategoryView(), //idr kasa
          settings: settings,
        );
      case NamedRoute.categoryDetailView:
        return MaterialPageRoute<void>(
          builder: (context) =>
              CategoryDetailView(arguments: settings.arguments as Map), //idr kasa
          settings: settings,
        );
      case NamedRoute.favouriteView:
        return MaterialPageRoute<void>(
          builder: (context) => const FavouriteView(
          ),
          settings: settings,
        );

      case NamedRoute.colorView:
        return MaterialPageRoute<void>(
          builder: (context) => ColorView(
            arguments: settings.arguments as Map,
          ), //idr kasa
          settings: settings,
        );
      case NamedRoute.searchView:
        return MaterialPageRoute<void>(
          builder: (context) => const SearchView(),
          settings: settings,
        );
      case NamedRoute.setWallpaperView:
        return MaterialPageRoute<void>(
          builder: (context) => SetWallpaperView(arguments: settings.arguments as Map),
          settings: settings,
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => _UndefinedView(name: settings.name),
          settings: settings,
        );
    }
  }
}

class _UndefinedView extends StatelessWidget {
  const _UndefinedView({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Something went wrong for $name'),
      ),
    );
  }
}

class NamedRoute {
  NamedRoute._();

  static const String splashView = '/splashView';
  static const String homeView = '/homeView';
  static const String  mainView = '/mainView';
  static const String categoryView = '/categoryView';
  static const String categoryDetailView = '/categoryDetailView';
  static const String colorView = '/colorView';
  static const String favouriteView = '/favouriteView';
  static const String searchView = '/searchView';
  static const String setWallpaperView = '/setWallpaperView';


}
