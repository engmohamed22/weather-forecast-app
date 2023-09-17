part of 'forecast_cubit.dart';

abstract class ForecastState extends Equatable {
  const ForecastState();
}

class ForecastInitial extends ForecastState {
  @override
  List<Object> get props => [];
}
class ForecastLoading extends ForecastState {
  @override
  List<Object> get props => [];

}
class ForecastLoaded extends ForecastState {
  final ForecastEntity result;

  const ForecastLoaded({required this.result});

  @override
  List<Object> get props => [result];
}
class ForecastError extends ForecastState {
  final String message;

  const ForecastError({required this.message});

  @override
  List<Object> get props => [message];
}

