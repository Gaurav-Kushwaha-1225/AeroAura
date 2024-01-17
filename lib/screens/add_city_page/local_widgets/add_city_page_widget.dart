import 'package:aeroaura/utils/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCityPageWidget extends StatefulWidget {
  const AddCityPageWidget({super.key});

  @override
  State<AddCityPageWidget> createState() => _AddCityPageWidgetState();
}

class _AddCityPageWidgetState extends State<AddCityPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Constants.darkTabColor
            : Constants.lightTabColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: List.filled(
            5,
            BoxShadow(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.1),
                blurRadius: 5)),
        border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white12
                : Colors.black12,
            width: 1.5,
            style: BorderStyle.solid),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "California",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("UV Moderate",
                      style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 15,
                          fontWeight: FontWeight.w500))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("18°",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Comfortaa",
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),Text("Clear",
                      style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 15,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
