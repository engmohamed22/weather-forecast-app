part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}
class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];

}
class WeatherLoaded extends WeatherState {
  final WeatherEntity result;

  const WeatherLoaded({required this.result});

  @override
  List<Object> get props => [result];
}
class WeatherError extends WeatherState {
  final String message;

  const WeatherError({required this.message});

  @override
  List<Object> get props => [message];
}
