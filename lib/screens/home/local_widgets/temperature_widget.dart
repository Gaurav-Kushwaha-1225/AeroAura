// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class TemperatureWidget extends StatefulWidget {
  final String temp;
  final String temp_unit;
  const TemperatureWidget({Key? key, required this.temp, required this.temp_unit}) : super(key: key);

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 125,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 28),
            Text(widget.temp,
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
                Text(widget.temp_unit,
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
