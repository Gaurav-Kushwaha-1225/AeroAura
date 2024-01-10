import 'package:aeroaura/models/location.dart';
import 'package:aeroaura/screens/home/local_widgets/VerticalTimeTempDisplay.dart';
import 'package:aeroaura/screens/home/local_widgets/appBar.dart';
import 'package:aeroaura/screens/home/local_widgets/current_weather_features.dart';
import 'package:aeroaura/screens/home/local_widgets/day_date_widget.dart';
import 'package:aeroaura/screens/home/local_widgets/hori_navigator.dart';
import 'package:aeroaura/screens/home/local_widgets/sunset_widget.dart';
import 'package:aeroaura/screens/home/local_widgets/temperature_widget.dart';
import 'package:aeroaura/screens/home/local_widgets/tomorrow_features.dart';
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
  int widgetIndex = 0;
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
            CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: true,
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const SliverToBoxAdapter(child: DayDateWidget()),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 5,
                  ),
                ),
                SliverToBoxAdapter(
                  child: FutureBuilder<Weather>(
                    future: futureWeather,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return TemperatureWidget(
                            temp: (snapshot.data!.current['temperature_2m'])
                                .round()
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
                ),
                SliverToBoxAdapter(
                  child: FutureBuilder<Venue>(
                    future: futureLocation,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          "${(snapshot.data!.city).toString()}, ${(snapshot.data!.country).toString()}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: FutureBuilder<Weather>(
                    future: futureWeather,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SunsetWidget(
                          apparent_temp:
                              "${(snapshot.data!.current['apparent_temperature']).toString()} ${(snapshot.data!.current_units['apparent_temperature']).toString()}",
                          isDay: snapshot.data!.current['is_day'] == 1
                              ? true
                              : false,
                          sunrise: snapshot.data!.daily['sunrise'][0],
                          sunset: snapshot.data!.daily['sunset'][0],
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 18,
                  ),
                ),
                SliverToBoxAdapter(
                    child: HorizontalNavigator(
                  onPressed: (index) {
                    setState(() {
                      widgetIndex = index;
                    });
                  },
                  activeIndex: widgetIndex,
                )),
                SliverToBoxAdapter(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: widgetIndex == 0
                        ? Container(
                            key: UniqueKey(),
                            child: FutureBuilder<Weather>(
                              future: futureWeather,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      VerticalTimeTempDisplay(
                                        hourly: snapshot.data!.hourly,
                                        hourly_units:
                                            snapshot.data!.hourly_units,
                                        isDay:
                                            snapshot.data!.current['is_day'] ==
                                                    1
                                                ? true
                                                : false,
                                      ),
                                      CurrentWeatherFeatures(
                                        current: snapshot.data!.current,
                                        current_units:
                                            snapshot.data!.current_units,
                                        hourly: snapshot.data!.hourly,
                                        hourly_units:
                                            snapshot.data!.hourly_units,
                                        daily: snapshot.data!.daily,
                                        daily_units: snapshot.data!.daily_units,
                                        isToday: true,
                                      )
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                          )
                        : widgetIndex == 1
                            ? Container(
                                key: UniqueKey(),
                                child: FutureBuilder<Weather>(
                                  future: futureWeather,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TomorrowFeatures(
                                            daily: snapshot.data!.daily,
                                          ),
                                          CurrentWeatherFeatures(
                                            current: snapshot.data!.current,
                                            current_units:
                                                snapshot.data!.current_units,
                                            hourly: snapshot.data!.hourly,
                                            hourly_units:
                                                snapshot.data!.hourly_units,
                                            daily: snapshot.data!.daily,
                                            daily_units:
                                                snapshot.data!.daily_units,
                                            isToday: false,
                                          )
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('${snapshot.error}');
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                ),
                              )
                            : Container(
                                key: UniqueKey(),
                                height: 300,
                                color: Colors.amber,
                              ),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
