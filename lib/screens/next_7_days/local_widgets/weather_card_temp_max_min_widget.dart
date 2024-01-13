import 'package:aeroaura/utils/WMO_CodeToComment.dart';
import 'package:aeroaura/utils/consts.dart';
import 'package:flutter/material.dart';

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
                  ? Constants.darkTabColor
                  : Constants.lightTabColor,
            ],
            focal: Alignment.center,
          )),
          child: Image.network(
            WMO_CodeToComment.WMO_Code[wmoCode]!["day"]!["image"]!,
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
                Text("${tempMax.round()} / ${tempMin.round()}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Comfortaa",
                        fontWeight: FontWeight.bold)),
                const Text(" °C",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Comfortaa",
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Text(WMO_CodeToComment.WMO_Code[wmoCode]!["day"]!["description"]!,
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
