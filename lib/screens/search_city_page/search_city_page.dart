import 'dart:developer';

import 'package:aeroaura/screens/search_city_page/local_widgets/app_bar.dart';
import 'package:aeroaura/utils/consts.dart';
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
  Iterable<String> suggestedContent = {};
  Iterable<String> totalContent = {};

  @override
  void initState() {
    Iterable<String> city = Constants.cities.keys;
    super.initState();
    suggestedContent = city;
    totalContent = city;
  }

  void searchCity(String query) {
    final suggestions = totalContent.where((element) {
      final cityName = element.toLowerCase();
      final input = query.toLowerCase();

      return cityName.contains(input);
    }).toList();
    setState(() {
      suggestedContent = suggestions;
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
                      child: ListView.builder(
                    itemCount: suggestedContent.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GestureDetector(
                          onTap: () async {
                            String selectedCity =
                                suggestedContent.elementAt(index);
                            log(selectedCity);

                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            List<String>? current =
                                prefs.getStringList('saved_cities');

                            List<String> value;
                            if (current == null) {
                              value = [selectedCity];
                              prefs.setStringList('saved_cities', value);
                            } else if (!current.contains(selectedCity)) {
                              current.add(selectedCity);
                              value = current;
                              prefs.setStringList('saved_cities', value);
                            }
                            return Navigator.pop(context);
                          },
                          child: Text(suggestedContent.elementAt(index),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                        ),
                      );
                    },
                  ))
                ]));
  }
}
