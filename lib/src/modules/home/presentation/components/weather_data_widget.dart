import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast_app/src/core/utils/app_colors.dart';
import 'package:forecast_app/src/core/utils/helper_extenstions.dart';
import 'package:forecast_app/src/core/widgets/text_widget.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/favourite_locations/favourite_cubit.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/weather/weather_cubit.dart';
import 'package:intl/intl.dart';

class WeatherDataWidget extends StatelessWidget {
  final WeatherLoaded state;

  const WeatherDataWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nowDateFormatted = DateFormat('EEEE, d MMMM').format(DateTime.now());
    return FadeInLeft(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInLeft(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                    txt: '${state.result.name}, ${state.result.sys!.country}',
                    textAlign: TextAlign.start,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                const Spacer(),
                BlocConsumer<FavouriteCubit, FavouriteState>(
                  listener: (context, state) {},
                  builder: (context, favouriteState) {
                    if (favouriteState is FavouriteLoaded) {
                      return IconButton.filledTonal(
                          style: IconButton.styleFrom(
                            backgroundColor: AppColor.black,
                          ),
                          color: AppColor.yellow,
                          onPressed: () {
                            if (favouriteState.favouriteLocations
                                .contains(state.result.name!)) {
                              BlocProvider.of<FavouriteCubit>(context)
                                  .deleteFavouriteLocation(state.result.name!);
                            } else {
                              BlocProvider.of<FavouriteCubit>(context)
                                  .saveFavouriteLocation(state.result.name!);
                            }
                          },
                          icon: Icon(
                            favouriteState.favouriteLocations
                                    .contains(state.result.name!)
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ));
                    } else {
                      return IconButton.filledTonal(
                          style: IconButton.styleFrom(
                            backgroundColor: AppColor.black,
                          ),
                          color: AppColor.yellow,
                          onPressed: () {
                            BlocProvider.of<FavouriteCubit>(context)
                                .saveFavouriteLocation(state.result.name!);
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                          ));
                    }
                  },
                ),
              ],
            ),
          ),
          5.ph,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: AppColor.black,
            ),
            child: TextWidget(
                txt: nowDateFormatted,
                textAlign: TextAlign.center,
                color: AppColor.yellow,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          5.ph,
          TextWidget(
              txt: '${state.result.weather![0].main}',
              textAlign: TextAlign.center,
              fontSize: 22,
              fontWeight: FontWeight.bold),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FadeInLeft(
                  child: Image.network(
                      'https://openweathermap.org/img/wn/${state.result.weather![0].icon}@4x.png',
                      errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              }, loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, fit: BoxFit.cover, width: 150, height: 150)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                      txt: '${state.result.main!.temp!.round()}°',
                      textAlign: TextAlign.start,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                  TextWidget(
                      txt:
                          'Feels Like: ${state.result.main!.feelsLike!.round()} °C',
                      textAlign: TextAlign.start,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  TextWidget(
                      txt: '${state.result.weather![0].description}',
                      textAlign: TextAlign.start,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
          5.ph,
          buildCardDetails(
              title: 'Humidity',
              value: '${state.result.main!.humidity}%',
              icon: Icons.water_drop),
          5.ph,
          buildCardDetails(
              title: 'Wind speed',
              value: '${state.result.wind!.speed}',
              icon: Icons.wind_power),
        ],
      ),
    );
  }

  Card buildCardDetails(
      {required String title, required String value, required IconData icon}) {
    return Card(
      color: AppColor.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color: AppColor.yellow,
              ),
              5.pw,
              TextWidget(
                  txt: title,
                  color: AppColor.yellow,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              const Spacer(),
              TextWidget(
                  txt: value,
                  color: AppColor.yellow,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ],
          ),
        ),
      ),
    );
  }
}
