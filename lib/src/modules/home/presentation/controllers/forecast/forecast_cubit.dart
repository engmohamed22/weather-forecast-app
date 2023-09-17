import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forecast_app/src/core/commons/getCurrentLocation.dart';
import 'package:forecast_app/src/core/usecase/usecase.dart';
import 'package:forecast_app/src/modules/home/domain/entities/foercast_entity.dart';
import 'package:forecast_app/src/modules/home/domain/usecases/forecast_usecase.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final GetForecastLatLon getForecastLatLon;
  final GetForecastCityName getForecastCityName;

  ForecastCubit(
      {required this.getForecastLatLon, required this.getForecastCityName})
      : super(ForecastInitial());

  Future<void> getForecastByLatLon({
    required double lat,
    required double lon,
  }) async {
    emit(ForecastLoading());
    try {
      final response = await getForecastLatLon.call(LatLon(lat: lat, lon: lon));
      emit(response.fold((failure) => ForecastError(message: failure.message!),
          (success) => ForecastLoaded(result: success)));
    } catch (e, s) {
      debugPrint('e is $e\ns is $s');
      emit(ForecastError(message: e.toString()));
    }
  }

  Future<void> getCurrentForecast() async {
    emit(ForecastLoading());
    try {
      final position = await Helper.getCurrentLocation();
      final response = await getForecastLatLon
          .call(LatLon(lat: position.latitude, lon: position.longitude));
      emit(response.fold((failure) => ForecastError(message: failure.message!),
          (success) => ForecastLoaded(result: success)));
    } catch (e, s) {
      debugPrint('e is $e\ns is $s');
      emit(ForecastError(message: e.toString()));
    }
  }

  Future<void> getForecastByCityName({
    required String cityName,
  }) async {
    emit(ForecastLoading());
    try {
      final response =
          await getForecastCityName.call(CityName(cityName: cityName));
      emit(response.fold((failure) => ForecastError(message: failure.message!),
          (success) => ForecastLoaded(result: success)));
    } catch (e, s) {
      debugPrint('e is $e\ns is $s');
      emit(ForecastError(message: e.toString()));
    }
  }
}
