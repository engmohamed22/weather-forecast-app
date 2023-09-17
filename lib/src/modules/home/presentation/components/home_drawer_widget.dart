import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast_app/src/core/utils/app_colors.dart';
import 'package:forecast_app/src/core/utils/helper_extenstions.dart';
import 'package:forecast_app/src/core/widgets/error.dart';
import 'package:forecast_app/src/core/widgets/shimmer_loading.dart';
import 'package:forecast_app/src/core/widgets/text_widget.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/favourite_locations/favourite_cubit.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/forecast/forecast_cubit.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/weather/weather_cubit.dart';

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.lat,
    required this.lon,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.yellow,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,

          // padding: const EdgeInsets.all(15),
          children: [
            50.ph,
            const TextWidget(
              txt: 'Weather App',
              textAlign: TextAlign.center,
              color: AppColor.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            50.ph,
            ExpansionTile(
              title: const TextWidget(
                txt: 'Favourite Locations',
                color: AppColor.yellow,
              ),
              iconColor: AppColor.yellow,
              collapsedIconColor: AppColor.yellow,
              backgroundColor: AppColor.black,
              collapsedBackgroundColor: AppColor.black,
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              childrenPadding: EdgeInsets.zero,
              children: [
                BlocConsumer<FavouriteCubit, FavouriteState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is FavouriteInitial) {
                      return ShimmerLoading.buildFavouriteShimmerLoading(
                          context);
                    } else if (state is FavouriteLoading) {
                      return ShimmerLoading.buildFavouriteShimmerLoading(
                          context);
                    } else if (state is FavouriteLoaded) {
                      return ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.favouriteLocations.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                _scaffoldKey.currentState!.closeDrawer();
                                BlocProvider.of<WeatherCubit>(context)
                                    .getWeatherByCityName(
                                  cityName: state.favouriteLocations[index],
                                );
                                BlocProvider.of<ForecastCubit>(context)
                                    .getForecastByCityName(
                                  cityName: state.favouriteLocations[index],
                                );
                              },
                              title: TextWidget(
                                txt: state.favouriteLocations[index],
                                color: AppColor.yellow,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  BlocProvider.of<FavouriteCubit>(context)
                                      .deleteFavouriteLocation(
                                          state.favouriteLocations[index]);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: AppColor.yellow,
                                ),
                              ),
                            );
                          });
                    } else if (state is FavouriteError) {
                      debugPrint('FavouriteError ${state.message}');
                      return ErrorHandling.errorHandling();
                    } else {
                      return ErrorHandling.errorHandling();
                    }
                  },
                ),
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      BlocProvider.of<FavouriteCubit>(context)
                          .clearFavouriteLocations();
                    },
                    icon: const Icon(Icons.delete_outline),
                    label: const TextWidget(
                      txt: 'Clear All',
                      color: AppColor.yellow,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _scaffoldKey.currentState!.closeDrawer();
                  BlocProvider.of<WeatherCubit>(context).getCurrentWeather();
                  BlocProvider.of<ForecastCubit>(context).getCurrentForecast();
                  // savePosition();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.black,
                ),
                icon: const Icon(CupertinoIcons.location_fill,
                    color: AppColor.yellow),
                label: const TextWidget(
                  txt: 'Current Location',
                  color: AppColor.yellow,
                ),
              ),
            ),
            50.ph,
          ],
        ),
      ),
    );
  }
}
