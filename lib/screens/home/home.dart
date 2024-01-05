import 'package:aeroaura/models/location.dart';
import 'package:aeroaura/screens/home/local_widgets/VerticalTimeTempDisplay.dart';
import 'package:aeroaura/screens/home/local_widgets/appBar.dart';
import 'package:aeroaura/screens/home/local_widgets/day_date_widget.dart';
import 'package:aeroaura/screens/home/local_widgets/hori_navigator.dart';
import 'package:aeroaura/screens/home/local_widgets/sunset_widget.dart';
import 'package:aeroaura/screens/home/local_widgets/temperature_widget.dart';
import 'package:flutter/material.dart';
import '../../models/weather.dart';
import '../../services/location_service.dart';
import '../../services/weather_service.dart';
import 'local_widgets/cloudsBG.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Weather> futureWeather;
  late Future<Venue> futureLocation;

  @override
  void initState() {
    super.initState();
    fetchWeatherLocationData();
  }

  void fetchWeatherLocationData() {
    var locationService = LocationService();
    futureLocation = locationService.GetLocation();

    var weatherService = WeatherService();
    futureWeather = weatherService.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Stack(children: [
            const CloudBG(cloudNumber: 1, size: Size(500, 500)),
            const CloudBG(cloudNumber: 2, size: Size(300, 300)),
            const CloudBG(cloudNumber: 3, size: Size(500, 500)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const DayDateWidget(),
                const SizedBox(
                  height: 5,
                ),
                FutureBuilder<Weather>(
                  future: futureWeather,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return TemperatureWidget(
                          temp: (snapshot.data!.current['temperature_2m']).round()
                              .toString(),
                          temp_unit:
                              (snapshot.data!.current_units['temperature_2m'])
                                  .toString());
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                FutureBuilder<Venue>(
                  future: futureLocation,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "${(snapshot.data!.city).toString()}, ${(snapshot.data!.country).toString()}",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w200),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SunsetWidget(),
                const SizedBox(
                  height: 18,
                ),
                const HorizontalNavigator(),
                const VerticalTimeTempDisplay(),
              ],
            ),
          ]),
        ));
  }
}
