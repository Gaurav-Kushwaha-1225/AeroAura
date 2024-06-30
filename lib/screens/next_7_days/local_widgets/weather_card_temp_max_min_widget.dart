import 'package:aeroaura/utils/consts.dart';
import 'package:aeroaura/utils/functions.dart';
import 'package:aeroaura/utils/wmo_code_to_comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings_page/provider/settings_provider.dart';

class WeatherCardTempMaxMinWidget extends StatelessWidget {
  final String wmoCode;
  final double tempMax;
  final double tempMin;
  const WeatherCardTempMaxMinWidget(
      {super.key,
      required this.tempMax,
      required this.tempMin,
      required this.wmoCode});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
            colors: [
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.1),
              Theme.of(context).brightness == Brightness.dark
                  ? Constants.darkTabColor.withAlpha(80)
                  : Constants.lightTabColor.withAlpha(80),
            ],
            focal: Alignment.center,
          )),
          child: Image.network(
            WMOCodeToComment.wmoCode[wmoCode]!["day"]!["image"]!,
            height: 100,
            width: 100,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    provider.isDegreeCelcius
                        ? "${tempMax.round()} / ${tempMin.round()}"
                        : "${CelciusToFahrenheit(tempMax.round().toString())} / ${CelciusToFahrenheit(tempMin.round().toString())}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Comfortaa",
                        fontWeight: FontWeight.bold)),
                Text(provider.isDegreeCelcius ? " °C" : " °F",
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "Comfortaa",
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Text(WMOCodeToComment.wmoCode[wmoCode]!["day"]!["description"]!,
                style: const TextStyle(
                    fontFamily: "Comfortaa",
                    fontSize: 15,
                    fontWeight: FontWeight.w500))
          ],
        )
      ],
    );
  }
}
