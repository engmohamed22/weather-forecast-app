import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast_app/src/core/widgets/error.dart';
import 'package:forecast_app/src/core/widgets/shimmer_loading.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/forecast/forecast_cubit.dart';

import 'forecast_data_widget.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastCubit, ForecastState>(
      builder: (context, state) {
        if (state is ForecastInitial) {
          return ShimmerLoading.buildForecastShimmerLoading(context);
        } else if (state is ForecastLoading) {
          return ShimmerLoading.buildForecastShimmerLoading(context);
        } else if (state is ForecastLoaded) {
          return ForecastDataWidget(
            state: state,
          );
        } else if (state is ForecastError) {
          debugPrint('ForecastError: ${state.message}');
          return ErrorHandling.errorHandling(txt: state.message);
        } else {
          return ErrorHandling.errorHandling();
        }
      },
    );
  }
}
