import 'package:aeroaura/screens/search_city_page/local_widgets/app_bar.dart';
import 'package:aeroaura/utils/cities.dart';
import 'package:flutter/material.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0,
        expand: false,
        builder: (_, controller) => Column(children: [
              const CustomAppBar(),
              
            ]));
  }
}
