// ignore_for_file: file_names, void_checks, non_constant_identifier_names

import 'dart:convert';

import 'package:aeroaura/utils/routes_consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HorizontalNavigator extends StatefulWidget {
  final Function(int) onPressed;
  final int activeIndex;
  final Map<String, dynamic> daily;
  final Map<String, dynamic> daily_units;
  const HorizontalNavigator(
      {Key? key,
      required this.onPressed,
      required this.activeIndex,
      required this.daily,
      required this.daily_units})
      : super(key: key);

  @override
  State<HorizontalNavigator> createState() => _HorizontalNavigatorState();
}

class _HorizontalNavigatorState extends State<HorizontalNavigator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
            onPressed: () => widget.onPressed(0),
            style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.transparent)),
            child: Column(
              children: [
                Text(
                  "Today",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle_rounded,
                  size: 8,
                  color: widget.activeIndex == 0
                      ? Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black
                      : Colors.transparent,
                )
              ],
            )),
        const SizedBox(
          width: 5,
        ),
        TextButton(
            onPressed: () => widget.onPressed(1),
            style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.transparent)),
            child: Column(
              children: [
                Text(
                  "Tomorrow",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle_rounded,
                  size: 8,
                  color: widget.activeIndex == 1
                      ? Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black
                      : Colors.transparent,
                )
              ],
            )),
        const SizedBox(
          width: 5,
        ),
        Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).pushNamed(
                    AeroAuraRoutesNames.nextSevenDaysPage,
                    pathParameters: {
                      "daily": jsonEncode(widget.daily),
                      "daily_units": jsonEncode(widget.daily_units)
                    });
              },
              style: ButtonStyle(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 18,
                color: Colors.blue,
              ),
              label: const Column(
                children: [
                  Text(
                    "Next 7 Days",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    Icons.circle_rounded,
                    size: 8,
                    color: Colors.blue,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
