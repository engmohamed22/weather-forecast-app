import 'package:dartz/dartz.dart';
import 'package:forecast_app/src/core/error/failure.dart';
import 'package:forecast_app/src/core/usecase/usecase.dart';
import 'package:forecast_app/src/modules/home/domain/entities/foercast_entity.dart';
import 'package:forecast_app/src/modules/home/domain/repository/forecast_repository.dart';

class GetForecastLatLon implements UseCase<ForecastEntity, LatLon> {
  final ForecastRepository forecastRepository;

  GetForecastLatLon({required this.forecastRepository});

  @override
  Future<Either<Failure, ForecastEntity>> call(LatLon latLon) async {
    try {
      var result = await forecastRepository.fetchForecastLatLon(
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

class GetForecastCityName implements UseCase<ForecastEntity, CityName> {
  final ForecastRepository forecastRepository;

  GetForecastCityName({required this.forecastRepository});

  @override
  Future<Either<Failure, ForecastEntity>> call(CityName cityName) async {
    try {
      var result = await forecastRepository.fetchForecastByCityName(
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
