part of 'favourite_cubit.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();
}

class FavouriteInitial extends FavouriteState {
  @override
  List<Object> get props => [];
}

class FavouriteLoading extends FavouriteState {
  @override
  List<Object> get props => [];
}

class FavouriteLoaded extends FavouriteState {
  final List<String> favouriteLocations;

const  FavouriteLoaded({required this.favouriteLocations});

  @override
  List<Object> get props => [favouriteLocations];
}

class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError(this.message);

  @override
  List<Object> get props => [message];
}