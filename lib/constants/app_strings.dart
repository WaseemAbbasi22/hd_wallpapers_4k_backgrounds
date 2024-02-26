import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AppString {
  static String appDescription = 'Free Unlimited High Quality Wallpapers And Backgrounds';
  static String appName = 'HD Wallpaper - 4K Background';
  static String myFavourite = 'My Favourites';
  static String myDownloads = 'My Downloads';
  static String wallOfDay = 'Wall Of The Day 🔥';
  static String seeAll = 'See all';
  static String recommended = 'Recommended';
  static String share = 'Share';
  static String setAs = 'Set as';
  static String colors = 'Colors';
  static String letsStart = "Let's Start";
  static String privacyPolicyText1 = " By Continuing you agree to our ";
  static String privacyPolicyText2 = " privacy policy ";
  static String privacyPolicyText3 = " terms of use ";
  static String searchViewHeading = "Discover High Quality and Beautiful Wallpapers";
  static String popularSearches = "Popular Searches";
  static String searchResults = "Search Results";
  static String popularCategories = 'Popular Categories';
  static String searchInCategories = 'Search in 100+ trending categories';
  static String noWallpapersInCategory = 'There are no wallpapers in this category';
  static List<String> tabsTextList = ["Home", "Categories"];

  static const privacyPolicyLink = "https://sites.google.com/view/wizdom-apps-privacy-policy/home";
  static const packageName = "com.hdwallpaperapp.livewallpapers.hdbackground.animewallpaper";
  static const playStoreLink = "https://play.google.com/store/apps/details?id=$packageName";

  static List<IconData> tabsIconList = [
    Icons.home_filled,
    Icons.category,
  ];
  static List<Map<String, dynamic>> gradientColorsList = [
    {
      'label': 'Yellow',
      'colors': [const Color(0xFFFFEC01), const Color(0xFFFFA703)],
    },
    {
      'label': 'Pink',
      'colors': [const Color(0xFFFF8FAF), const Color(0xFFFF3E7A)],
    },
    {
      'label': 'Red',
      'colors': [const Color(0xFFED213A), const Color(0xFF93291E)],
    },
    {
      'label': 'Green',
      'colors': [const Color(0xFFA8E063), const Color(0xFF56AB2F)],
    },
    {
      'label': 'Orange',
      'colors': [const Color(0xFFFFBE0B), const Color(0xFFF42B03)],
    },
    {
      'label': 'Purple',
      'colors': [const Color(0xFF6633B6), const Color(0xFF310E68)],
    },
    {
      'label': 'Blue',
      'colors': [const Color(0xFF20A4F3), const Color(0xFF335A79)],
    },
    {
      'label': 'Teal',
      'colors': [const Color(0xFF34A798), const Color(0xFF036A6A)],
    },
    {
      'label': 'DarkGrey',
      'colors': [const Color(0xFF9A9A9A), const Color(0xFF454545)],
    },
  ];

  static List<Map<String, dynamic>> wallpaperActionData = [
    {'icon': AppAssets.shareIcon, 'label': 'Share'},
    {'icon': AppAssets.setWallpaperIcon, 'label': 'Set Wallpaper'},
    {'icon': AppAssets.favouriteIcon, 'label': 'Favourite'},
    {'icon': AppAssets.downloadWallpaperIcon, 'label': 'Download'},
  ];
  static List<Map<String, dynamic>> shareBottomSheetActionData = [
    {'icon': AppAssets.whatsappIcon, 'label': 'WhatsApp'},
    {'icon': AppAssets.facebookIcon, 'label': 'Facebook'},
    {'icon': AppAssets.InstagramIcon, 'label': 'Instagram'},
    {'icon': AppAssets.snapchatIcon, 'label': 'Snapchat'},
  ];
  static List<Map<String, dynamic>> setBottomSheetActionData = [
    {'icon': AppAssets.setHomeWallpaperIcon, 'label': 'Home screen'},
    {'icon': AppAssets.setLockWallpaperIcon, 'label': 'Lock screen'},
    {'icon': AppAssets.setBothWallpaperIcon, 'label': 'Both screen'},
  ];
  static List<Map<String, dynamic>> drawerItemList = [
    {'icon': AppAssets.homeIcon2, 'label': 'Home'},
    {'icon': AppAssets.categoryIcon, 'label': 'Categories'},
    {'icon': AppAssets.favouriteIcon, 'label': 'Favorite'},
    {'icon': AppAssets.downloadIcon, 'label': 'Downloads'},
    {'icon': AppAssets.homeIcon2, 'label': 'Light'},
    {'icon': AppAssets.rateAppIcon, 'label': 'Rate App'},
    {'icon': AppAssets.shareIcon, 'label': 'Share App'},
  ];
}
