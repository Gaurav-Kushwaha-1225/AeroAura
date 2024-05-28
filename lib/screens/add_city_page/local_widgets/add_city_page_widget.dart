import 'package:aeroaura/utils/consts.dart';
import 'package:aeroaura/utils/functions.dart';
import 'package:aeroaura/utils/wmo_code_to_comment.dart';
import 'package:flutter/material.dart';

class AddCityPageWidget extends StatefulWidget {
  final double temp;
  final String wmoCode;
  final String city;
  final double uvIndex;
  const AddCityPageWidget(
      {super.key,
      required this.city,
      required this.temp,
      required this.uvIndex,
      required this.wmoCode});
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
                blurRadius: 1)),
        border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white12
                : Colors.black12,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.city,
                      style: const TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("UV ${uvComment(widget.uvIndex)}",
                      style: const TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 15,
                          fontWeight: FontWeight.w500))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${widget.temp.round()}°",
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Comfortaa",
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      WMOCodeToComment
                          .wmoCode[widget.wmoCode]!["day"]!["description"]!,
                      style: const TextStyle(
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
