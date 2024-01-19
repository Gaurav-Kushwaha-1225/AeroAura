// ignore_for_file: file_names, non_constant_identifier_names

import 'package:aeroaura/utils/wmo_code_to_comment.dart';
import 'package:aeroaura/utils/functions.dart';
import 'package:flutter/material.dart';

class DayDateWidget extends StatefulWidget {
  final String WMOCode;
  final int isDay;
  const DayDateWidget({Key? key, required this.WMOCode, required this.isDay})
      : super(key: key);

  @override
  State<DayDateWidget> createState() => _DayDateWidgetState();
}

class _DayDateWidgetState extends State<DayDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.network(
          widget.isDay == 1
              ? WMOCodeToComment.wmoCode[widget.WMOCode]!["day"]!["image"]!
              : WMOCodeToComment.wmoCode[widget.WMOCode]!["night"]!["image"]!,
          height: 62,
          width: 62,
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
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ],
        )
      ],
    );
  }
}
