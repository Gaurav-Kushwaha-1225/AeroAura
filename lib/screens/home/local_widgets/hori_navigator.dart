// ignore_for_file: file_names

import 'package:aeroaura/services/weather_service.dart';
import 'package:flutter/material.dart';

import '../../../utils/const.dart';

class HorizontalNavigator extends StatefulWidget {
  const HorizontalNavigator({Key? key}) : super(key: key);

  @override
  State<HorizontalNavigator> createState() => _HorizontalNavigatorState();
}

class _HorizontalNavigatorState extends State<HorizontalNavigator> {
  // int taskBarDay = 0;
  bool todayColor = true;
  bool tomorrowColor = false;
  bool next7Color = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                todayColor = true;
                tomorrowColor = false;
                next7Color = false;
                setState(() {
                  WeatherService().fetchWeather();
                });
              });
            },
            style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(
                    Colors.transparent)
            ),
            child: Column(
              children: [
                const Text(
                  "Today",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle_rounded,
                  size: 8,
                  color: todayColor ? Colors.black : Colors.transparent,
                )
              ],
            )),
        const SizedBox(
          width: 5,
        ),
        TextButton(
            onPressed: () {
              setState(() {
                todayColor = false;
                tomorrowColor = true;
                next7Color = false;
              });
            },
            style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(
                    Colors.transparent)
            ),
            child: Column(
              children: [
                const Text(
                  "Tomorrow",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle_rounded,
                  size: 8,
                  color: tomorrowColor ? Colors.black : Colors.transparent,
                )
              ],
            )),
        const SizedBox(
          width: 5,
        ),
        Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  todayColor = false;
                  tomorrowColor = false;
                  next7Color = true;
                });
              },
              style:  ButtonStyle(
                  overlayColor: const MaterialStatePropertyAll(
                      Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                  MaterialStateProperty.all(Constants.lightPrimary)
              ),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 18,
                color: Colors.blue,
              ),
              label: Column(
                children: [
                  const Text(
                    "Next 7 Days",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Icon(
                    Icons.circle_rounded,
                    size: 8,
                    color: next7Color ? Colors.blue : Colors.transparent,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
