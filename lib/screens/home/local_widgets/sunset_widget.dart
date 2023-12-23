// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SunsetWidget extends StatefulWidget {
  const SunsetWidget({Key? key}) : super(key: key);

  @override
  State<SunsetWidget> createState() => _SunsetWidgetState();
}

class _SunsetWidgetState extends State<SunsetWidget> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "Feels like 32",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
        ),
        SizedBox(
          width: 13,
        ),
        Icon(
          Icons.circle_rounded,
          size: 8,
        ),
        SizedBox(
          width: 13,
        ),
        Text(
          "Sunset 20:15",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
        )
      ],
    );
  }
}
