// ignore_for_file: non_constant_identifier_names

import 'package:aeroaura/utils/consts.dart';
import 'package:aeroaura/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NextSevenDaysPage extends StatefulWidget {
  final Map<String, dynamic> daily;
  final Map<String, dynamic> daily_units;
  const NextSevenDaysPage(
      {super.key, required this.daily, required this.daily_units});

  @override
  State<NextSevenDaysPage> createState() => _NextSevenDaysPageState();
}

class _NextSevenDaysPageState extends State<NextSevenDaysPage> {
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            "Next 7 Days",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SafeArea(
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: true,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 10),
                  decoration: BoxDecoration(
                    color: Constants.lightTabColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.black12,
                        width: 1.5,
                        style: BorderStyle.solid),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Tomorrow",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(dateFormatter(now.add(const Duration(days: 1))),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://openweathermap.org/img/wn/02d@2x.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("20",
                                      style: TextStyle(
                                          fontFamily: "Comfortaa",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text(" / 17",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Comfortaa",
                                          fontWeight: FontWeight.bold)),
                                  Text(" °C",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Comfortaa",
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Text("Cloudy",
                                  style: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black54,
                                          width: 1.5,
                                          style: BorderStyle.solid)),
                                  child: const Icon(
                                    CupertinoIcons.wind_snow,
                                    size: 20,
                                  )),
                              const SizedBox(height: 5),
                              const Text("4km/h",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Comfortaa",
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black54,
                                          width: 1.5,
                                          style: BorderStyle.solid)),
                                  child: const Icon(
                                    CupertinoIcons.cloud_bolt_rain_fill,
                                    size: 20,
                                  )),
                              const SizedBox(height: 8),
                              const Text("45%",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Comfortaa",
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black54,
                                          width: 1.5,
                                          style: BorderStyle.solid)),
                                  child: const Icon(
                                    CupertinoIcons.sun_haze_fill,
                                    size: 20,
                                  )),
                              const SizedBox(height: 8),
                              const Text("10%",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Comfortaa",
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
