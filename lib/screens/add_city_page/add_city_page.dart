import 'package:aeroaura/screens/add_city_page/local_widgets/add_city_page_widget.dart';
import 'package:aeroaura/screens/add_city_page/local_widgets/app_bar.dart';
import 'package:aeroaura/screens/search_city_page/search_city_page.dart';
import 'package:aeroaura/utils/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCityPage extends StatefulWidget {
  const AddCityPage({super.key});

  @override
  State<AddCityPage> createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
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
          return const AddCityPageWidget();
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<dynamic>(
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
              });
        },
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
}
