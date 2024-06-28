import 'dart:math';

import 'package:aeroaura/screens/add_city_page/local_widgets/add_city_page_widget.dart';
import 'package:aeroaura/screens/add_city_page/local_widgets/app_bar.dart';
import 'package:aeroaura/screens/search_city_page/search_city_page.dart';
import 'package:aeroaura/services/weather_service.dart';
import 'package:aeroaura/utils/consts.dart';
import 'package:country_state_city/models/city.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/weather.dart';
import '../../utils/functions.dart';

class AddCityPage extends StatefulWidget {
  final double temp;
  final String wmoCode;
  final String city;
  final double uvIndex;
  const AddCityPage(
      {super.key,
      required this.city,
      required this.temp,
      required this.uvIndex,
      required this.wmoCode});

  @override
  State<AddCityPage> createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  List<String> savedCities = [];
  List<Weather> weathers = [];

  @override
  void initState() {
    getSavedCities();
    super.initState();
  }

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
        padding: const EdgeInsets.only(bottom: 5, top: 15),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddCityPageWidget(
                  city: widget.city,
                  temp: widget.temp,
                  uvIndex: widget.uvIndex,
                  wmoCode: widget.wmoCode),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 5, top: 15),
                itemCount: savedCities.length,
                itemBuilder: (context, index) {
                  final weatherData = weathers[index];
                  return weatherData != null
                      ? AddCityPageWidget(
                          city: savedCities[index].split(', ')[0],
                          temp: weatherData.current["temperature_2m"],
                          uvIndex: weatherData.hourly["uv_index"][0],
                          wmoCode:
                              weatherData.current["weather_code"].toString())
                      : const Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(
                height: 70,
              )
            ],
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet<dynamic>(
            isScrollControlled: true,
            isDismissible: false,
            enableDrag: true,
            elevation: 10,
            useSafeArea: true,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Constants.darkPrimary
                : Constants.lightPrimary,
            context: context,
            builder: (BuildContext bc) {
              return const SearchCityPage();
            }).then((_) => getSavedCities()),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.lightBlue.shade900
            : Colors.lightBlue.shade50,
        foregroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.lightBlue.shade50
            : Colors.lightBlue.shade900,
        child: const Icon(CupertinoIcons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void getSavedCities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cities = prefs.getStringList('saved_cities');
    savedCities = cities!;
    weathers = await Future.wait(
        savedCities.map((cityData) => _fetchWeatherForCity(cityData)).toList());
    setState(() {});
  }

  Future<Weather> _fetchWeatherForCity(String cityData) async {
    double? latitude = double.parse(cityData.split(', ')[1]);
    double? longitude = double.parse(cityData.split(', ')[2]);

    return await WeatherService()
        .fetchWeather(latitude: latitude, longitude: longitude);
  }
}
