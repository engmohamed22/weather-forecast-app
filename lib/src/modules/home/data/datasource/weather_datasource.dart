import 'package:flutter/material.dart';
import 'package:forecast_app/src/config/datasource/web_services/web_services.dart';
import 'package:forecast_app/src/core/utils/app_strings.dart';
import 'package:forecast_app/src/modules/home/data/models/weather_model.dart';

import '../../domain/entities/weather_entity.dart';

abstract class WeatherWebServices {
  Future<WeatherEntity> getMainWeatherByLatLon({
    required double lat,
    required double lon,
  });
  Future<WeatherEntity> getMainWeatherByCityName({
    required String cityName,
  });
}

class WeatherWebServicesImpl implements WeatherWebServices {
  final WebServices webServices;

  WeatherWebServicesImpl({required this.webServices});
  @override
  Future<WeatherEntity> getMainWeatherByLatLon({
    required double lat,
    required double lon,
  }) async {
    final response = await webServices.dio.get(
      AppStrings.paramsWeatherByLatLonEndPint(lat, lon),
    );
    if (response.statusCode == 200) {
      try {
        final responseData = response.data;
        debugPrint(
            'API request success with status code ${response.statusCode}');
        final searchResults = WeatherModel.fromJson(responseData);
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
  Future<WeatherEntity> getMainWeatherByCityName({
    required String cityName,
  }) async {
    final response = await webServices.dio.get(
      AppStrings.paramsWeatherByCityNameEndPint(cityName),
    );
    if (response.statusCode == 200) {
      try {
        final responseData = response.data;
        debugPrint(
            'API request success with status code ${response.statusCode}');
        final searchResults = WeatherModel.fromJson(responseData);
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
