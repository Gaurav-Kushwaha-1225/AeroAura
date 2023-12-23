// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({Key? key}) : super(key: key);

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 125,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(width: 28),
            Text("28",
                style: TextStyle(
                    fontSize: 93,
                    fontFamily: "Comfortaa",
                    letterSpacing: 3,
                    height: 1.5)),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("°C",
                    style: TextStyle(
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
