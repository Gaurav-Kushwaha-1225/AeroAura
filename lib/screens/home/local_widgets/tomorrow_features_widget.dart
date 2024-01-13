// ignore_for_file: non_constant_identifier_names

import 'package:aeroaura/utils/consts.dart';
import 'package:aeroaura/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TomorrowFeaturesWidget extends StatefulWidget {
  final String SunriseOrSunset;
  final String time;
  const TomorrowFeaturesWidget(
      {super.key, required this.SunriseOrSunset, required this.time});

  @override
  State<TomorrowFeaturesWidget> createState() => _TomorrowFeaturesWidgetState();
}

class _TomorrowFeaturesWidgetState extends State<TomorrowFeaturesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          elevation: 10,
          child: Container(
            width: (MediaQuery.of(context).size.width - 60) / 2,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                          ? Constants.darkTabColor
                          : Constants.lightTabColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white12
                          : Colors.black12, width: 1.5, style: BorderStyle.solid),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.SunriseOrSunset,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: Colors.lightBlueAccent.withOpacity(0.5)),
                  child: Icon(
                      widget.SunriseOrSunset == "Sunrise Time"
                          ? CupertinoIcons.sunrise_fill
                          : CupertinoIcons.sunset_fill,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.black87,
                      size: 27),
                ),
                const SizedBox(height: 7),
                Text(ConvertTimeTo12HrFormat(widget.time),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
