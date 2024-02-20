import 'package:awesome_wallpapers/constants/cache_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheService {
  Future<void> addFavoriteWallpaper({required String imageUrl, required bool isForDownloads});

  Future<String> getFavoriteWallpapers({required bool isForDownloads});

  Future<void> addDownloadedWallpaper({required String imageUrl});

  Future<String> getDownloadedWallpapers();
}

class CacheServiceImp implements CacheService {
  SharedPreferences preferences;

  CacheServiceImp({required this.preferences});

  @override
  Future<void> addFavoriteWallpaper({required String imageUrl, required bool isForDownloads}) async {
    preferences.setString(isForDownloads ? CacheConstants.downloadedWallpapers : CacheConstants.favWallpapers, imageUrl);
  }

  @override
  Future<String> getFavoriteWallpapers({required bool isForDownloads}) async {
    if (preferences.containsKey(isForDownloads ? CacheConstants.downloadedWallpapers : CacheConstants.favWallpapers)) {
      return preferences.getString(isForDownloads ? CacheConstants.downloadedWallpapers : CacheConstants.favWallpapers) ?? "";
    }
    return "";
  }

  @override
  Future<void> addDownloadedWallpaper({required String imageUrl}) async {
    preferences.setString(CacheConstants.favWallpapers, imageUrl);
  }

  @override
  Future<String> getDownloadedWallpapers() async {
    if (preferences.containsKey(CacheConstants.favWallpapers)) {
      return preferences.getString(CacheConstants.favWallpapers) ?? "";
    }
    return "";
  }
}
