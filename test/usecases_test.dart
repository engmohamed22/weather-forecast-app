import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecast_app/src/core/error/failure.dart';
import 'package:forecast_app/src/core/usecase/usecase.dart';
import 'package:forecast_app/src/modules/home/domain/entities/weather_entity.dart'; // Import the entities and repositories used in your use cases
import 'package:forecast_app/src/modules/home/domain/repository/weather_repository.dart';
import 'package:forecast_app/src/modules/home/domain/usecases/weather_usecae.dart'; // Import Failure classes
import 'package:mockito/mockito.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetWeatherLatLon useCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    useCase = GetWeatherLatLon(weatherRepository: mockWeatherRepository);
  });

  // Define test cases
  test(
      'should get weather for a given latitude and longitude from the repository',
      () async {
    // Arrange
    const latLon = LatLon(lat: 42.0, lon: 23.0);
    const coord = CoordEntity(lon: 1.0, lat: 2.0);
    const weatherDetail = WeatherDetailEntity(
        id: 1, main: 'Sunny', description: 'Clear sky', icon: '01d');
    final weather = [weatherDetail];
    const main = MainEntity(
        temp: 25.0,
        feelsLike: 26.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1010,
        humidity: 50,
        seaLevel: 1010,
        grndLevel: 1000);
    const wind = WindEntity(speed: 5.0, deg: 90, gust: 8.0);
    const rain = RainEntity(the1H: 0.5);
    const clouds = CloudsEntity(all: 10);
    const sys = SysEntity(
        type: 1,
        id: 123,
        country: 'US',
        sunrise: 1632895367,
        sunset: 1632938713);

    final weatherEntity = WeatherEntity(
      coord: coord,
      weather: weather,
      base: 'stations',
      main: main,
      visibility: 10000,
      wind: wind,
      rain: rain,
      clouds: clouds,
      dt: 1632919200,
      sys: sys,
      timezone: -14400,
      id: 5128581,
      name: 'New York',
      cod: 200,
    );

    // Mock the repository's behavior
    when(mockWeatherRepository.fetchCurrentWeather(
            lat: latLon.lat, lon: latLon.lon))
        .thenAnswer((_) async => Right(weatherEntity));

    // Act
    final result = await useCase(latLon);

    // Assert
    expect(result,
        Right(weatherEntity)); // Use Either's Right to assert for success
    verify(mockWeatherRepository.fetchCurrentWeather(
        lat: latLon.lat, lon: latLon.lon));
    verifyNoMoreInteractions(mockWeatherRepository);
  });

  test('should return a failure when an exception is thrown', () async {
    // Arrange
    const latLon = LatLon(lat: 42.0, lon: 23.0);

    // Mock the repository to throw an exception
    when(mockWeatherRepository.fetchCurrentWeather(
            lat: latLon.lat, lon: latLon.lon))
        .thenAnswer(
            (_) async => const Left(ServerFailure(message: 'Error message')));

    // Act
    final result = await useCase(latLon);

    // Assert
    expect(result, const Left(ServerFailure(message: 'Error message')));
    verify(mockWeatherRepository.fetchCurrentWeather(
        lat: latLon.lat, lon: latLon.lon));
    verifyNoMoreInteractions(mockWeatherRepository);
  });
}
