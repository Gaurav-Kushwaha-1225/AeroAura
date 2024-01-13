import 'package:aeroaura/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherCardFeaturesWidget extends StatelessWidget {
  final int rainProb;
  final double windSpeed;
  final double uvIndex;
  const WeatherCardFeaturesWidget(
      {super.key,
      required this.rainProb,
      required this.uvIndex,
      required this.windSpeed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white54
                            : Colors.black54,
                        width: 1.5,
                        style: BorderStyle.solid)),
                child: const Icon(
                  CupertinoIcons.cloud_bolt_rain_fill,
                  size: 20,
                )),
            const SizedBox(height: 8),
            Text("${rainProb.round()} %",
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: "Comfortaa",
                    fontWeight: FontWeight.bold))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white54
                            : Colors.black54,
                        width: 1.5,
                        style: BorderStyle.solid)),
                child: const Icon(
                  CupertinoIcons.sun_haze_fill,
                  size: 20,
                )),
            const SizedBox(height: 8),
            Text("UV ${uvComment(uvIndex)}",
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: "Comfortaa",
                    fontWeight: FontWeight.bold))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white54
                            : Colors.black54,
                        width: 1.5,
                        style: BorderStyle.solid)),
                child: const Icon(
                  CupertinoIcons.wind_snow,
                  size: 20,
                )),
            const SizedBox(height: 5),
            Text("${windSpeed.round()} km/h",
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: "Comfortaa",
                    fontWeight: FontWeight.bold))
          ],
        ),
      ],
    );
  }
}
