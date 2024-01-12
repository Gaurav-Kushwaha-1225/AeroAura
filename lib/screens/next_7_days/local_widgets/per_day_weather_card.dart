import 'package:aeroaura/utils/WMO_CodeToComment.dart';
import 'package:aeroaura/utils/consts.dart';
import 'package:aeroaura/utils/functions.dart';
// import 'package:aeroaura/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerDayWeatherCard extends StatefulWidget {
  final String date;
  final String wmoCode;
  final double tempMax;
  final double tempMin;
  final double uvIndex;
  final int rainProb;
  final double windSpeed;
  const PerDayWeatherCard({
    super.key,
    required this.date,
    required this.rainProb,
    required this.wmoCode,
    required this.tempMax,
    required this.tempMin,
    required this.windSpeed,
    required this.uvIndex,
  });

  @override
  State<PerDayWeatherCard> createState() => _PerDayWeatherCardState();
}

class _PerDayWeatherCardState extends State<PerDayWeatherCard> {
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
      decoration: BoxDecoration(
        color: Constants.lightTabColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: Colors.black12, width: 1.5, style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(isTomorrow(widget.date) ? "Tomorrow" : "",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text(formatDate(widget.date),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [
                      Colors.lightBlueAccent.withOpacity(0.3),
                      Constants.lightTabColor,
                    ], focal: Alignment.center,
    )),
                child: Image.network(
                  WMO_CodeToComment.WMO_Code[widget.wmoCode]!["day"]!["image"]!,
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
                          "${widget.tempMax.round()} / ${widget.tempMin.round()}",
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
                  Text(
                      WMO_CodeToComment
                          .WMO_Code[widget.wmoCode]!["day"]!["description"]!,
                      style: const TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 15,
                          fontWeight: FontWeight.w500))
                ],
              )
            ],
          ),
          Row(
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
                              color: Colors.black54,
                              width: 1.5,
                              style: BorderStyle.solid)),
                      child: const Icon(
                        CupertinoIcons.wind_snow,
                        size: 20,
                      )),
                  const SizedBox(height: 5),
                  Text("${widget.windSpeed.round()}km/h",
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
                              color: Colors.black54,
                              width: 1.5,
                              style: BorderStyle.solid)),
                      child: const Icon(
                        CupertinoIcons.cloud_bolt_rain_fill,
                        size: 20,
                      )),
                  const SizedBox(height: 8),
                  Text("${widget.rainProb.round()}%",
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
                              color: Colors.black54,
                              width: 1.5,
                              style: BorderStyle.solid)),
                      child: const Icon(
                        CupertinoIcons.sun_haze_fill,
                        size: 20,
                      )),
                  const SizedBox(height: 8),
                  Text("${widget.uvIndex.round()}%",
                      style: const TextStyle(
                          fontSize: 13,
                          fontFamily: "Comfortaa",
                          fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
