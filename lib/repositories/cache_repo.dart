import 'package:awesome_wallpapers/services/cache_service.dart';
import 'package:awesome_wallpapers/services/logger_service.dart';
import 'package:awesome_wallpapers/utilities/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CacheRepo {
  Future<Either<Failure, void>> setUserId(String userId);
}

class CacheRepoImp implements CacheRepo {
  final CacheService cacheService;
  final LoggerService loggerService;

  CacheRepoImp({required this.cacheService, required this.loggerService});

  @override
  Future<Either<Failure, void>> setUserId(String userId) async {
    try {
      return Right(await cacheService.setUserId(userId: userId));
    } on Exception catch (e) {
      loggerService.errorLogs(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
