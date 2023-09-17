import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final CoordEntity? coord;
  final List<WeatherDetailEntity>? weather;
  final String? base;
  final MainEntity? main;
  final int? visibility;
  final WindEntity? wind;
  final RainEntity? rain;
  final CloudsEntity? clouds;
  final int? dt;
  final SysEntity? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  const WeatherEntity({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        rain,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod
      ];
}

class CoordEntity extends Equatable {
  final double? lon;
  final double? lat;

  const CoordEntity({
    this.lon,
    this.lat,
  });

  @override
  List<Object?> get props => [lon, lat];
}

class MainEntity extends Equatable {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  const MainEntity({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        seaLevel,
        grndLevel
      ];
}

class RainEntity extends Equatable {
  final double? the1H;

  const RainEntity({
    this.the1H,
  });

  @override
  List<Object?> get props => [the1H];
}

class CloudsEntity extends Equatable {
  final int? all;

  const CloudsEntity({
    this.all,
  });

  @override
  List<Object?> get props => [all];
}

class SysEntity extends Equatable {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  const SysEntity({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  @override
  List<Object?> get props => [type, id, country, sunrise, sunset];
}

class WeatherDetailEntity extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherDetailEntity({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  @override
  List<Object?> get props => [id, main, description, icon];
}

class WindEntity extends Equatable {
  final double? speed;
  final int? deg;
  final double? gust;

  const WindEntity({
    this.speed,
    this.deg,
    this.gust,
  });

  @override
  List<Object?> get props => [speed, deg, gust];
}
