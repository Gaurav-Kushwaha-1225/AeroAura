// ignore_for_file: file_names, non_constant_identifier_names

import 'package:aeroaura/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings_page/provider/settings_provider.dart';

class TemperatureWidget extends StatefulWidget {
  final String temp;
  final String temp_unit;
  const TemperatureWidget(
      {Key? key, required this.temp, required this.temp_unit})
      : super(key: key);

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return SizedBox(
      height: 125,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 28),
            Text(provider.isDegreeCelcius ? widget.temp : CelciusToFahrenheit(widget.temp),
                style: const TextStyle(
                    fontSize: 93,
                    fontFamily: "Comfortaa",
                    letterSpacing: 3,
                    height: 1.5)),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(provider.isDegreeCelcius ? widget.temp_unit : "°F",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Comfortaa",
                        letterSpacing: 3)),
              ],
            ),
          ]),
    );
  }
}
