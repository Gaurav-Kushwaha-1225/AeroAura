import 'package:aeroaura/screens/home/local_widgets/VerticalTimeTempDisplay.dart';
import 'package:aeroaura/screens/home/local_widgets/appBar.dart';
import 'package:aeroaura/screens/home/local_widgets/hori_navigator.dart';
import 'package:aeroaura/screens/home/local_widgets/sunset_widget.dart';
import 'package:flutter/material.dart';

import 'local_widgets/cloudsBG.dart';
import 'local_widgets/day_date_widget.dart';
import 'local_widgets/temperature_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: CustomAppBar(),
        body: SafeArea(
          child: Stack(children: [
            CloudBG(cloudNumber: 1, size: Size(500, 500)),
            CloudBG(cloudNumber: 2, size: Size(300, 300)),
            CloudBG(cloudNumber: 3, size: Size(500, 500)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 10,
                ),
                DayDateWidget(),
                SizedBox(
                  height: 5,
                ),
                TemperatureWidget(),
                Text(
                  "Varanasi, India",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 20,
                ),
                SunsetWidget(),
                SizedBox(
                  height: 18,
                ),
                HorizontalNavigator(),
                VerticalTimeTempDisplay()
              ],
            ),
          ]),
        ));
  }
}
