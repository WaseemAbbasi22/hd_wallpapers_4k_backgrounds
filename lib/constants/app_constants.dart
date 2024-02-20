import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:sizer/sizer.dart';

class AppConstants {
  static double sliderCardRadius = 12;
  static double kHorizontalPadding = 3.w;
  static double kVerticalPadding = 3.h;
  static int itemsToShowInRecommendedWallpapers = 15;
  static int itemsToShowInRecommendedWallpapersSeeAll = 60;
  static int itemsToShowInHomeFeedWallpapers = 25;

  static const String bucketUrlPrefix = 'https://awesome4kwallgrounds96bd8542cdfe4b24bb2af635c5401630-dev.s3.amazonaws.com/public/';

  static const String popularCategoriesPrefix = 'popular_categories/aesthetic/popular_categories_thumbnails/';
  static const String feedThumbnailsKey = 'feed_thumbnails/';
  static const String popularThumbnailsKey = 'popular-thumbnails/';
  static const String popularWallpapersKey = 'popular_categories/';
  static const String recommendedThumbnailsKey = 'recommended-thumbnails/';
  static const String recommendedWallpapersKey = 'recommended_categories/';
  static const String colorsWallpapersKey = 'colors_categories/';
  static const String colorsThumbnailsKey = 'colors-thumbnails/';
  static const String cacheSplitter = '/_mySplitter%_/';

  static List<CategoryModel> popularCategoryList = [
    CategoryModel(
      id: 1,
      quantity: 200,
      name: "travel",
      imageUrl: "assets/categories_popular/popular_travel.png",
    ),
    CategoryModel(
      id: 2,
      quantity: 300,
      name: "animal",
      imageUrl: "assets/categories_popular/popular_animals.png",
    ),
    CategoryModel(
      id: 3,
      quantity: 400,
      name: "nature",
      imageUrl: "assets/categories_popular/popular_nature.png",
    ),
    CategoryModel(
      id: 4,
      quantity: 500,
      name: "city",
      imageUrl: "assets/categories_popular/popular_city.png",
    ),
    CategoryModel(
      id: 5,
      quantity: 500,
      name: "bikes",
      imageUrl: "assets/categories_popular/popular_bikes.png",
    ),
    CategoryModel(
      id: 6,
      quantity: 500,
      name: "beach",
      imageUrl: "assets/categories_popular/popular_beach.png",
    ),
    CategoryModel(
      id: 7,
      quantity: 500,
      name: "food",
      imageUrl: "assets/categories_popular/popular_food.png",
    ),
    CategoryModel(
      id: 8,
      quantity: 500,
      name: "books",
      imageUrl: "assets/categories_popular/popular_book.png",
    ),
    CategoryModel(
      id: 9,
      quantity: 500,
      name: "cars",
      imageUrl: "assets/categories_popular/popular_car.png",
    ),
    // CategoryModel(
    //   id: 10,
    //   quantity: 500,
    //   name: "cat",
    //   imageUrl: "assets/categories_popular/popular_cat.png",
    // ),
    // CategoryModel(
    //   id: 11,
    //   quantity: 500,
    //   name: "space",
    //   imageUrl: "assets/categories_popular/popular_space.png",
    // ),
    CategoryModel(
      id: 10,
      quantity: 500,
      name: "music",
      imageUrl: "assets/categories_popular/popular_music.png",
    ),
    CategoryModel(
      id: 11,
      quantity: 500,
      name: "quotes",
      imageUrl: "assets/categories_popular/popular_quotes.png",
    ),
    CategoryModel(
      id: 12,
      quantity: 500,
      name: "aesthetic",
      imageUrl: "assets/categories_popular/popular_aesthetic.png",
    ),
    // CategoryModel(
    //   id: 15,
    //   quantity: 500,
    //   name: "sports",
    //   imageUrl: "assets/categories_popular/popular_sports.png",
    // ),
  ];

  //Love
  // glitter
  // peace
  // neon
  // fashion
  // vibe
  // Aurora
  // Birds
  // Butterfly
  // Caves
  // Desert
  // Drops
  // Flowers
  // trees
  // Fruit
  // Insects
  // Lakes
  // Leaf
  // cloud
  // River
  // Sunset
  // Waterfall
  // Winter

  static List<CategoryModel> recommendedCategoryList = [
    CategoryModel(
      id: 1,
      quantity: 200,
      name: "birds",
      imageUrl: "assets/categories_recommended/recommended_bird.png",
    ),
    CategoryModel(
      id: 2,
      quantity: 300,
      name: "butterfly",
      imageUrl: "assets/categories_recommended/recommended_butterfly.png",
    ),
    // CategoryModel(
    //   id: 3,
    //   quantity: 400,
    //   name: "caves",
    //   imageUrl: "assets/categories_recommended/recommended_caves.png",
    // ),
    CategoryModel(
      id: 4,
      quantity: 500,
      name: "cloud",
      imageUrl: "assets/categories_recommended/recommended_cloud.png",
    ),
    CategoryModel(
      id: 5,
      quantity: 500,
      name: "desert",
      imageUrl: "assets/categories_recommended/recommended_desert.png",
    ),
    CategoryModel(
      id: 6,
      quantity: 500,
      name: "drops",
      imageUrl: "assets/categories_recommended/recommended_drops.png",
    ),
    CategoryModel(
      id: 7,
      quantity: 500,
      name: "fashion",
      imageUrl: "assets/categories_recommended/recommended_fashion.png",
    ),
    CategoryModel(
      id: 8,
      quantity: 500,
      name: "flowers",
      imageUrl: "assets/categories_recommended/recommended_flowers.png",
    ),
    CategoryModel(
      id: 9,
      quantity: 500,
      name: "forest",
      imageUrl: "assets/categories_recommended/recommended_forest.png",
    ),
    CategoryModel(
      id: 10,
      quantity: 500,
      name: "fruit",
      imageUrl: "assets/categories_recommended/recommended_fruit.png",
    ),
    CategoryModel(
      id: 11,
      quantity: 500,
      name: "glitter",
      imageUrl: "assets/categories_recommended/recommended_glitter.png",
    ),
    CategoryModel(
      id: 12,
      quantity: 500,
      name: "insects",
      imageUrl: "assets/categories_recommended/recommended_insects.png",
    ),
    CategoryModel(
      id: 13,
      quantity: 500,
      name: "lake",
      imageUrl: "assets/categories_recommended/recommended_lake.png",
    ),
    CategoryModel(
      id: 14,
      quantity: 500,
      name: "leaf",
      imageUrl: "assets/categories_recommended/recommended_leaf.png",
    ),
    // CategoryModel(
    //   id: 14,
    //   quantity: 500,
    //   name: "love",
    //   imageUrl: "assets/categories_recommended/recommended_love.png",
    // ),
    // CategoryModel(
    //   id: 15,
    //   quantity: 500,
    //   name: "neon",
    //   imageUrl: "assets/categories_recommended/recommended_neon.png",
    // ),
    // CategoryModel(
    //   id: 16,
    //   quantity: 500,
    //   name: "peace",
    //   imageUrl: "assets/categories_recommended/recommended_peace.png",
    // ),
    CategoryModel(
      id: 17,
      quantity: 500,
      name: "river",
      imageUrl: "assets/categories_recommended/recommended_river.png",
    ),
    CategoryModel(
      id: 18,
      quantity: 500,
      name: "sunset",
      imageUrl: "assets/categories_recommended/recommended_sunset.png",
    ),
    // CategoryModel(
    //   id: 19,
    //   quantity: 500,
    //   name: "trees",
    //   imageUrl: "assets/categories_recommended/recommended_trees.png",
    // ),
    CategoryModel(
      id: 20,
      quantity: 500,
      name: "vibes",
      imageUrl: "assets/categories_recommended/recommended_vibes.png",
    ),
    CategoryModel(
      id: 21,
      quantity: 500,
      name: "waterfall",
      imageUrl: "assets/categories_recommended/recommended_waterfall.png",
    ),
    CategoryModel(
      id: 22,
      quantity: 500,
      name: "winter",
      imageUrl: "assets/categories_recommended/recommended_winter.png",
    ),
    // CategoryModel(
    //   id: 23,
    //   quantity: 500,
    //   name: "iPhone",
    //   imageUrl: "assets/categories_recommended/recommended_sunset.png",
    // ),
  ];
}

class AppAssets {
  //imageUrls...
  static const String homeIcon = "assets/icons/home_icon.svg";
  static const String homeContainerBg = 'assets/images/home_container_bg.png';
  static const String downloadWallpaperIcon = 'assets/icons/download_icon.svg';
  static const String favouriteIcon = 'assets/icons/favourite_icon.svg';
  static const String setWallpaperIcon = 'assets/icons/set_wallpaper_icon.svg';
  static const String shareIcon = 'assets/icons/share_icon.svg';
  static const String searchIcon = 'assets/icons/search_icon.svg';
  static const String rateAppIcon = 'assets/icons/rate_app_icon.svg';
  static const String downloadIcon = 'assets/icons/download_icon.svg';
  static const String homeIcon2 = 'assets/icons/home_icon2.svg';
  static const String categoryIcon = 'assets/icons/category_icon.svg';
  static const String setLockWallpaperIcon = 'assets/icons/lock_icon.svg';
  static const String setHomeWallpaperIcon = 'assets/icons/home_screen_icon.svg';
  static const String setBothWallpaperIcon = 'assets/icons/both_screen_icon.svg';
  static const String splashGif = 'assets/images/splash_gif.svg';
  static const String splashBg = 'assets/images/splash_bg.png';
  static const String facebookIcon = 'assets/icons/facebook_icon.svg';
  static const String whatsappIcon = 'assets/icons/whatsapp_icon.svg';
  static const String InstagramIcon = 'assets/icons/instagram_icon.svg';
  static const String snapchatIcon = 'assets/icons/snapchat_icon.svg';
}
