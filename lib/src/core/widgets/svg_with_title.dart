import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forecast_app/src/core/utils/app_colors.dart';
import 'package:forecast_app/src/core/utils/helper_extenstions.dart';
import 'package:forecast_app/src/core/widgets/text_widget.dart';

class SvgWithTitle extends StatelessWidget {
  final String svgName;
  final String title;

  const SvgWithTitle({Key? key, required this.svgName, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgName,
          fit: BoxFit.contain,
          width: context.width * .5,
        ),
        25.ph,
        TextWidget(
          txt: title,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColor.blue,
        )
      ],
    );
  }
}
