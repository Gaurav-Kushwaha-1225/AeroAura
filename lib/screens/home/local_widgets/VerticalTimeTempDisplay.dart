// ignore_for_file: file_names

import 'package:flutter/material.dart';

class VerticalTimeTempDisplay extends StatefulWidget {
  const VerticalTimeTempDisplay({Key? key}) : super(key: key);

  @override
  State<VerticalTimeTempDisplay> createState() =>
      _VerticalTimeTempDisplayState();
}

class _VerticalTimeTempDisplayState extends State<VerticalTimeTempDisplay> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
