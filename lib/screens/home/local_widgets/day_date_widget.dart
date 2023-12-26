// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';

class DayDateWidget extends StatefulWidget {
  const DayDateWidget({Key? key}) : super(key: key);

  @override
  State<DayDateWidget> createState() => _DayDateWidgetState();
}

class _DayDateWidgetState extends State<DayDateWidget> {

  String dateFormatter(DateTime date) {
    dynamic dayData =
        '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

    dynamic monthData =
        '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

    return json.decode(dayData)['${date.weekday}'] +
        ", " +
        date.day.toString() +
        " " +
        json.decode(monthData)['${date.month}'];
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.cloudy_snowing,
          color: Colors.blue,
          size: 35,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Today",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
            Text(dateFormatter(DateTime.now()),
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ],
        )
      ],
    );
  }
}
