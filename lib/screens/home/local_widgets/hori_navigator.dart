// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../utils/const.dart';

class HorizontalNavigator extends StatefulWidget {
  final Function(int) onPressed;
  final int activeIndex;
  const HorizontalNavigator(
      {Key? key, required this.onPressed, required this.activeIndex})
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
                const Text(
                  "Today",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle_rounded,
                  size: 8,
                  color: widget.activeIndex == 0
                      ? Colors.black
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
                const Text(
                  "Tomorrow",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle_rounded,
                  size: 8,
                  color: widget.activeIndex == 1
                      ? Colors.black
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
              onPressed: () => widget.onPressed(2),
              style: ButtonStyle(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Constants.lightPrimary)),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 18,
                color: Colors.blue,
              ),
              label: Column(
                children: [
                  const Text(
                    "Next 7 Days",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Icon(
                    Icons.circle_rounded,
                    size: 8,
                    color: widget.activeIndex == 2
                        ? Colors.blue
                        : Colors.transparent,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
