import 'package:awesome_wallpapers/repositories/cache_repo.dart';
import 'package:awesome_wallpapers/services/authentication_service.dart';
import 'package:awesome_wallpapers/services/cache_service.dart';
import 'package:awesome_wallpapers/services/logger_service.dart';
import 'package:awesome_wallpapers/services/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //Third Party Services
  locator.registerSingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());

  //Registering Services
  locator.registerLazySingleton<AuthService>(() => AuthServiceImp());
  locator.registerLazySingleton<CacheService>(() => CacheServiceImp(preferences: locator<SharedPreferences>()));
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<LoggerService>(() => LoggerServiceImp());

  //Registering Repositories
  locator.registerLazySingleton<CacheRepo>(() => CacheRepoImp(loggerService: locator(), cacheService: locator()));
}
