import 'dart:developer';

import 'package:aeroaura/screens/search_city_page/local_widgets/app_bar.dart';
import 'package:aeroaura/utils/consts.dart';
import 'package:aeroaura/utils/functions.dart';
import 'package:country_state_city/models/city.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchCityPage extends StatefulWidget {
  // final Function onPop;
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  final TextEditingController searchController = TextEditingController();
  late Future<List<City>> suggestedContent;
  late Future<List<City>> totalContent;

  @override
  void initState() {
    super.initState();
    Future<List<City>> city = getCities();
    suggestedContent = city;
    totalContent = city;
  }

  void searchCity(String query) async {
    final List<City> cities = await totalContent;
    final suggestions = cities.where((element) {
      final cityName = element;
      final input = query.toLowerCase();
      return cityName.name.toLowerCase().contains(input);
    }).toList();
    setState(() {
      suggestedContent = Future.value(suggestions);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0,
        expand: false,
        builder: (_, controller) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomAppBar(),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: SearchBar(
                      controller: searchController,
                      hintText: "Search...",
                      hintStyle: MaterialStateProperty.all(const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                      leading: const Padding(
                        padding: EdgeInsets.only(left: 8, right: 5),
                        child: Icon(CupertinoIcons.search),
                      ),
                      onChanged: searchCity,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                      child: FutureBuilder<List<City>>(
                          future: suggestedContent,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: GestureDetector(
                                        onTap: () async {
                                          City selectedCity =
                                              snapshot.data!.elementAt(index);
                                          log(selectedCity.name);

                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();

                                          List<String>? current = prefs
                                              .getStringList('saved_cities');

                                          List<String> value;
                                          if (current == null) {
                                            value = [
                                              '${selectedCity.name}, ${selectedCity.latitude}, ${selectedCity.longitude}'
                                            ];
                                            prefs.setStringList(
                                                'saved_cities', value);
                                          } else if (!current.contains(
                                              '${selectedCity.name}, ${selectedCity.latitude}, ${selectedCity.longitude}')) {
                                            current.add(
                                              '${selectedCity.name}, ${selectedCity.latitude}, ${selectedCity.longitude}');
                                            value = current;
                                            prefs.setStringList(
                                                'saved_cities', value);
                                          }
                                          return Navigator.pop(context);
                                        },
                                        child: Text(
                                            "${snapshot.data!.elementAt(index).name}, ${Constants.isoCodeToCountry[snapshot.data!.elementAt(index).countryCode]!}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    );
                                  });
                            }
                            ;
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.lightBlueAccent,
                              ),
                            );
                          }))
                ]));
  }
}
