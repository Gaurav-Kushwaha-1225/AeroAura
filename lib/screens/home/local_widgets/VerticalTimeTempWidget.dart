// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:aeroaura/utils/wmo_code_to_comment.dart';
import 'package:aeroaura/utils/consts.dart';
import 'package:aeroaura/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings_page/provider/settings_provider.dart';

class VerticalTimeTempWidget extends StatefulWidget {
  final String time;
  final String temp;
  final String WMOCode;
  final int isDay;
  const VerticalTimeTempWidget(
      {Key? key,
      required this.time,
      required this.temp,
      required this.WMOCode,
      required this.isDay})
      : super(key: key);

  @override
  State<VerticalTimeTempWidget> createState() => _VerticalTimeTempWidgetState();
}

class _VerticalTimeTempWidgetState extends State<VerticalTimeTempWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          elevation: 10,
          child: Container(
            width: 90,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Constants.darkTabColor
                  : Constants.lightTabColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white12
                      : Colors.black12,
                  width: 1.5,
                  style: BorderStyle.solid),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      provider.is24HrFormat
                          ? ConvertTimeTo24HrFormat(widget.time)
                          : ConvertTimeTo12HrFormat(widget.time),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.5),
                        color: Colors.lightBlueAccent.withOpacity(0.5)),
                    child: Image.network(
                      widget.isDay == 1
                          ? WMOCodeToComment
                              .wmoCode[widget.WMOCode]!["day"]!["image"]!
                          : WMOCodeToComment
                              .wmoCode[widget.WMOCode]!["night"]!["image"]!,
                      height: 26,
                      width: 26,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(provider.isDegreeCelcius ? widget.temp : CelciusToFahrenheit(widget.temp),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 2),
                      Text(provider.isDegreeCelcius ? "°C" : "°F",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start)
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
