import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast_app/src/core/widgets/error.dart';
import 'package:forecast_app/src/core/widgets/shimmer_loading.dart';
import 'package:forecast_app/src/modules/home/presentation/components/weather_data_widget.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/weather/weather_cubit.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return ShimmerLoading.buildWeatherShimmerLoading(context);
        } else if (state is WeatherLoading) {
          return ShimmerLoading.buildWeatherShimmerLoading(context);
        } else if (state is WeatherLoaded) {
          return WeatherDataWidget(
            state: state,
          );
        } else if (state is WeatherError) {
          debugPrint('WeatherError: ${state.message}');
          return ErrorHandling.errorHandling(txt: state.message);
        } else {
          return ErrorHandling.errorHandling();
        }
      },
    );
  }
}
