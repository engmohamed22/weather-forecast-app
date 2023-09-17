import 'package:dartz/dartz.dart';
import 'package:forecast_app/src/core/error/failure.dart';
import 'package:forecast_app/src/core/usecase/usecase.dart';
import 'package:forecast_app/src/modules/home/domain/entities/weather_entity.dart';
import 'package:forecast_app/src/modules/home/domain/repository/weather_repository.dart';

class GetWeatherLatLon implements UseCase<WeatherEntity, LatLon> {
  final WeatherRepository weatherRepository;
  GetWeatherLatLon({required this.weatherRepository});

  @override
  Future<Either<Failure, WeatherEntity>> call(LatLon latLon) async {
    try {
      var result = await weatherRepository.fetchCurrentWeather(
        lat: latLon.lat,
        lon: latLon.lon,
      );

      return result.fold(
        (failure) => Left(failure),
        (success) => Right(success),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

class GetWeatherCityName implements UseCase<WeatherEntity, CityName> {
  final WeatherRepository weatherRepository;
  GetWeatherCityName({required this.weatherRepository});

  @override
  Future<Either<Failure, WeatherEntity>> call(CityName cityName) async {
    try {
      var result = await weatherRepository.fetchCurrentWeatherByCityName(
        cityName: cityName.cityName,
      );

      return result.fold(
        (failure) => Left(failure),
        (success) => Right(success),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
