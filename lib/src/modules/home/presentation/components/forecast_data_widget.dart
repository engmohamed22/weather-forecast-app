import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:forecast_app/src/core/utils/app_colors.dart';
import 'package:forecast_app/src/core/utils/helper_extenstions.dart';
import 'package:forecast_app/src/core/widgets/text_widget.dart';
import 'package:intl/intl.dart';

import '../controllers/forecast/forecast_cubit.dart';

class ForecastDataWidget extends StatelessWidget {
  final ForecastLoaded state;
  const ForecastDataWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          width: context.width * .95,
          child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.35,
                aspectRatio: 0.5,
                initialPage: 1,
              ),
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: context.width * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: Colors.grey[300]!.withOpacity(0.7),
                        border: Border.all(
                          width: 2,
                          color: AppColor.black,
                        ),
                      ),
                      child: Column(
                        children: [
                          TextWidget(
                              txt:
                                  '${state.result.list![index].main!.temp!.round()}°',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          3.ph,
                          Expanded(
                            child: TextWidget(
                              txt:
                                  '${state.result.list![index].weather![0].description}',
                              fontSize: 15,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          3.ph,
                          Image.network(
                              'https://openweathermap.org/img/wn/${state.result.list![index].weather![0].icon}@2x.png',
                              errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          }, loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const CircularProgressIndicator();
                          }, fit: BoxFit.cover, width: 40, height: 40),
                          3.ph,
                          TextWidget(
                            txt:
                                '${state.result.list![index].main!.tempMax!.round()}°~${state.result.list![index].main!.tempMin!.round()}°',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          3.ph,
                          Expanded(
                            child: TextWidget(
                                txt: DateFormat('d MMM').format(DateTime(
                                    state.result.list![index].dtTxt!.year,
                                    state.result.list![index].dtTxt!.month,
                                    state.result.list![index].dtTxt!.day)),
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                          ),
                          /*  TextWidget(
                            txt:
                                    '${state.result.list![index].dtTxt!.difference(DateTime.now()).inDays+1} day'),*/
                        ],
                      )),
                );
              },
              itemCount: state.result.list!.length),
        ),
      ],
    );
  }
}
