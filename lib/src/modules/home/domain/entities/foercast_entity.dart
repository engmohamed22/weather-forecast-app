// Domain Entities

import 'package:equatable/equatable.dart';

class ForecastEntity  extends Equatable{
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ListElementEntity>? list;
  final CityEntity? city;

  const ForecastEntity({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });
  @override
  List<Object?> get props =>
      [cod, message, cnt, list, city];
}

class CityEntity  extends Equatable{
  final int? id;
  final String? name;
  final CoordEntity? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const CityEntity({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });
  @override
  List<Object?> get props =>
      [id, name, coord, country, population, timezone, sunrise, sunset];
}

class CoordEntity extends Equatable{
  final double? lat;
  final double? lon;

  const CoordEntity({
    this.lat,
    this.lon,
  });
  @override
  List<Object?> get props =>
      [lat, lon];
}

class ListElementEntity extends Equatable{
  final int? dt;
  final MainEntity? main;
  final List<WeatherEntity>? weather;
  final CloudsEntity? clouds;
  final WindEntity? wind;
  final int? visibility;
  final double? pop;
  final RainEntity? rain;
  final SysEntity? sys;
  final DateTime? dtTxt;

  const ListElementEntity({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });
  @override
  List<Object?> get props =>
      [dt, main, weather, clouds, wind, visibility, pop, rain, sys, dtTxt];
}

class CloudsEntity extends Equatable{
  final int? all;

  const CloudsEntity({
    this.all,
  });
  @override
  List<Object?> get props =>
      [all];
}

class MainEntity extends Equatable {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final double? tempKf;

  const MainEntity({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });
  @override
  List<Object?> get props =>
      [temp, feelsLike, tempMin, tempMax, pressure, seaLevel, grndLevel, humidity, tempKf];
}

class RainEntity extends Equatable{
  final double? the3H;

  const RainEntity({
    this.the3H,
  });
  @override
  List<Object?> get props =>
      [the3H];
}

class SysEntity extends Equatable{
  final String? pod;

  const SysEntity({
    this.pod,
  });
  @override
  List<Object?> get props =>
      [pod];
}

class WeatherEntity extends Equatable{
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherEntity({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  @override
  List<Object?> get props =>
      [id, main, description, icon];
}
class WindEntity extends Equatable{
  final double? speed;
  final int? deg;
  final double? gust;

  const WindEntity({
    this.speed,
    this.deg,
    this.gust,
  });
  @override
  List<Object?> get props =>
      [speed, deg, gust];
}
