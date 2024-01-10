// ignore_for_file: non_constant_identifier_names

import 'package:aeroaura/utils/const.dart';
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
              color: Constants.lightTabColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  color: Colors.black12, width: 1.5, style: BorderStyle.solid),
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
                      color: Colors.blue.shade50),
                  child: const Icon(CupertinoIcons.sunrise_fill,
                      color: Colors.black87, size: 27),
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
