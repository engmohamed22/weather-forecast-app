import 'package:forecast_app/src/modules/home/domain/entities/weather_entity.dart';
import 'package:test/test.dart';

void main() {
  group('WeatherEntity', () {
    test('should create a WeatherEntity', () {
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

      expect(weatherEntity, isA<WeatherEntity>());
      expect(weatherEntity.coord, equals(coord));
      expect(weatherEntity.weather, equals(weather));
      expect(weatherEntity.base, equals('stations'));
      expect(weatherEntity.main, equals(main));
      expect(weatherEntity.visibility, equals(10000));
      expect(weatherEntity.wind, equals(wind));
      expect(weatherEntity.rain, equals(rain));
      expect(weatherEntity.clouds, equals(clouds));
      expect(weatherEntity.dt, equals(1632919200));
      expect(weatherEntity.sys, equals(sys));
      expect(weatherEntity.timezone, equals(-14400));
      expect(weatherEntity.id, equals(5128581));
      expect(weatherEntity.name, equals('New York'));
      expect(weatherEntity.cod, equals(200));
    });

    test('should be equatable', () {
      const weatherEntity1 = WeatherEntity(
        coord: CoordEntity(lon: 1.0, lat: 2.0),
        weather: [
          WeatherDetailEntity(
              id: 1, main: 'Sunny', description: 'Clear sky', icon: '01d')
        ],
        base: 'stations',
        main: MainEntity(
            temp: 25.0,
            feelsLike: 26.0,
            tempMin: 20.0,
            tempMax: 30.0,
            pressure: 1010,
            humidity: 50,
            seaLevel: 1010,
            grndLevel: 1000),
        visibility: 10000,
        wind: WindEntity(speed: 5.0, deg: 90, gust: 8.0),
        rain: RainEntity(the1H: 0.5),
        clouds: CloudsEntity(all: 10),
        dt: 1632919200,
        sys: SysEntity(
            type: 1,
            id: 123,
            country: 'US',
            sunrise: 1632895367,
            sunset: 1632938713),
        timezone: -14400,
        id: 5128581,
        name: 'New York',
        cod: 200,
      );

      const weatherEntity2 = WeatherEntity(
        coord: CoordEntity(lon: 1.0, lat: 2.0),
        weather: [
          WeatherDetailEntity(
              id: 1, main: 'Sunny', description: 'Clear sky', icon: '01d')
        ],
        base: 'stations',
        main: MainEntity(
            temp: 25.0,
            feelsLike: 26.0,
            tempMin: 20.0,
            tempMax: 30.0,
            pressure: 1010,
            humidity: 50,
            seaLevel: 1010,
            grndLevel: 1000),
        visibility: 10000,
        wind: WindEntity(speed: 5.0, deg: 90, gust: 8.0),
        rain: RainEntity(the1H: 0.5),
        clouds: CloudsEntity(all: 10),
        dt: 1632919200,
        sys: SysEntity(
            type: 1,
            id: 123,
            country: 'US',
            sunrise: 1632895367,
            sunset: 1632938713),
        timezone: -14400,
        id: 5128581,
        name: 'New York',
        cod: 200,
      );

      const weatherEntity3 = WeatherEntity(
        coord: CoordEntity(lon: 2.0, lat: 3.0),
        weather: [
          WeatherDetailEntity(
              id: 2, main: 'Cloudy', description: 'Partly cloudy', icon: '02d')
        ],
        base: 'stations',
        main: MainEntity(
            temp: 20.0,
            feelsLike: 21.0,
            tempMin: 15.0,
            tempMax: 25.0,
            pressure: 1015,
            humidity: 55,
            seaLevel: 1015,
            grndLevel: 1005),
        visibility: 8000,
        wind: WindEntity(speed: 7.0, deg: 180, gust: 10.0),
        rain: RainEntity(the1H: 0.0),
        clouds: CloudsEntity(all: 20),
        dt: 1632922800,
        sys: SysEntity(
            type: 2,
            id: 456,
            country: 'CA',
            sunrise: 1632897000,
            sunset: 1632938000),
        timezone: -21600,
        id: 1234567,
        name: 'Toronto',
        cod: 201,
      );

      expect(weatherEntity1, equals(weatherEntity2));
      expect(weatherEntity1, isNot(equals(weatherEntity3)));
    });
  });
}
