import 'dart:developer';
import 'dart:math' as math;

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:awesome_wallpapers/constants/app_constants.dart';
import 'package:awesome_wallpapers/models/category_model.dart';
import 'package:awesome_wallpapers/models/wallpaper_model.dart';
import 'package:awesome_wallpapers/routes/routes.dart';
import 'package:awesome_wallpapers/utilities/general.dart';
import 'package:awesome_wallpapers/views/common_components/user_intimation_components.dart';
import 'package:flutter/cupertino.dart';

class HomeVM extends ChangeNotifier {
  List<WallpaperModel> recommendedWallpapersList = [];

  List<WallpaperModel> feedThumbnailList = [];

  List<CategoryModel> randomPopularList = [];

  List<CategoryModel> randomRecommendedList = [];

  bool _isFeedLoading = true;

  get isFeedLoading => _isFeedLoading;

  updateLoadingFeed(bool value) {
    _isFeedLoading = value;
    notifyListeners();
  }

  List<WallpaperModel> recommendedImagesList = [];

  List<WallpaperModel> wallpapersListByCategory = [];

  Future<List<StorageItem>> getAmplifyStorageList({required String path}) async {
    final StorageListOperation<StorageListRequest, StorageListResult<StorageItem>> result = Amplify.Storage.list(path: path);
    final StorageListResult<StorageItem> itemsList = await result.result;
    return itemsList.items;
  }

  Future<void> getWallpapersListByCategory(String category) async {
    wallpapersListByCategory.clear();
    log('I am coming here with: $category');
    updateLoadingFeed(true);

    try {
      List items = await getAmplifyStorageList(path: category);
      log('Got items: ${items.length}');
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
    log('I am coming here with getFeedWallpapers: $fileKey');
    updateLoadingFeed(true);
    try {
      List items = await getAmplifyStorageList(path: fileKey);
      log('Got items: ${items.length}');
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

  Future<void> getHdImageUrlForFeedAndNavigate({required String thumbnailKey, required BuildContext context}) async {
    UserIntimationComponents.getLoader(context);
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

        StorageGetUrlOperation<StorageGetUrlRequest, StorageGetUrlResult> urlOperation = Amplify.Storage.getUrl(
            key: mainImageKey,
            options: const StorageGetUrlOptions(
              accessLevel: StorageAccessLevel.guest,
            ));
        final StorageGetUrlResult imageUrl = await urlOperation.result;

        await Future.delayed(const Duration(seconds: 1)).whenComplete(
          () => Navigator.pushReplacementNamed(
            context,
            NamedRoute.setWallpaperView,
            arguments: {'wallpaperModel': WallpaperModel(imageUrl: imageUrl.url.toString())},
          ),
        );
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
        log('I am item info in getRecommendedWallpapersList: ${finalItems.first.key}');

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

  void initializeRandomPopularList() {
    for (var value in AppConstants.popularCategoryList) {
      if (randomPopularList.length >= 7) {
        break;
      }
      var listItem = AppConstants.popularCategoryList[math.Random().nextInt(AppConstants.popularCategoryList.length)];
      if (!isAlreadyPresentInList(randomPopularList, listItem)) {
        randomPopularList.add(listItem);
      }
    }
  }

  void initializeRandomRecommendedList() {
    for (var value in AppConstants.recommendedCategoryList) {
      if (randomRecommendedList.length >= 8) {
        break;
      }
      var listItem = AppConstants.recommendedCategoryList[math.Random().nextInt(AppConstants.recommendedCategoryList.length)];
      if (!isAlreadyPresentInList(randomRecommendedList, listItem)) {
        randomRecommendedList.add(listItem);
      }
    }
  }

  bool isAlreadyPresentInList(List<CategoryModel> list, CategoryModel category) {
    for (var value in list) {
      log('I am matching in : ${value.name} and ${category.name}');
      if (value.name == category.name) {
        return true;
      }
    }
    return false;
  }
}
