import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:forecast_app/src/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class LatLon extends Equatable {
  final double lat;
  final double lon;

  const LatLon({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}

class CityName extends Equatable {
  final String cityName;

  const CityName({required this.cityName});

  @override
  List<Object> get props => [cityName];
}
