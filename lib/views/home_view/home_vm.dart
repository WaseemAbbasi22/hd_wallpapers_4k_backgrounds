import 'dart:developer';
import 'dart:math' as math;

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/dependency_injection/dependency_injection.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/models/wallpaper_model.dart';
import 'package:awesome_wallpapers/repositories/cache_repo.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/utilities/general.dart';
import 'package:awesome_wallpapers/views/common_components/user_intimation_components.dart';
import 'package:flutter/cupertino.dart';

class HomeVM extends ChangeNotifier {
  List<WallpaperModel> recommendedWallpapersList = [];

  List<WallpaperModel> feedThumbnailList = [];

  List<CategoryModel> allCategoriesListBoxes = [];
  List<CategoryModel> allCategoriesListTiles = [];
  List<CategoryModel> randomPopularListBoxes = [];
  List<CategoryModel> randomPopularListTiles = [];
  List<CategoryModel> popularSearchesList = [];
  List<CategoryModel> searchResultCategories = [];

  List<CategoryModel> randomRecommendedList = [];

  bool _isFeedLoading = true;



  get isFeedLoading => _isFeedLoading;

  updateLoadingFeed(bool value) {
    _isFeedLoading = value;
    notifyListeners();
  }

  List<WallpaperModel> wallpapersListByCategory = [];

  Future<List<StorageItem>> getAmplifyStorageList({required String path}) async {
    final StorageListOperation<StorageListRequest, StorageListResult<StorageItem>> result = Amplify.Storage.list(path: path);
    final StorageListResult<StorageItem> itemsList = await result.result;
    return itemsList.items;
  }

  void removeWallpaperByIndex(int index) {
    wallpapersListByCategory.removeAt(index);
    notifyListeners();
  }

  String getCategoryNameFromKey(String key) {
    String name = key;

    var element = key.split('/').last.replaceFirst(AppConstants.wallpaperCoversExtension, "");
    if (element.contains("-box")) {
      name = element.replaceFirst("-box", "");
    } else {
      name = element.replaceFirst("-tile", "");
    }
    return name;
  }

  Future<void> getCategoriesList() async {
    allCategoriesListBoxes.clear();
    allCategoriesListTiles.clear();
    updateLoadingFeed(true);

    try {
      List items = await getAmplifyStorageList(path: AppConstants.wallpaperCovers);
      if (items.isNotEmpty) {
        for (var element in items) {
          if (element.key != AppConstants.wallpaperCovers) {
            StorageGetUrlOperation<StorageGetUrlRequest, StorageGetUrlResult> urlOperation = Amplify.Storage.getUrl(key: element.key);
            final StorageGetUrlResult imageUrl = await urlOperation.result;
            if (element.key.toString().contains("-box")) {
              allCategoriesListBoxes.add(CategoryModel(
                key: element.key,
                name: getCategoryNameFromKey(element.key),
                imageUrl: imageUrl.url.toString(),
              ));
            } else {
              allCategoriesListTiles.add(CategoryModel(
                key: element.key,
                name: getCategoryNameFromKey(element.key),
                imageUrl: imageUrl.url.toString(),
              ));
            }
          }
        }
        allCategoriesListBoxes.shuffle();
        allCategoriesListTiles.shuffle();
        initializeRandomPopularList();
        updateLoadingFeed(false);

        notifyListeners();
      } else {
        log('I got Empty Result');
        updateLoadingFeed(false);
      }
    } on StorageException catch (e) {
      log('StorageException Error listing items: $e');
      updateLoadingFeed(false);
    } catch (e) {
      log('Error listing items: $e');
      updateLoadingFeed(false);
    }
  }

  Future<void> getWallpapersListByCategory(String category) async {
    wallpapersListByCategory.clear();
    log('I am coming here with: $category');
    updateLoadingFeed(true);

    try {
      List items = await getAmplifyStorageList(path: category);
      log('Got items getWallpapersListByCategory: ${items.length}');
      if (items.isNotEmpty) {
        for (var element in items) {
          StorageGetUrlOperation<StorageGetUrlRequest, StorageGetUrlResult> urlOperation = Amplify.Storage.getUrl(key: element.key);
          final StorageGetUrlResult imageUrl = await urlOperation.result;
          wallpapersListByCategory.add(WallpaperModel(
            imageKey: element.key,
            imageUrl: imageUrl.url.toString(),
            imageSize: GeneralUtilities.getFileSize(element.size),
          ));
        }
        wallpapersListByCategory.shuffle();
        updateLoadingFeed(false);

        notifyListeners();
      } else {
        log('I got Empty Result');
        updateLoadingFeed(false);
      }
    } on StorageException catch (e) {
      log('StorageException Error listing items: $e');
      updateLoadingFeed(false);
    } catch (e) {
      log('Error listing items: $e');
      updateLoadingFeed(false);
    }
  }

  Future<void> getFeedWallpapers(String fileKey, {bool isSeeAll = false}) async {
    feedThumbnailList.clear();
    updateLoadingFeed(true);
    try {
      List items = await getAmplifyStorageList(path: fileKey);
      if (items.isNotEmpty) {
        List finalItems = items;

        if (!isSeeAll) {
          items.shuffle();
          finalItems = items.take(AppConstants.itemsToShowInHomeFeedWallpapers).toList();
        }
        for (var element in finalItems) {
          // if (feedThumbnailList.length < 50) {
          StorageGetUrlOperation<StorageGetUrlRequest, StorageGetUrlResult> urlOperation = Amplify.Storage.getUrl(key: element.key);
          final StorageGetUrlResult imageUrl = await urlOperation.result;
          feedThumbnailList.add(
            WallpaperModel(
              imageKey: element.key,
              imageUrl: imageUrl.url.toString(),
              imageSize: GeneralUtilities.getFileSize(element.size!),
            ),
          );
          // }
        }
        feedThumbnailList.shuffle();
        updateLoadingFeed(false);
      } else {
        log('I got Empty Result');
        updateLoadingFeed(false);
      }
    } catch (e) {
      log('Error listing items: $e');
      updateLoadingFeed(false);
    }
  }

  String currentImageHdUrl = "";

  updateCurrentImageHdUrl(var value) {
    currentImageHdUrl = value;
    notifyListeners();
  }

  Future<void> getHdImageUrlForFeedAndNavigate({
    required String thumbnailKey,
    required String thumbnailUrl,
    required BuildContext context,
  }) async {
    Navigator.pushNamed(
      context,
      NamedRoute.setWallpaperView,
      arguments: {'wallpaperModel': WallpaperModel(imageUrl: "", thumbnailUrl: thumbnailUrl)},
    );
    log('This is key I got: $thumbnailKey');
    var keyParts = thumbnailKey.split('/');
    if (keyParts.isNotEmpty) {
      try {
        var thumbnailName = keyParts.last;
        var temp = thumbnailName.split('-');
        var mainCategory = "${temp[0]}_categories";
        var subCategory = temp[1];
        var thumbnailNameNew = thumbnailName.replaceAll("${temp[0]}-${temp[1]}-", "");
        var mainImageKey = '$mainCategory/$subCategory/$thumbnailNameNew';
        log('This is key I mainImageKey: $mainImageKey');

        StorageGetUrlOperation<StorageGetUrlRequest, StorageGetUrlResult> urlOperation = Amplify.Storage.getUrl(
          key: mainImageKey,
          options: const StorageGetUrlOptions(
            accessLevel: StorageAccessLevel.guest,
          ),
        );
        final StorageGetUrlResult imageUrl = await urlOperation.result;
        updateCurrentImageHdUrl(imageUrl.url.toString());
      } catch (e) {
        log('Error: $e');
        Navigator.pop(context);
        UserIntimationComponents.showToast("Some Error Occurred!!");
      }
    } else {
      Navigator.pop(context);
      UserIntimationComponents.showToast("Some Error Occurred!!");
    }
  }

  Future<void> getRecommendedWallpapersList(String fileKey, {bool isSeeAll = false}) async {
    recommendedWallpapersList.clear();
    try {
      List items = await getAmplifyStorageList(path: fileKey);
      if (items.isNotEmpty) {
        items.shuffle();
        List finalItems = items;

        if (!isSeeAll) {
          items.shuffle();
          finalItems = items.take(AppConstants.itemsToShowInRecommendedWallpapers).toList();
        } else {
          items.shuffle();
          finalItems = items.take(AppConstants.itemsToShowInRecommendedWallpapersSeeAll).toList();
        }

        for (var element in finalItems) {
          StorageGetUrlOperation<StorageGetUrlRequest, StorageGetUrlResult> urlOperation = Amplify.Storage.getUrl(key: element.key);
          final StorageGetUrlResult imageUrl = await urlOperation.result;
          recommendedWallpapersList.add(WallpaperModel(
            imageKey: element.key,
            imageUrl: imageUrl.url.toString(),
            imageSize: GeneralUtilities.getFileSize(element.size),
          ));
        }
        notifyListeners();
      }
    } on StorageException catch (e) {
      log('Error listing items: $e');
    }
  }

  void onSearchUpdated({required String query}) {
    if (query.isEmpty) {
      searchResultCategories.clear();
      notifyListeners();
      return;
    }
    searchResultCategories = (allCategoriesListBoxes.where((category) => category.name.toLowerCase().contains(query.toLowerCase())).toList());
    log("length: ${searchResultCategories.length} with $query");
    notifyListeners();
  }

  void initializePopularSearchList() {
    popularSearchesList.clear();
    for (var value in allCategoriesListBoxes) {
      if (popularSearchesList.length >= 5) {
        break;
      }
      var searchListItem = allCategoriesListBoxes[math.Random().nextInt(allCategoriesListBoxes.length)];
      if (!isAlreadyPresentInList(popularSearchesList, searchListItem)) {
        popularSearchesList.add(searchListItem);
      }
      notifyListeners();
    }
  }

  String getTileUrl(CategoryModel categoryModel) {
    int index = allCategoriesListTiles.indexWhere((element) => element.name == categoryModel.name);

    if (index == -1) {
      return "";
    }

    return allCategoriesListTiles[index].tileUrl;
  }

  void initializeRandomPopularList() {
    randomPopularListBoxes.clear();
    randomPopularListTiles.clear();
    notifyListeners();

    for (var value in allCategoriesListBoxes) {
      if (randomPopularListBoxes.length >= AppConstants.noOfCategoriesToShow) {
        break;
      }
      var popularListItemBox = allCategoriesListBoxes[math.Random().nextInt(allCategoriesListBoxes.length)];
      if (!isAlreadyPresentInList(randomPopularListBoxes, popularListItemBox)) {
        randomPopularListBoxes.add(popularListItemBox);
      }
      notifyListeners();
    }
    for (var value in allCategoriesListTiles) {
      if (randomPopularListTiles.length >= AppConstants.noOfCategoriesToShow) {
        break;
      }
      var popularListItemTile = allCategoriesListTiles[math.Random().nextInt(allCategoriesListTiles.length)];
      if (!isAlreadyPresentInList(randomPopularListTiles, popularListItemTile)) {
        randomPopularListTiles.add(popularListItemTile);
      }
      notifyListeners();
    }
  }

  // void initializeRandomRecommendedList() {
  //   for (var value in AppConstants.recommendedCategoryList) {
  //     if (randomRecommendedList.length >= 10) {
  //       break;
  //     }
  //     var listItem = AppConstants.recommendedCategoryList[math.Random().nextInt(AppConstants.recommendedCategoryList.length)];
  //     if (!isAlreadyPresentInList(randomRecommendedList, listItem)) {
  //       randomRecommendedList.add(listItem);
  //     }
  //   }
  // }

  bool isAlreadyPresentInList(List<CategoryModel> list, CategoryModel category) {
    for (var value in list) {
      // log('I am matching in : ${value.name} and ${category.name}');
      if (value.name == category.name) {
        return true;
      }
    }
    return false;
  }

  Future<void> addWallpaperToFavourites({required WallpaperModel wallpaperModel, required bool isForDownloads}) async {
    final cacheRepo = locator.get<CacheRepo>();
    final resultEither = await cacheRepo.getFavoriteWallpapers(isForDownloads: isForDownloads);

    if (resultEither.isRight()) {
      String? allFavWallpapers = resultEither.getOrElse(() => "");
      if (!isAlreadyThere(wallpaperUrl: wallpaperModel.imageUrl.trim(), allWallpapers: allFavWallpapers)) {
        allFavWallpapers = allFavWallpapers + wallpaperModel.imageUrl.trim() + AppConstants.cacheSplitter;
        await cacheRepo.addFavoriteWallpaper(imageUrl: allFavWallpapers, isForDownloads: isForDownloads);
      }
      UserIntimationComponents.showToast("Wallpaper has been added to My ${isForDownloads ? "Downloads" : "Favorites"}.");
    }
  }

  bool isAlreadyThere({required String wallpaperUrl, required String allWallpapers}) {
    bool isThere = false;
    final list = allWallpapers.split(AppConstants.cacheSplitter);
    int index = list.indexWhere((element) => element == wallpaperUrl);
    if (index != -1) {
      isThere = true;
    }
    return isThere;
  }

  final List<String> favoriteWallpapers = [];

  void removeFavoriteWallpaper({required int index, required bool isForDownloads}) async {
    final cacheRepo = locator.get<CacheRepo>();
    final resultEither = await cacheRepo.addFavoriteWallpaper(imageUrl: "", isForDownloads: isForDownloads);
    favoriteWallpapers.removeAt(index);

    notifyListeners();
    String wallpapersList = "";
    if (resultEither.isRight()) {
      for (var element in favoriteWallpapers) {
        wallpapersList = wallpapersList + element + AppConstants.cacheSplitter;
      }
    }
    log("final wallpapers list: $wallpapersList");
    await cacheRepo.addFavoriteWallpaper(imageUrl: wallpapersList, isForDownloads: isForDownloads);
  }

  // Future<void> resetWallppaers() async {
  //   final cacheRepo = locator.get<CacheRepo>();
  //   final resultEither = await cacheRepo.addFavoriteWallpaper(imageUrl: "");
  // }

  Future<void> getFavoriteWallpapers({required bool isForDownloads}) async {
    favoriteWallpapers.clear();
    notifyListeners();
    final cacheRepo = locator.get<CacheRepo>();
    final resultEither = await cacheRepo.getFavoriteWallpapers(isForDownloads: isForDownloads);

    if (resultEither.isRight()) {
      String? allFavWallpapers = resultEither.getOrElse(() => "");

      if (allFavWallpapers.isNotEmpty) {
        final list = allFavWallpapers.split(AppConstants.cacheSplitter).toList();

        list.removeWhere((element) => element == "");

        favoriteWallpapers.addAll(list);
        notifyListeners();
      }
    }
  }

  bool isFromDownloads = false;

  void updateIsFromDownloads(var value) {
    isFromDownloads = value;
    notifyListeners();
  }

  Future<bool> checkIfFavoriteWallpaper({required String imageUrl}) async {
    await getFavoriteWallpapers(isForDownloads: false);

    int index = favoriteWallpapers.indexWhere((element) => element == imageUrl);

    return index != -1;
  }

  int getWallpaperListIndex({required String imageUrl}) {
    int index = favoriteWallpapers.indexWhere((element) => element == imageUrl);
    return index;
  }
}
