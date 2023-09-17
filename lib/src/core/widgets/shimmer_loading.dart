import 'package:flutter/material.dart';
import 'package:forecast_app/src/core/utils/helper_extenstions.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';

class ShimmerLoading {
  static Widget buildWeatherShimmerLoading(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.black38,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40,
              height: 8,
              color: Colors.white,
            ),
            15.ph,
            Container(
              width: 48,
              height: 48,
              color: Colors.white,
            ),
            15.ph,
            Container(
              width: 150,
              height: 8,
              color: Colors.white,
            ),
            15.ph,
            Container(
              width: 100,
              height: 8,
              color: Colors.white,
            ),
            15.ph,
            Container(
              width: 40,
              height: 8,
              color: Colors.white,
            ),
          ],
        ));
  }

  static Widget buildFavouriteShimmerLoading(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColor.yellow,
        highlightColor: AppColor.brown,
        child: ListTile(
          title: Container(
            width: 80,
            height: 8,
            color: Colors.white,
          ),
          trailing: Container(
            width: 20,
            height: 20,
            color: Colors.white,
          ),
        ));
  }

  static Widget buildForecastShimmerLoading(
    BuildContext context,
  ) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.black38,
      child: SizedBox(
        height: 170,
        width: context.width * .95,
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 8,
                      color: Colors.white,
                    ),
                    15.ph,
                    Container(
                      width: 48,
                      height: 48,
                      color: Colors.white,
                    ),
                    10.ph,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 8,
                            color: Colors.white,
                          ),
                          SizedBox(height: 4),
                          Container(
                            width: 100,
                            height: 8,
                            color: Colors.white,
                          ),
                          SizedBox(height: 4),
                          Container(
                            width: 40,
                            height: 8,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
