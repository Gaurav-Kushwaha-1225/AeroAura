import 'package:aeroaura/screens/search_city_page/local_widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  final TextEditingController searchController = TextEditingController();
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
                      hintText: "Search",
                      hintStyle: MaterialStateProperty.all(const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                      leading: const Padding(
                        padding: EdgeInsets.only(left: 8, right: 5),
                        child: Icon(CupertinoIcons.search),
                      ),
                    ),
                  )
                ]));
  }
}
