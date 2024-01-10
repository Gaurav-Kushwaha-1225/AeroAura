// ignore_for_file: non_constant_identifier_names

import 'package:aeroaura/screens/home/local_widgets/tomorrow_features_widget.dart';
import 'package:flutter/material.dart';

class TomorrowFeatures extends StatefulWidget {
  final Map<String, dynamic> daily;
  const TomorrowFeatures({super.key, required this.daily});

  @override
  State<TomorrowFeatures> createState() => _TomorrowFeaturesState();
}

class _TomorrowFeaturesState extends State<TomorrowFeatures> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TomorrowFeaturesWidget(
            SunriseOrSunset: "Sunrise Time",
            time: widget.daily["sunrise"][1],
          ),
          TomorrowFeaturesWidget(
            SunriseOrSunset: "Sunset Time",
            time: widget.daily["sunset"][1],
          )
        ],
      ),
    );
  }
}
