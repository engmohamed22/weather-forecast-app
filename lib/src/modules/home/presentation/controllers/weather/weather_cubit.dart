import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forecast_app/src/core/commons/getCurrentLocation.dart';
import 'package:forecast_app/src/core/usecase/usecase.dart';
import 'package:forecast_app/src/modules/home/domain/entities/weather_entity.dart';
import 'package:forecast_app/src/modules/home/domain/usecases/weather_usecae.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherLatLon getWeatherLatLon;
  final GetWeatherCityName getWeatherCityName;

  WeatherCubit(
      {required this.getWeatherLatLon, required this.getWeatherCityName})
      : super(WeatherInitial());

  // Add the search method
  Future<void> getWeatherByLatLon({
    required double lat,
    required double lon,
  }) async {
    emit(WeatherLoading());
    try {
      final response = await getWeatherLatLon.call(LatLon(lat: lat, lon: lon));
      emit(response.fold((failure) => WeatherError(message: failure.message!),
          (success) => WeatherLoaded(result: success)));
    } catch (e, s) {
      debugPrint('e is $e\ns is $s');
      emit(WeatherError(message: e.toString()));
    }
  }

  Future<void> getCurrentWeather() async {
    emit(WeatherLoading());
    try {
      final position = await Helper.getCurrentLocation();
      final response = await getWeatherLatLon
          .call(LatLon(lat: position.latitude, lon: position.longitude));
      emit(response.fold((failure) => WeatherError(message: failure.message!),
          (success) => WeatherLoaded(result: success)));
    } catch (e, s) {
      debugPrint('e is $e\ns is $s');
      emit(WeatherError(message: e.toString()));
    }
  }

  Future<void> getWeatherByCityName({
    required String cityName,
  }) async {
    emit(WeatherLoading());
    try {
      final response =
          await getWeatherCityName.call(CityName(cityName: cityName));
      emit(response.fold((failure) => WeatherError(message: failure.message!),
          (success) => WeatherLoaded(result: success)));
    } catch (e, s) {
      debugPrint('e is $e\ns is $s');
      emit(WeatherError(message: e.toString()));
    }
  }
}
