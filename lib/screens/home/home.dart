
import 'dart:async';

import 'package:aeroaura/models/location.dart';
import 'package:aeroaura/screens/home/local_widgets/VerticalTimeTempDisplay.dart';
import 'package:aeroaura/screens/home/local_widgets/appBar.dart';
import 'package:aeroaura/screens/home/local_widgets/current_weather_features.dart';
import 'package:aeroaura/screens/home/local_widgets/day_date_widget.dart';
import 'package:aeroaura/screens/home/local_widgets/hori_navigator.dart';
import 'package:aeroaura/screens/home/local_widgets/location_widget.dart';
import 'package:aeroaura/screens/home/local_widgets/modal_barrier_loader.dart';
import 'package:aeroaura/screens/home/local_widgets/sunset_widget.dart';
import 'package:aeroaura/screens/home/local_widgets/temperature_widget.dart';
import 'package:aeroaura/screens/home/local_widgets/tomorrow_features.dart';
import 'package:aeroaura/utils/consts.dart';
import 'package:aeroaura/widgets/SizedBoxInSliver.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  Weather? weather;
  Venue? location;
  String? wmoCode;
  double? temp;
  double? uvIndex;
  String? city;
  String? country;

  @override
  void initState() {
    super.initState();
    checkInternet();
    startStreaming();
    loadLastValues();
    fetchWeatherLocationData();
    setState(() {});
  }

  // Internet Connection Checker :---
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isDeviceConnected = false;

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isDeviceConnected = true;
      fetchWeatherLocationData();
    } else {
      isDeviceConnected = false;
      showDialogBox();
    }
    setState(() {});
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }
  // :---

  void loadLastValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    wmoCode = prefs.getString('wmoCode');
    temp = prefs.getDouble('temp');
    uvIndex = prefs.getDouble('uvIndex');
    city = prefs.getString('city');
    country = prefs.getString('country');
  }

  Future<void> fetchWeatherLocationData() async {
    var locationService = LocationService();
    futureLocation = locationService.GetLocation();

    var weatherService = WeatherService();
    futureWeather = weatherService.fetchWeather();
    // futureWeather = weatherService.fetchWeather(latitude: 28.61, longitude: 77.23);
    var results = await Future.wait([futureWeather, futureLocation]);
    Weather weather = results[0] as Weather;
    Venue location = results[1] as Venue;

    // Update the UI with the fetched data
    setState(() {
      wmoCode = weather.current["weather_code"].toString();
      temp = double.parse(weather.current["temperature_2m"].toString());
      uvIndex = double.parse(weather.hourly["uv_index"][0].toString());
      city = location.city;
      country = location.country;

      saveLastValues();
    });
  }

  void saveLastValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('wmoCode', wmoCode!);
    prefs.setDouble('temp', temp!);
    prefs.setDouble('uvIndex', uvIndex!);
    prefs.setString('city', city!);
    prefs.setString('country', country!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar:
            (wmoCode == null || temp == null || uvIndex == null || city == null)
                ? const CustomAppBar(
                    wmoCode: "-1",
                    temp: -273,
                    uvIndex: -1,
                    city: "Current City",
                  )
                : CustomAppBar(
                    wmoCode: wmoCode,
                    temp: temp,
                    uvIndex: uvIndex,
                    city: city,
                  ),
        body: SafeArea(
          child: Stack(children: [
            const CloudBG(cloudNumber: 1, size: Size(500, 500)),
            const CloudBG(cloudNumber: 2, size: Size(300, 300)),
            const CloudBG(cloudNumber: 3, size: Size(500, 500)),
            RefreshIndicator(
              onRefresh: fetchWeatherLocationData,
              color: Colors.lightBlueAccent,
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Constants.darkTabColor
                  : Constants.lightTabColor,
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: true,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SizedBoxInSliver(height: 10, width: 0),
                  SliverToBoxAdapter(
                      child: FutureBuilder<Weather>(
                    future: futureWeather,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DayDateWidget(
                          WMOCode:
                              snapshot.data!.current["weather_code"].toString(),
                          isDay: snapshot.data!.current["is_day"],
                        );
                      }
                      return const SizedBox(
                        height: 62,
                      );
                    },
                  )),
                  const SizedBoxInSliver(height: 5, width: 0),
                  SliverToBoxAdapter(
                    child: FutureBuilder<Weather>(
                      future: futureWeather,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return TemperatureWidget(
                              temp: (snapshot.data!.current['temperature_2m'])
                                  .round()
                                  .toString(),
                              temp_unit: (snapshot
                                      .data!.current_units['temperature_2m'])
                                  .toString());
                        }
                        return const SizedBox(
                          height: 125,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: FutureBuilder<Venue>(
                      future: futureLocation,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return LocationWidget(
                              city: (snapshot.data!.city).toString(),
                              country: (snapshot.data!.country).toString());
                        }
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  ),
                  const SizedBoxInSliver(height: 20, width: 0),
                  SliverToBoxAdapter(
                    child: FutureBuilder<Weather>(
                      future: futureWeather,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SunsetWidget(
                            WMOCode: snapshot.data!.current['weather_code'],
                            isDay: snapshot.data!.current['is_day'],
                            sunrise: snapshot.data!.daily['sunrise'][0],
                            sunset: snapshot.data!.daily['sunset'][0],
                          );
                        }
                        return const SizedBox(
                          height: 45,
                        );
                      },
                    ),
                  ),
                  const SizedBoxInSliver(height: 18, width: 0),
                  SliverToBoxAdapter(
                    child: FutureBuilder<Weather>(
                      future: futureWeather,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return HorizontalNavigator(
                            onPressed: (index) {
                              setState(() {
                                widgetIndex = index;
                              });
                            },
                            activeIndex: widgetIndex,
                            daily: snapshot.data!.daily,
                            daily_units: snapshot.data!.daily_units,
                          );
                        }
                        return const SizedBox(
                          height: 52,
                        );
                      },
                    ),
                  ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        VerticalTimeTempDisplay(
                                          hourly: snapshot.data!.hourly,
                                          hourly_units:
                                              snapshot.data!.hourly_units,
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
                                          isToday: true,
                                        )
                                      ],
                                    );
                                  }
                                  return const SizedBox();
                                },
                              ),
                            )
                          : Container(
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
                                  }
                                  return const SizedBox();
                                },
                              ),
                            ),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            FutureBuilder<Weather>(
              future: futureWeather,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.waiting) {
                  return Container();
                } else {
                  return FutureBuilder<Venue>(
                    future: futureLocation,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.waiting) {
                        return Container();
                      } else {
                        return const Loader();
                      }
                    },
                  );
                }
              },
            )
          ]),
        ));
  }

  // Internet error Dialog Box
  showDialogBox() {
     return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            "No Internet Connection",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            "Turn on mobile data or connect to Wi-Fi.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Constants.darkPrimary
              : Constants.lightTabColor,
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  checkInternet();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).brightness == Brightness.dark
                        ? Constants.darkSecondary
                        : Constants.lightSecondary,
                    // foregroundColor: Colors.white,
                    elevation: 10,
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    fixedSize: const Size(250, 50)),
                child: const Text("Try Again"))
          ],
        ));
  }
// :---
}
