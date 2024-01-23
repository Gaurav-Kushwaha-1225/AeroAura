import 'package:aeroaura/utils/consts.dart';
import 'package:flutter/material.dart';

class CurrentWeatherFeaturesWidget extends StatelessWidget {
  final IconData icon;
  final String feature;
  final String value;
  const CurrentWeatherFeaturesWidget(
      {super.key,
      required this.feature,
      required this.icon,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Constants.darkTabColor
              : Constants.lightTabColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: List.filled(
              5,
              BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.1),
                  blurRadius: 1)),
          border: Border.all(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white12
                  : Colors.black12,
              width: 1.5,
              style: BorderStyle.solid)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 25,
          ),
          Text(feature,
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade600)),
          Text(value,
              style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
