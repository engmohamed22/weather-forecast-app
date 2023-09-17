import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forecast_app/src/core/services/shared_preferences.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  List<String> cachedFavoriteLocations = List.empty(growable: true);
  void saveFavouriteLocation(String location) {
    emit(FavouriteLoading());
    List<String> loadedFavoriteLocations = List.empty(growable: true);
    SharedPreferencesService.getInstance().then((value) async {
      List<Object?>? loadedData = await value.getValue('favouriteLocations');
      loadedFavoriteLocations =
          loadedData?.cast<String>().toList() ?? cachedFavoriteLocations;
      loadedFavoriteLocations.contains(location)
          ? debugPrint('$location already exist')
          : loadedFavoriteLocations.add(location.toString());
      /*value.getValue('favouriteLocations')??[];
      for (int i = 0; i < loadedFavoriteLocations.length; i++) {
        if (loadedFavoriteLocations.contains(location)) {
          loadedFavoriteLocations.removeAt(i);
        }
        else {
          loadedFavoriteLocations.add(location);
        }
      }*/
      value.saveValue(
          'favouriteLocations', loadedFavoriteLocations as List<String>);
      emit(FavouriteLoaded(favouriteLocations: loadedFavoriteLocations));
    });
  }

  void deleteFavouriteLocation(String location) {
    List<String> loadedFavoriteLocations = List.empty(growable: true);
    emit(FavouriteLoading());
    SharedPreferencesService.getInstance().then((value) async {
      List<Object?>? loadedData = await value.getValue('favouriteLocations');
      loadedFavoriteLocations =
          loadedData?.cast<String>() ?? cachedFavoriteLocations;
      loadedFavoriteLocations.contains(location)
          ? loadedFavoriteLocations.removeWhere(
              (element) {
                return element == location;
              },
            )
          : null;
      value.saveValue(
          'favouriteLocations', loadedFavoriteLocations as List<String>);
      emit(FavouriteLoaded(favouriteLocations: loadedFavoriteLocations));
    });
  }

  List<String> loadFavouriteLocations() {
    emit(FavouriteLoading());
    SharedPreferencesService.getInstance().then((value) async {
      try {
        List<Object?>? loadedData = await value.getValue('favouriteLocations');
        if (loadedData == null) {
          value.saveValue('favouriteLocations', cachedFavoriteLocations);
        } else {
          // Cast the loaded data to List<String>
          cachedFavoriteLocations = loadedData.cast<String>();
          debugPrint('loadedFavoriteLocations: $cachedFavoriteLocations');
          emit(FavouriteLoaded(favouriteLocations: cachedFavoriteLocations));
        }
      } catch (e) {
        debugPrint('favouriteLocations error is $e');
      }
    });
    return cachedFavoriteLocations;
  }

  void clearFavouriteLocations() {
    emit(FavouriteLoading());
    SharedPreferencesService.getInstance().then((value) {
      value.clear();
      emit(const FavouriteLoaded(favouriteLocations: []));
    });
  }
}
