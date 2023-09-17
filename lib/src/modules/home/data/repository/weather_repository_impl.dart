import 'package:dartz/dartz.dart';
import 'package:forecast_app/src/core/error/exception.dart';
import 'package:forecast_app/src/core/error/failure.dart';
import 'package:forecast_app/src/core/utils/app_strings.dart';
import 'package:forecast_app/src/modules/home/domain/entities/weather_entity.dart';
import 'package:forecast_app/src/modules/home/domain/repository/weather_repository.dart';

import '../datasource/weather_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherWebServices apiProvider;

  WeatherRepositoryImpl({required this.apiProvider});

  @override
  Future<Either<Failure, WeatherEntity>> fetchCurrentWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      final response =
          await apiProvider.getMainWeatherByLatLon(lat: lat, lon: lon);
      return Right(response);
    } on NoInternetConnectionException catch (_) {
      return const Left(
          ServerFailure(message: AppStrings.noInternetConnection));
    } on InternalServerErrorException catch (_) {
      return const Left(ServerFailure(message: AppStrings.internalServerError));
    } on FormatException catch (_) {
      return const Left(
          ServerFailure(message: AppStrings.errorOccurredDuringReadingData));
    } catch (exception) {
      return const Left(ServerFailure(message: AppStrings.somethingWentWrong));
    }
  }

  @override
  Future<Either<Failure, WeatherEntity>> fetchCurrentWeatherByCityName({
    required String cityName,
  }) async {
    try {
      final response = await apiProvider.getMainWeatherByCityName(
        cityName: cityName,
      );
      return Right(response);
    } on NoInternetConnectionException catch (_) {
      return const Left(
          ServerFailure(message: AppStrings.noInternetConnection));
    } on InternalServerErrorException catch (_) {
      return const Left(ServerFailure(message: AppStrings.internalServerError));
    } on FormatException catch (_) {
      return const Left(
          ServerFailure(message: AppStrings.errorOccurredDuringReadingData));
    } catch (exception) {
      return const Left(ServerFailure(message: AppStrings.somethingWentWrong));
    }
  }
}
