import 'package:forecast_app/src/config/datasource/web_services/web_services.dart';
import 'package:forecast_app/src/modules/home/data/datasource/forecast_datasource.dart';
import 'package:forecast_app/src/modules/home/data/datasource/weather_datasource.dart';
import 'package:forecast_app/src/modules/home/data/repository/forecast_repository_impl.dart';
import 'package:forecast_app/src/modules/home/data/repository/weather_repository_impl.dart';
import 'package:forecast_app/src/modules/home/domain/repository/forecast_repository.dart';
import 'package:forecast_app/src/modules/home/domain/repository/weather_repository.dart';
import 'package:forecast_app/src/modules/home/domain/usecases/forecast_usecase.dart';
import 'package:forecast_app/src/modules/home/domain/usecases/weather_usecae.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/favourite_locations/favourite_cubit.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/forecast/forecast_cubit.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/weather/weather_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // register services
  sl.registerLazySingleton<WebServices>(() => WebServices());

  sl.registerLazySingleton<ForecastWebServices>(
      () => ForecastWebServicesImpl(webServices: sl()));
  sl.registerLazySingleton<WeatherWebServices>(
      () => WeatherWebServicesImpl(webServices: sl()));

  // Use cases
  sl.registerLazySingleton<GetWeatherLatLon>(
      () => GetWeatherLatLon(weatherRepository: sl()));
  sl.registerLazySingleton<GetWeatherCityName>(
      () => GetWeatherCityName(weatherRepository: sl()));

  sl.registerLazySingleton<GetForecastLatLon>(
      () => GetForecastLatLon(forecastRepository: sl()));
  sl.registerLazySingleton<GetForecastCityName>(
      () => GetForecastCityName(forecastRepository: sl()));

  // register repositories
  sl.registerLazySingleton<ForecastRepository>(
      () => ForecastRepositoryImpl(apiProvider: sl()));
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(apiProvider: sl()));

  // register blocs
  sl.registerFactory<ForecastCubit>(
      () => ForecastCubit(getForecastLatLon: sl(), getForecastCityName: sl()));
  sl.registerFactory<WeatherCubit>(
      () => WeatherCubit(getWeatherLatLon: sl(), getWeatherCityName: sl()));
  sl.registerFactory<FavouriteCubit>(
    () => FavouriteCubit(),
  );
}
