// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:aeroaura/utils/const.dart';
import 'package:flutter/material.dart';

class VerticalTimeTempWidget extends StatefulWidget {
  const VerticalTimeTempWidget({Key? key}) : super(key: key);

  @override
  State<VerticalTimeTempWidget> createState() => _VerticalTimeTempWidgetState();
}

class _VerticalTimeTempWidgetState extends State<VerticalTimeTempWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 80,
          decoration: BoxDecoration(
              color: Constants.lightTabColor,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                  color: Colors.black12, width: 1.5, style: BorderStyle.solid)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("12 AM",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.5),
                      color: Colors.blue.shade50),
                  child: const Icon(Icons.wb_sunny_rounded,
                      color: Colors.black87, size: 26),
                ),
                const SizedBox(height: 7),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("26",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    SizedBox(width: 1),
                    Text("°C",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start)
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
