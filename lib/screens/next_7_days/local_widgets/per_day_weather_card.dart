import 'package:aeroaura/screens/next_7_days/local_widgets/weather_card_date_day_widget.dart';
import 'package:aeroaura/screens/next_7_days/local_widgets/weather_card_features_widget.dart';
import 'package:aeroaura/screens/next_7_days/local_widgets/weather_card_temp_max_min_widget.dart';
import 'package:aeroaura/utils/consts.dart';
import 'package:flutter/material.dart';

class PerDayWeatherCard extends StatefulWidget {
  final String date;
  final String wmoCode;
  final double tempMax;
  final double tempMin;
  final double uvIndex;
  final int rainProb;
  final double windSpeed;
  const PerDayWeatherCard({
    super.key,
    required this.date,
    required this.rainProb,
    required this.wmoCode,
    required this.tempMax,
    required this.tempMin,
    required this.windSpeed,
    required this.uvIndex,
  });

  @override
  State<PerDayWeatherCard> createState() => _PerDayWeatherCardState();
}

class _PerDayWeatherCardState extends State<PerDayWeatherCard> {
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
                          ? Constants.darkTabColor
                          : Constants.lightTabColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: List.filled(
              5,
              BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.1),
                  blurRadius: 5)),
        border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white12
                          : Colors.black12, width: 1.5, style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WeatherCardDateDayWidget(date: widget.date),
          WeatherCardTempMaxMinWidget(
              tempMax: widget.tempMax,
              tempMin: widget.tempMin,
              wmoCode: widget.wmoCode),
          WeatherCardFeaturesWidget(rainProb: widget.rainProb, uvIndex: widget.uvIndex, windSpeed: widget.windSpeed)
        ],
      ),
    );
  }
}
