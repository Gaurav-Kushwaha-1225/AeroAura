// ignore_for_file: file_names, non_constant_identifier_names

import 'package:aeroaura/utils/functions.dart';
import 'package:flutter/material.dart';

class SunsetWidget extends StatefulWidget {
  final String apparent_temp;
  final bool isDay;
  final String sunset;
  final String sunrise;
  const SunsetWidget(
      {Key? key,
      required this.apparent_temp,
      required this.isDay,
      required this.sunrise,
      required this.sunset})
      : super(key: key);

  @override
  State<SunsetWidget> createState() => _SunsetWidgetState();
}

class _SunsetWidgetState extends State<SunsetWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Feels like ${widget.apparent_temp}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            const SizedBox(
              width: 13,
            ),
            const Icon(
              Icons.circle_rounded,
              size: 8,
            ),
            const SizedBox(
              width: 13,
            ),
            Text(
              widget.isDay
                  ? "Sunrise ${ConvertTimeTo12HrFormat(widget.sunrise)}"
                  : "Sunset ${ConvertTimeTo12HrFormat(widget.sunset)}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.isDay
              ? "Sunset ${ConvertTimeTo12HrFormat(widget.sunset)}"
              : "Sunrise ${ConvertTimeTo12HrFormat(widget.sunrise)}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
        )
      ],
    );
  }
}
