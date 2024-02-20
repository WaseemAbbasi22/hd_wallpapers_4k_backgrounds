import 'package:awesome_wallpapers/services/cache_service.dart';
import 'package:awesome_wallpapers/services/logger_service.dart';
import 'package:awesome_wallpapers/utilities/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CacheRepo {
  Future<Either<Failure, void>> addFavoriteWallpaper({required String imageUrl, required bool isForDownloads});

  Future<Either<Failure, String>> getFavoriteWallpapers({required bool isForDownloads});

  Future<Either<Failure, void>> addDownloadedWallpaper({required String imageUrl});

  Future<Either<Failure, String>> getDownloadedWallpapers();
}

class CacheRepoImp implements CacheRepo {
  final CacheService cacheService;
  final LoggerService loggerService;

  CacheRepoImp({required this.cacheService, required this.loggerService});

  @override
  Future<Either<Failure, String>> getFavoriteWallpapers({required bool isForDownloads}) async {
    try {
      return Right(await cacheService.getFavoriteWallpapers(isForDownloads: isForDownloads));
    } on Exception catch (e) {
      loggerService.errorLogs(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavoriteWallpaper({required String imageUrl, required bool isForDownloads}) async {
    try {
      return Right(await cacheService.addFavoriteWallpaper(imageUrl: imageUrl, isForDownloads: isForDownloads));
    } on Exception catch (e) {
      loggerService.errorLogs(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getDownloadedWallpapers() async {
    try {
      return Right(await cacheService.getDownloadedWallpapers());
    } on Exception catch (e) {
      loggerService.errorLogs(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addDownloadedWallpaper({required String imageUrl}) async {
    try {
      return Right(await cacheService.addDownloadedWallpaper(imageUrl: imageUrl));
    } on Exception catch (e) {
      loggerService.errorLogs(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
