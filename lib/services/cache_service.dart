import 'package:awesome_wallpapers/constants/cache_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheService {
  Future<void> setUserId({required String userId});

  Future<String?> getUserId();
}

class CacheServiceImp implements CacheService {
  SharedPreferences preferences;

  CacheServiceImp({required this.preferences});

  @override
  Future<void> setUserId({required String userId}) async {
    preferences.setString(CacheConstants.userId, userId);
  }

  @override
  Future<String?> getUserId() async {
    if (preferences.containsKey(CacheConstants.userId)) {
      return preferences.getString(CacheConstants.userId);
    }
    return null;
  }
}
