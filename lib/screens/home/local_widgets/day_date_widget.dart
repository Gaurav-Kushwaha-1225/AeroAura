// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DayDateWidget extends StatefulWidget{
  const DayDateWidget({Key? key}) : super(key: key);

  @override
  State<DayDateWidget> createState() => _DayDateWidgetState();
}

class _DayDateWidgetState extends State<DayDateWidget> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.cloudy_snowing,
          color: Colors.blue,
          size: 35,
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Today",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
            Text("Sat, 3 Aug",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ],
        )
      ],
    );
  }
}
