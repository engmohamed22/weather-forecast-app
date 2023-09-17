import 'package:dartz/dartz.dart';
import 'package:forecast_app/src/core/error/failure.dart';
import 'package:forecast_app/src/modules/home/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> fetchCurrentWeather({
    required double lat,
    required double lon,
  });

  Future<Either<Failure, WeatherEntity>> fetchCurrentWeatherByCityName({
    required String cityName,
  });
}
