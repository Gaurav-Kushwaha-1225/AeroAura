// ignore_for_file: file_names, non_constant_identifier_names

import 'package:aeroaura/utils/functions.dart';
import 'package:aeroaura/utils/wmo_code_to_comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings_page/provider/settings_provider.dart';

class SunsetWidget extends StatefulWidget {
  final int WMOCode;
  final int isDay;
  final String sunset;
  final String sunrise;
  const SunsetWidget(
      {Key? key,
      required this.WMOCode,
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
    final provider = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              widget.isDay == 1
                  ? WMOCodeToComment.wmoCode[widget.WMOCode.toString()]![
                      "day"]!["description"]!
                  : WMOCodeToComment.wmoCode[widget.WMOCode.toString()]![
                      "night"]!["description"]!,
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
              widget.isDay == 1
                  ? "Sunset ${provider.is24HrFormat ? ConvertTimeTo24HrFormat(widget.sunset) : ConvertTimeTo12HrFormat(widget.sunset)}"
                  : "Sunrise ${provider.is24HrFormat ? ConvertTimeTo24HrFormat(widget.sunrise) : ConvertTimeTo12HrFormat(widget.sunrise)}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.isDay == 1
              ? "Sunrise ${provider.is24HrFormat ? ConvertTimeTo24HrFormat(widget.sunrise) : ConvertTimeTo12HrFormat(widget.sunrise)}"
              : "Sunset ${provider.is24HrFormat ? ConvertTimeTo24HrFormat(widget.sunset) : ConvertTimeTo12HrFormat(widget.sunset)}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}
