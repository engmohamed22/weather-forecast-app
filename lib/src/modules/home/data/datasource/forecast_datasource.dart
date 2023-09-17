import 'package:flutter/material.dart';
import 'package:forecast_app/src/config/datasource/web_services/web_services.dart';
import 'package:forecast_app/src/core/utils/app_strings.dart';
import 'package:forecast_app/src/modules/home/data/models/forecast_model.dart';
import 'package:forecast_app/src/modules/home/domain/entities/foercast_entity.dart';

abstract class ForecastWebServices {
  Future<ForecastEntity> getMainForecastByLatLon({
    required double lat,
    required double lon,
  });

  Future<ForecastEntity> getMainForecastByCityName({
    required String cityName,
  });
}

class ForecastWebServicesImpl implements ForecastWebServices {
  final WebServices webServices;

  ForecastWebServicesImpl({required this.webServices});
  @override
  Future<ForecastEntity> getMainForecastByLatLon({
    required double lat,
    required double lon,
  }) async {
    final response = await webServices.dio.get(
      AppStrings.paramsForecastByLatLonEndPint(lat, lon),
    );
    if (response.statusCode == 200) {
      try {
        final responseData = response.data;
        debugPrint(
            'API request success with status code ${response.statusCode}');
        final searchResults = Forecast.fromJson(responseData);
        return searchResults;
      } catch (e, s) {
        debugPrint('e is $e \ns is $s');
        return Future.error(e);
      }
    } else {
      debugPrint('API request failed with status code ${response.statusCode}');
      return Future.error(
        'API request failed with status code ${response.statusCode}',
      );
    }
  }

  @override
  Future<ForecastEntity> getMainForecastByCityName({
    required String cityName,
  }) async {
    final response = await webServices.dio.get(
      AppStrings.paramsForecastByCityNameEndPint(cityName),
    );
    if (response.statusCode == 200) {
      try {
        final responseData = response.data;
        debugPrint(
            'API request success with status code ${response.statusCode}');
        final searchResults = Forecast.fromJson(responseData);
        return searchResults;
      } catch (e, s) {
        debugPrint('e is $e \ns is $s');
        return Future.error(e);
      }
    } else {
      debugPrint('API request failed with status code ${response.statusCode}');
      return Future.error(
        'API request failed with status code ${response.statusCode}',
      );
    }
  }
}
