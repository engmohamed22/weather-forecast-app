import 'package:dartz/dartz.dart';
import 'package:forecast_app/src/core/error/failure.dart';
import 'package:forecast_app/src/modules/home/domain/entities/foercast_entity.dart';

abstract class ForecastRepository {
  Future<Either<Failure, ForecastEntity>> fetchForecastLatLon({
    required double lat,
    required double lon,
  });

  Future<Either<Failure, ForecastEntity>> fetchForecastByCityName({
    required String cityName,
  });
}
