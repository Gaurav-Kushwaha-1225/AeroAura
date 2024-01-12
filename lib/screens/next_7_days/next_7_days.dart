// ignore_for_file: non_constant_identifier_names

import 'package:aeroaura/screens/next_7_days/local_widgets/app_bar.dart';
import 'package:aeroaura/screens/next_7_days/local_widgets/per_day_weather_card.dart';
import 'package:flutter/material.dart';

class NextSevenDaysPage extends StatefulWidget {
  final Map<String, dynamic> daily;
  final Map<String, dynamic> daily_units;
  const NextSevenDaysPage(
      {super.key, required this.daily, required this.daily_units});

  @override
  State<NextSevenDaysPage> createState() => _NextSevenDaysPageState();
}

class _NextSevenDaysPageState extends State<NextSevenDaysPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: SafeArea(
            child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 15, top: 15),
          itemCount: 6,
          itemBuilder: (context, index) {
            return PerDayWeatherCard(
                date: widget.daily["time"][index + 1],
                rainProb: widget.daily["precipitation_probability_max"][index + 1],
                wmoCode: widget.daily["weather_code"][index + 1].toString(),
                tempMax: widget.daily["temperature_2m_max"][index + 1],
                tempMin: widget.daily["temperature_2m_min"][index + 1],
                windSpeed: widget.daily["wind_speed_10m_max"][index + 1],
                uvIndex: widget.daily["uv_index_max"][index + 1]);
          },
        )));
  }
}
